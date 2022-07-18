import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:smart2/notification/notification%20function.dart';
import 'package:smart2/providers/Api%20Provider.dart';
import 'package:http/http.dart' as http;

onStart(ServiceInstance service)async{
  DartPluginRegistrant.ensureInitialized();
  service.on("setAsForeground").listen((event) {
    print("yyyyyyyyyyyyyyyyy");
  });
  service.on("setAsBackground").listen((event) {
    print("xxxxxxxxxxxxxx");
  });
  print("wwwwwwwwwwwwwwwwwwwwwwwww");
    
  Timer.periodic(const Duration(seconds: 10), (timer) async {
    print("ffffffffffffffffffffff");
    if (service is AndroidServiceInstance) {

      await service.setAsBackgroundService();
    }
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    var response = await http.post(Uri.parse("http://162.19.129.112/pi/serv.php"),
    body: {
      "method":"ring"
    }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print(data);
    if(data["bell"] == "1"){
     await showNotificationTop("Someone Outside");
     await http.post(Uri.parse("http://162.19.129.112/pi/serv.php"),
         body: {
         "method":"closenot"
         });
    }
  });
}