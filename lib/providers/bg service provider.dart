import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import '../background service/on start method.dart';

class BgServices extends ChangeNotifier{
  bool rr= false;
  FlutterBackgroundService service = FlutterBackgroundService();
  bool started = false;
  BgServices(){
    if(started == false){
      initializeBgService();
      started = true;
    }
  }
  initializeBgService() async {
    await service.configure(
        iosConfiguration: IosConfiguration(
            onForeground: (service) {}, onBackground: (s) => true),
        androidConfiguration: AndroidConfiguration(
            onStart: onStart, isForegroundMode: true, autoStart: true));
  }
}