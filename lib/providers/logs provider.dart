import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart2/models/Log%20model.dart';

class LogsProvider extends ChangeNotifier{
  List<LogModel> logs = [];
  SharedPreferences ?preferences;
  int ?uid;
  getLogs()async{
    logs = [];
    try{
      if(preferences ==null){
        preferences = await SharedPreferences.getInstance();
        uid = preferences!.getInt("id");
      }
      var response = await http.post(Uri.parse("http://162.19.129.112/pi/serv.php"),
      body: {
        "method":"logs",
        "uid":"2"
      });
      final data = jsonDecode(response.body).toList();
      data.forEach((element) {
        logs.add(LogModel.fromJson(element));
      });
      print(data);
      notifyListeners();
    }on HttpException catch(e){
      return e.message;
    }
  }
}