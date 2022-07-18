import 'package:flutter/material.dart';
import 'package:smart2/screens/video%20Call%20Screen.dart';
import 'notification details.dart';
int counter = 0;
var ctx;
showNotificationTop(String someOne)async{
    await  notificationsPlugin.initialize(initializationSettings,onSelectNotification: (p)async{
      print('444444444444444444444444444444');
      print(ctx);
    await Navigator.push(ctx, MaterialPageRoute(builder: (context) => VideoCall(),));
    });
  await notificationsPlugin.show(counter++ , "Hi There", someOne, notificationDetails,payload: "sad");
}
