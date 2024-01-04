// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:truck_tracking/screens/Shipping/events.dart';

class QuickAccess extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final events;
  const QuickAccess({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    this.events,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        beforeLineStyle: LineStyle(color: isPast ? Colors.indigo.shade900 : Colors.grey),

        indicatorStyle: IndicatorStyle(
          width: 25,
          color: isPast ? Colors.indigo.shade900 : Colors.grey,
          iconStyle: IconStyle(
              iconData: isPast ? Icons.done : Icons.clear,
              color: isPast ? Colors.white : Colors.grey
          ),
        ),
        endChild: Events(
          isPast: isPast,
          child: events,
        ),
      ),
    );
  }
}