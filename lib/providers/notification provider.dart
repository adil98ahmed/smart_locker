import 'package:flutter/material.dart';
import 'package:smart2/notification/notification%20function.dart';

import '../notification/notification details.dart';

class NotificationProvider extends ChangeNotifier{

  showNotification(double price)async{
    bool isNotificationInitialized =false;
    if(!isNotificationInitialized){
      await  notificationsPlugin.initialize(initializationSettings);
      isNotificationInitialized = true;
    }
    await notificationsPlugin.show(price.toInt(), "New", price.toString(), notificationDetails);
  }

}