import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTracking extends StatefulWidget {
  final double latitude;
  final double longitude;

  const LocationTracking({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<LocationTracking> createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> with TickerProviderStateMixin{
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _markerPosition = const LatLng(0.0, 0.0);
  LatLng _secondMarkerPosition = const LatLng(0.0, 0.0);

  List<LatLng> polylineCoordinates = [];
  Set<Polyline> _polylines = {};

  void updateMarkerPosition(double lat, double lng) {
    setState(() {
      _markerPosition = LatLng(lat, lng);
    });
    _controller.future.then((mapController){
      mapController.animateCamera(CameraUpdate.newLatLng(_markerPosition));
    });
  }

  void updateSecondMarkerPosition(double lat, double lng) {
    setState(() {
      _secondMarkerPosition = LatLng(lat, lng);
    });
  }

  void getPolyLines() async{
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDcBv34SwzPx3TL01GNvwfDr9AnJ1ctK7c",
        PointLatLng(_markerPosition.latitude, _markerPosition.longitude),
        PointLatLng(_secondMarkerPosition.latitude, _secondMarkerPosition.longitude)
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
          polylineId: PolylineId("route"),
          points: polylineCoordinates,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ]
      ),
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController mapController){
              _controller.complete(mapController);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.latitude, widget.longitude),
              zoom: 12.5,
            ),
            markers:{
              Marker(
                markerId: MarkerId("currentLocation"),
                position: _markerPosition,
                
              ),
              Marker(
                markerId: MarkerId("secondLocation"),
                position: _secondMarkerPosition,
              ),
            },
            polylines: _polylines,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    updateMarkerPosition(widget.latitude, widget.longitude);
    updateSecondMarkerPosition(11.786253, 77.800781);
    getPolyLines();
  }


  @override
  void didUpdateWidget(LocationTracking oldWidget){
    super.didUpdateWidget(oldWidget);
    updateMarkerPosition(widget.latitude, widget.longitude);
    updateSecondMarkerPosition(11.786253, 77.800781);
    getPolyLines();
  }
}