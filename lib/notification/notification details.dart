import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

AndroidInitializationSettings androidInitializationSettings =
const AndroidInitializationSettings("@mipmap/ic_launcher");
InitializationSettings initializationSettings =
InitializationSettings(android: androidInitializationSettings);
AndroidNotificationDetails androidNotificationDetails =
const AndroidNotificationDetails("channelId", "channelName",
    channelDescription: "channel options",
    enableVibration: false,
    priority: Priority.max,
    importance: Importance.high);
NotificationDetails notificationDetails =
NotificationDetails(android: androidNotificationDetails);
FlutterLocalNotificationsPlugin notificationsPlugin =  FlutterLocalNotificationsPlugin();
