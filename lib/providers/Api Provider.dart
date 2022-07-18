import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ApiProvider extends ChangeNotifier {
  Dio dio = Dio();
  StringBuffer imgUrl = StringBuffer("http://162.19.129.112/pi/person.jpg");
  DefaultCacheManager manager = DefaultCacheManager();

  startVideo() async {
    int counter = 0 ;
    Timer.periodic(Duration(milliseconds: 2500), (timer)async {
     await manager.emptyCache();
     imgUrl = StringBuffer("http://162.19.129.112/pi/person.jpg?${counter++}");
      notifyListeners();
    });
  }

}