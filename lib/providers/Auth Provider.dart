import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart2/models/login%20user%20model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  LoginUser? loginUser;
  LoginUser? loginUserRespnse;
  Dio dio = Dio();
  SharedPreferences ?preferences;
  login(String username, String password) async {
    loginUser = LoginUser(pass: password, user: username);
    try {
      var response = await http.post(Uri.parse("http://162.19.129.112/pi/serv.php"),body:loginUser!.toJsonLogin());
      print(response.body.runtimeType);
      if(response.body != "false") {
        loginUserRespnse = LoginUser.fromJson(jsonDecode(response.body));
        if(preferences == null){
          preferences = await SharedPreferences.getInstance();
          if(preferences!.getInt("id") == null){
            await preferences!.setInt("id", int.parse(loginUserRespnse!.id!));
          }
        }
      }
      else{
        return "Invalid username or password";
      }
      notifyListeners();
    } on HttpException catch (e) {
      return e.message;
    }
  }

  signUp(String username,String password,String name,String mobile)async{
    loginUser = LoginUser(pass: password, user: username,mobile: mobile,name: name);
    try {
      var response = await http.post(Uri.parse("http://162.19.129.112/pi/serv.php"),body:loginUser!.toJsonsignUp());
      print(response.body.runtimeType);
      if(response.body != "false") {
        loginUserRespnse = LoginUser.fromJson(jsonDecode(response.body));
        await preferences!.setInt("id", int.parse(loginUserRespnse!.id!));
      }
      else{
        return "Invalid username or password";
      }
      notifyListeners();
    } on HttpException catch (e) {
      return e.message;
    }
  }

  checkIfUserLoggedIn()async{
    return await preferences!.getInt("id");

  }
}
