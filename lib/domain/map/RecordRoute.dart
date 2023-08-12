import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as LatLngG;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_tracking/domain/map/widgets/CustomFloatingButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

import '../../config/DynamicConstants.dart';
import '../../config/StaticConstants.dart';
import '../../shared/functions/Computational.dart';
import '../../shared/functions/popupSnakbar.dart';
import 'config/constants.dart';
import 'functions/Computational.dart';
import 'functions/DirectionsRepository.dart';
import 'functions/RealTimeDb.dart';
import 'models/Directions.dart';

class MapRecordPageOSM extends StatefulWidget {
  const MapRecordPageOSM({Key? key}) : super(key: key);

  @override
  State<MapRecordPageOSM> createState() => MapRecordPageOSMState();
}

class MapRecordPageOSMState extends State<MapRecordPageOSM> {
  final databaseReference = FirebaseDatabase.instance.ref();
  MapController mapController = MapController();
  var firbaseClass = MapFirebase();
  Location location = Location();
  final user = FirebaseAuth.instance.currentUser;
  final Vector3 _orientation = Vector3.zero();
  List<Marker> markers = [];
  List<LatLng> polyline = [];
  LatLngBounds? bounds;
  late LatLng destination;
  late LatLng myLocation;
  late LatLng mapCameraLocation;
  LocationData? currentLocationData;
  LocationData? currentLocationDataOld;
  late StreamSubscription _firebaseSubscriptionMe;
  late StreamSubscription _firebaseSubscriptionBus;
  late StreamSubscription _firebaseSubscriptionUserBus;
  late Directions _info;

  Set<Marker> markerSet = {};
  Set<Map<dynamic, dynamic>> allUserCompleteData = {};

  Map<dynamic, dynamic> currentUserdata = <dynamic, dynamic>{};
  Map<dynamic, dynamic> selectedUserdata = <dynamic, dynamic>{};
  String currentUid = '';
  String selectedUid = '';
  String _selectedRoute = '';
  var defaultIcon = personIconAsset;
  bool infoUpdate = false;
  bool isSetPloyLine = false;
  bool _mounted = true;
  bool isLocationReady = true;
  bool isPolylineReady = false;
  bool isRouteLoaded = true;
  bool isUserBus = false;

  Future<void> setUp() async {
    getMyInfo();
    getCurrentLocation();
    startSensors();
    zoomMap = await getZoomLevel(); //from sharedPrefs
    focusMe = true;
    if (_mounted) {
      setState(() {});
    }
  }

