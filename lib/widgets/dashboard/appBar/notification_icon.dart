// ignore_for_file: avoid_web_libraries_in_flutter, library_prefixes, library_private_types_in_public_api

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:badges/badges.dart' as BadgesPackage;
import 'package:truck_tracking/config/colors/colors.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key});

  @override
  _NotificationIconState createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  int notificationCount = 0;
  List<String> notifications = [];
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Determine if it's an alert or a regular notification
      bool isAlert = message.data['alert'] == 'true';
      String title = isAlert
          ? 'ALERT: ${message.notification?.title ?? 'Notification'}'
          : message.notification?.title ?? 'Notification';
      String body = message.notification?.body ?? '';

      setState(() {
        notificationCount++;
        notifications.add(title);
      });

      playNotificationSound(isAlert);

      if(isAlert){
        showAlertNotifications(context, body);
      } else {
        showDetailedNotificationDialog(body);
      }

    });
  }

  void playNotificationSound(bool isAlert){
    String soundPath = isAlert ? 'alert_sound.mp3' : 'notification_sound_mp3';

    AudioElement audioElement = AudioElement();
    audioElement.src = soundPath;
    audioElement.play();
  }


  @override
  Widget build(BuildContext context) {
    return notifications.isNotEmpty
        ? BadgesPackage.Badge(
      badgeContent: Text(
        notificationCount.toString(),
        style: const TextStyle(color: AppColors.primaryWhite, fontSize: 8),
      ),
      position: BadgesPackage.BadgePosition.topEnd(top: 2, end: 2),
      child: _buildIconButton(),
    )
        : _buildIconButton();
  }

  IconButton _buildIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          notificationCount = 0;
        });
        showDialog(
          context: context,
          builder: (context) => Container(
            margin: const EdgeInsets.only(left: 800, bottom: 500),
            child: AlertDialog(
              title: const Text("Notifications"),
              contentPadding: const EdgeInsets.all(300),
              content: SizedBox(
                width: 800,
                child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(notifications[index]),
                        onTap: () {
                          if(isAlertNotification(index)){
                            showAlertNotifications(
                                context,
                                notifications[index],
                            );
                          } else {
                            showDetailedNotificationDialog(notifications[index]);
                          }
                        },
                      );
                    }
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      notifications.clear();
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.notifications_none_outlined),
      color: AppColors.black,
      iconSize: 30,
    );
  }

  void showDetailedNotificationDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 16,),
              const Text("Detailed Message")
            ],
          ),
          content: SizedBox(
            width: 800,
            height: 200,
            child: SingleChildScrollView(
              child: Text(message),
            ),
          ),
        )
    );
  }

  void showAlertNotifications(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
              'Alert',
              style: TextStyle(color: AppColors.red),
          ),
          content: Text(message.replaceFirst('ALERT:', '')),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        )
    );
  }

  bool isAlertNotification(int index) {
    return notifications[index].startsWith('ALERT:');
}
}