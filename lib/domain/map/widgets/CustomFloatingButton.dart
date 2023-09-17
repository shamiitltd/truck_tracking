import 'package:flutter/material.dart';

import '../../../config/DynamicConstants.dart';
import '../../../config/StaticConstants.dart';
import '../../../config/colors/colors.dart';
import '../functions/Computational.dart';
import '../functions/RealTimeDb.dart';

class CustomFloatingButton extends StatefulWidget {
  final String selectedUid;
  final double maxZoom;
  const CustomFloatingButton({Key? key, required this.selectedUid, required this.maxZoom})
      : super(key: key);

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  late String selectedUid;
  late double maxZoom;
  var firbaseClass = MapFirebase();


  Future<void> setValues() async {
    selectedUid = widget.selectedUid;
    maxZoom = widget.maxZoom;
    totalDistanceTravelled = await getTotalDistanceTravelled();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setValues();
  }

  @override
  Widget build(BuildContext context) {
    setValues();
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        mainAxisAlignment: isSettingOpen
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          if (isSettingOpen)
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mapFloatingColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: Text('Zoom:${zoomMap.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                  ),
                  Slider(
                    activeColor: AppColors.mapSliderActiveColor,
                    inactiveColor: AppColors.mapSliderInActiveColor,
                    thumbColor: AppColors.mapSliderThumbColor,
                    label: "Zoom Map",
                    value: zoomMap,
                    onChanged: (value) {
                      zoomMap = value;
                      setState(() {});
                    },
                    min: 0.0,
                    max: maxZoom,
                  ),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 6.0,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mapFloatingColor,
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Text('$speed',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: speedFont + 5)),
                              ),
                              Text('Km/h',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: speedFont)),
                            ],
                          ),
                        ),
                        FloatingActionButton(
                          heroTag: UniqueKey(),
                          mini: floatingMini,
                          onPressed: () {
                            focusMe = !focusMe;
                            focusDest = false;
                            getCurrentLocation(firbaseClass);
                            setState(() {});
                          },
                          tooltip: 'Focus Me',
                          child: focusMe
                              ? const Icon(Icons.center_focus_strong)
                              : const ImageIcon(AssetImage(noFocusIcon)),
                        ),
                      ],
                    ),
                    if (selectedUid.isNotEmpty) const SizedBox(width: 8),
                    if (selectedUid.isNotEmpty)
                      FloatingActionButton(
                        heroTag: UniqueKey(),
                        mini: floatingMini,
                        onPressed: () {
                          focusDest = !focusDest;
                          focusMe = false;
                          setState(() {});
                        },
                        tooltip: 'Focus Dest',
                        child: focusDest
                            ? const Icon(Icons.person)
                            : const Icon(Icons.person_off_rounded),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (isSettingOpen)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mapFloatingColor,
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
                                '${(totalDistanceTravelled/1000).toStringAsFixed(2)} Km',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                          ),
                        if (isSettingOpen) const SizedBox(height: 8),
                        if (isSettingOpen)
                          FloatingActionButton(
                            heroTag: UniqueKey(),
                            mini: floatingMini,
                            onPressed: () {
                              setState(() {
                                iconVisible = !iconVisible;
                                MapFirebase().setTraceMe(iconVisible);
                              });
                            },
                            child: iconVisible
                                ? const Icon(Icons.remove_red_eye)
                                : const ImageIcon(AssetImage(inVisibleIcon)),
                          ),
                        if (isSettingOpen) const SizedBox(height: 8),
                        FloatingActionButton(
                          heroTag: UniqueKey(),
                          mini: floatingMini,
                          onPressed: () {
                            setState(() {
                              isSettingOpen = !isSettingOpen;
                            });
                          },
                          child: Icon(
                              isSettingOpen ? Icons.close : Icons.settings),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
