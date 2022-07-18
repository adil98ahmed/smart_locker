import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class SoundProvider extends ChangeNotifier {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  FlutterSoundPlayer player = FlutterSoundPlayer();
  var status;
  SoundProvider() {
    if (status == null) {
      init();
    }
  }
  init() async {
    status = await Permission.microphone.request();
    if (status == PermissionStatus.granted) {
      print('Yesssss');
    }
  }

  start() async {
    await recorder.openAudioSession();
    await recorder.startRecorder(toFile: "adel.aac");
  }

  stop() async {
    print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    print(await recorder.getRecordURL(path: "adel.aac"));
    await recorder.stopRecorder();
    await recorder.closeAudioSession();
    await uploadSound();

  }

  Dio dio = Dio();
  play() async {
    // var r  = await dio.post("https://tawsil-iq.com/pi/adel.aac");
    // print(r.data);
    await player.openAudioSession();
    //var response = http.post(Uri.parse("https://tawsil-iq.com/pi/adel.aac"));
    final bytes = await http.readBytes(Uri.parse("http://162.19.129.112/pi/test1.wav"));
    player.startPlayer(fromDataBuffer: bytes,whenFinished: ()async{
      await player.closeAudioSession();
    });
    // ByteData bytes = await rootBundle.load("images/ii.wav");
    // Uint8List sound = bytes.buffer.asUint8List(bytes.o  ffsetInBytes,bytes.lengthInBytes);
    // await player.startPlayer(fromData Buffer: sound);
     // await player.startPlayer(
     //
     //   //"http://192.168.0.123/pi/test1.wav"
     //  fromURI: "images/uu.aac",whenFinished: ()async{
     //   await player.closeAudioSession();
     // });

return true;

  }

  Stream<bool> playStream() {
    return Stream.periodic(Duration(milliseconds: 500)).asyncMap((event) async {
      await Future.delayed(Duration(seconds : 3));
      await start();
      await Future.delayed(Duration(seconds: 5));
      await stop();
      await uploadSound();
      //await Future.delayed(Duration(seconds: 2));
      return await play();
    });
  }
  unlock()async{
    var resp = await http.post(Uri.parse("http://162.19.129.112/pi/serv.php"),body: {"open":"1","method":"bell_not"});
    print(resp.body);
  }
  lockTheDoor()async{
    var resp = await http.post(Uri.parse("http://162.19.129.112/pi/serv.php"),body: {"open":"0","method":"bell_not"});
    print(resp.body);
  }
  uploadSound() async {
    print('999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
    File f = File("/data/user/0/com.example.smart2/cache/adel.aac");
    var request = await http.MultipartRequest(
        "POST", Uri.parse("http://162.19.129.112/pi/up.php"));
    var audio = await http.MultipartFile.fromBytes(
        "audio", await f.readAsBytesSync(),
        filename: "adel.aac");
    request.files.add(audio);
    var resp = await request.send();
    print("fffffffffffff ${resp.statusCode}");
  }

 
}