  void loadRouteInfo() async {
    List<String> routeList = [];
    databaseReference.child("routes").onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic> data =
          event.snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        routeList.add(value);
      });
      if (_mounted) {
        setState(() {
          userRoute = routeList;
        });
      }
    });
  }

  Future getMyInfo() async {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('users/${user?.uid}');
    _firebaseSubscriptionMe =
        starCountRef.onValue.listen((DatabaseEvent event) {
      currentUserdata = event.snapshot.value as Map<dynamic, dynamic>;
      myCategory = currentUserdata['post'] == 'Driver' ? 'buses' : 'users';
      myRoute = currentUserdata['route'];
      currentUserdata['post'] == 'Driver'
          ? getBusAndUsersInfoByRootId(myRoute)
          : getBusInfoByRootId(myRoute);
      if (currentUserdata['routeAccess'] == true && isRouteLoaded == true) {
        isRouteLoaded = false;
        loadRouteInfo();
      }

      if (_mounted) {
        getLocationIcon();
        updateMakers();
        setState(() {});
      }
    });
  }

  Future getBusAndUsersInfoByRootId(String route) async {
    isUserBus = true;
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref().child("routesAll/$route");
    _firebaseSubscriptionUserBus =
        starCountRef.onValue.listen((DatabaseEvent event) {
      allUserCompleteData = {};
      if (event.snapshot.value == null) return;
      Map<dynamic, dynamic> data =
          event.snapshot.value as Map<dynamic, dynamic>;
      if (data["buses"] != null) {
        data["buses"].forEach((key, value) {
          if (key != user?.uid) {
            value['icon'] = "bus";
            allUserCompleteData.add({key: value});
          }
        });
      }
      if (data["users"] != null) {
        data["users"].forEach((key, value) {
          value['icon'] = "person";
          allUserCompleteData.add({key: value});
        });
      }
      if (_mounted) {
        updateMakers();
        setState(() {});
      }
    });
  }

  Future getBusInfoByRootId(String route) async {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref().child("routesAll/$route/buses");
    _firebaseSubscriptionBus =
        starCountRef.onValue.listen((DatabaseEvent event) {
      allUserCompleteData = {};
      if (event.snapshot.value == null) return;
      Map<dynamic, dynamic> data =
          event.snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        value['icon'] = "bus";
        allUserCompleteData.add({key: value});
      });
      if (_mounted) {
        updateMakers();
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    final user = this.user;
    if (user != null) {
      currentUid = user.uid;
    }
    setUp();
  }

  Future<void> firstDistanceLoaded(double newDistance) async {
    if (!distanceLoaded) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('totalDistance', newDistance);
      distanceLoaded = true;
      if (_mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    _mounted = false;
    _firebaseSubscriptionMe.cancel();
    isUserBus
        ? _firebaseSubscriptionUserBus.cancel()
        : _firebaseSubscriptionBus.cancel();
    mapController.dispose();
    super.dispose();
  }

  Future<void> getLocationIcon() async {
    firstDistanceLoaded(currentUserdata['distance'] ?? 0);
    if (currentUserdata['trackMe'] == true) {
      defaultIcon = currentUserdata['post'] == 'Driver'
          ? busTopIconAsset
          : personIconAsset;
    } else {
      defaultIcon = currentUserdata['post'] == 'Driver'
          ? busTopOffIconAsset
          : personOffIconAsset;
    }
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.changeSettings(
        accuracy: LocationAccuracy.high, interval: 10, distanceFilter: 0);
    location.getLocation().then((value) {
      currentLocationData = value;
      myLocation = LatLng(setPrecision(currentLocationData!.latitude!, 3),
          setPrecision(currentLocationData!.longitude!, 3));
      mapCameraLocation = myLocation;
      isPolylineReady = true;
      if (_mounted) {
        setState(() {});
      }
    });

    location.onLocationChanged.listen((newLocation) async {
      currentLocationData = newLocation;
      speed = ((currentLocationData?.speed ?? 0) * speedBias).toInt();
      if (currentUserdata['trackMe'] == true) {
        firbaseClass.setMyCoordinatesOptimized(
            currentLocationData!.latitude!.toString(),
            currentLocationData!.longitude!.toString(),
            bearingMap);
      }
      myLocation = LatLng(setPrecision(currentLocationData!.latitude!, 3),
          setPrecision(currentLocationData!.longitude!, 3));
      currentLocationDataOld =
          await updateDistanceTravelled(currentLocationData);
      if (_mounted) {
        updateMakers();
        mapCameraController();
        setState(() {});
      }
    });
    await location.enableBackgroundMode(enable: isLocationBackground);
  }

  Future<LocationData?> updateDistanceTravelled(
      LocationData? currentLocationData) async {
    currentLocationDataOld ??= currentLocationData;
    var distance = const Distance();
    final meter = distance(
        LatLng(currentLocationDataOld!.latitude!,
            currentLocationDataOld!.longitude!),
        LatLng(currentLocationData!.latitude!, currentLocationData.longitude!));
    if (recordingStart) {
      distanceTravelled += meter;
      await setTotalDistanceTravelled(firbaseClass, meter);
    }
    currentLocationDataOld = currentLocationData;
    return currentLocationData; //now this will became old data.
  }

  void startSensors() {
    FlutterCompass.events?.listen((event) {
      if (_mounted) {
        setState(() {
          bearingMap = event.heading!;
        });
      }
    });
    motionSensors.isOrientationAvailable().then((available) {
      if (available) {
        motionSensors.orientation.listen((OrientationEvent event) {
          if (_mounted) {
            setState(() {
              _orientation.setValues(event.yaw, event.pitch, event.roll);
              tiltMap = degrees(_orientation.y);
            });
          }
        });
      }
    });
  }

  Future<void> mapCameraController() async {
    if (focusMe || focusDest) {
      try {
        if (focusMe) {
          // mapController.centerZoomFitBounds(bounds!);
          mapController.moveAndRotate(
              LatLng(currentLocationData!.latitude!,
                  currentLocationData!.longitude!),
              zoomMap,
              netDirectionMyMap(bearingMap));
        } else if (selectedUid.isNotEmpty) {
          mapController.moveAndRotate(
              destination, zoomMap, netDirectionMyMap(bearingMap));
        }
      } catch (e) {}
    }
  }

  void getPolyPoints() async {
    if (selectedUid.isEmpty) {
      return;
    }
    final direction = await DirectionsRepository().getOsmDirections(
        origin: LatLngG.LatLng(
            currentLocationData!.latitude!, currentLocationData!.longitude!),
        destination: convertLatLangToGLatLang(destination));
    bounds = LatLngBounds(
        LatLng(direction.bounds.northeast.latitude,
            direction.bounds.northeast.longitude),
        LatLng(direction.bounds.southwest.latitude,
            direction.bounds.southwest.longitude));
    polyline = convertPointLatLngToLatLng(direction.polylinePoints);

    infoUpdate = true;
    _info = direction;
    if (_mounted) {
      setState(() {});
    }
  }

  Future showSelectedUserInfoPopup(String Uid) async {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('users/$Uid');
    starCountRef.onValue.listen((DatabaseEvent event) {
      selectedUserdata = event.snapshot.value as Map<dynamic, dynamic>;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              title: Text(
                  '${selectedUserdata['post']}: ${selectedUserdata['name']}'),
              content: InkWell(
                onTap: () {
                  PopupSnackBar().makePhoneCall(selectedUserdata['phone']);
                },
                child: Text(
                  'Call: ${selectedUserdata['phone']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
              ));
        },
      );
    });
  }

  void updateMakers() async {
    if (currentLocationData == null) return;
    if (selectedUid.isNotEmpty) {
      var val = allUserCompleteData
          .firstWhere((element) => element.containsKey(selectedUid));
      destination = LatLng(double.parse(val[selectedUid]['latitude']),
          double.parse(val[selectedUid]['longitude']));
    }
    markers = [];
    markers.add(Marker(
        key: Key(user?.email as String),
        width: 50,
        height: 50,
        rotate: true,
        point: LatLng(
            currentLocationData!.latitude!, currentLocationData!.longitude!),
        builder: (ctx) => Transform.rotate(
              angle: degreeToRadians(normalizeAngle(bearingMap)),
              child: IconButton(
                icon: Image.asset(defaultIcon),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        title: Text(
                            '${currentUserdata['post']}: ${user?.displayName}'),
                        content: Text('Phone: ${currentUserdata['phone']}'),
                      );
                    },
                  );
                },
              ),
            )));

    for (var element in allUserCompleteData) {
      element.forEach((key, value) async {
        String mapIcon =
            value['icon'] == 'bus' ? busTopIconAsset : personIconAsset;
        double netDirection =
            netRotationDirection(value['direction'] ?? 0, bearingMap);
        markers.add(Marker(
            key: Key(key),
            width: 50,
            height: 50,
            rotate: true,
            point: LatLng(double.parse(value['latitude']),
                double.parse(value['longitude'])),
            builder: (ctx) => Transform.rotate(
                  angle: degreeToRadians(normalizeAngle(netDirection)),
                  child: IconButton(
                    icon: Image.asset(mapIcon),
                    onPressed: () {
                      selectedUid = key;
                      destination = LatLng(double.parse(value['latitude']),
                          double.parse(value['longitude']));
                      getPolyPoints();
                      focusDest = true;
                      showSelectedUserInfoPopup(selectedUid);
                    },
                  ),
                )));
      });
    }
    if (_mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUid.isNotEmpty && currentUserdata['trackMe'] != null) {
      setState(() {
        _selectedRoute = currentUserdata['route'];
        iconVisible = currentUserdata['trackMe'];
        myRoute = _selectedRoute;
      });
    }
    if (isPolylineReady) {
      isPolylineReady = false;
      getPolyPoints();
      Future.delayed(Duration(seconds: directionApiDelay), () {
        isPolylineReady = true;
        if (infoUpdate) directionApiDelay = 30;
        if (_mounted) setState(() {});
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mapNavColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Text(
                'R:',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            Expanded(
              flex: 5,
              child: _selectedRoute.isNotEmpty
                  ? ((userRoute.isNotEmpty)
                      ? DropdownButton(
                          value: _selectedRoute,
                          items: userRoute.map((route) {
                            return DropdownMenuItem(
                              value: route,
                              child: Text(route),
                            );
                          }).toList(),
                          onChanged: (value) async {
                            myOldRoute = _selectedRoute;
                            _selectedRoute = value ?? '';
                            selectedUid = '';
                            infoUpdate = false;
                            polyline = [];
                            myRoute = _selectedRoute;
                            getLocationIcon();
                            updateMakers();
                            await firbaseClass
                                .setRouteOptimized(_selectedRoute);
                            if (_mounted) setState(() {});
                          },
                        )
                      : Text(
                          currentUserdata['route'] ?? 'Loading..',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20.0),
                        ))
                  : const Text('Loading..', textAlign: TextAlign.start),
            ),
            Expanded(
              flex: 5,
              child: Text(
                '${(distanceTravelled / 1000).toStringAsFixed(2)}Km',
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 11.0, bottom: 11.0, right: 4),
                child: LiteRollingSwitch(
                  width: 90,
                  //initial value
                  onTap: () => {},
                  onDoubleTap: () => {},
                  onSwipe: () => {},
                  value: recordingStart,
                  textOn: 'End',
                  textOff: 'Start',
                  colorOn: Colors.greenAccent[700] as Color,
                  colorOff: Colors.redAccent[700] as Color,
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    setState(() {
                      recordingStart = state;
                      // focusLiveLocation = value;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
      body: currentLocationData == null
          ? Center(
              child: TextButton(
                onPressed: () {
                  getCurrentLocation();
                },
                child: const Text('Click here to Reload'),
              ),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    onPositionChanged: (position, hasGesture) {
                      if (isLocationReady) {
                        isLocationReady = false;
                        focusMe = compareLatLang(
                            convertLatLangToGLatLang(myLocation),
                            convertLatLangToGLatLang(position.center!),
                            zoomPrecision);
                        if (selectedUid.isNotEmpty) {
                          focusDest = compareLatLang(
                              convertLatLangToGLatLang(destination),
                              convertLatLangToGLatLang(position.center!),
                              zoomPrecision);
                        }
                        Future.delayed(const Duration(seconds: 2), () {
                          isLocationReady = true;
                          if (_mounted) setState(() {});
                        });
                      }
                      if (_mounted) setState(() {});
                    },
                    bounds: bounds,
                    rotation: netDirectionMyMap(bearingMap),
                    zoom: zoomMap,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      // urlTemplate:'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: packageName,
                      subdomains: ['a', 'b', 'c'],
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          strokeWidth: 3,
                          points: polyline,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: markers,
                    )
                  ],
                ),
                if (infoUpdate)
                  Positioned(
                    top: 20.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: Text(
                        '${_info.totalDistance}, ${_info.totalDuration}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
      floatingActionButton:
          CustomFloatingButton(selectedUid: selectedUid, maxZoom: 15),
    );
  }
}
