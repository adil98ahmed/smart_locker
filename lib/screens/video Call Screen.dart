import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:smart2/background%20service/on%20start%20method.dart';
import 'package:smart2/providers/Api%20Provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../notification/notification function.dart';
import '../providers/sound provider.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1,
                      color: Colors.purple[100],
                      child: Stack(
                        children: [
                          Positioned(
                              top: 19,
                              left: 0,
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .4,
                                color: Colors.white,
                                child: Consumer<ApiProvider>(
                                    builder: (context, value, child)
                                             {
                                               return Column(
                                                 children: [

                                                   CachedNetworkImage(imageUrl: StringBuffer(value.imgUrl).toString(),

                                                   )
                                                  ],
                                               );
                                             }),
                              )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<SoundProvider>(
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width * .1),
              child: StreamBuilder<bool>(
                stream: value.playStream(),
                builder:(context, snapshot) =>  ElevatedButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      //value.start();
                      //value.unlock();

                      value.unlock();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Row(
                      children: [Text("Unlock"), Icon(Icons.lock_open_sharp)],
                    )),
              ),
            ),
            GestureDetector(
              onLongPressStart: (s){
                value.start();
              },
              onLongPressEnd: (w)async{
                await value.stop();
                await value.uploadSound();
                await Future.delayed(Duration(seconds: 4));
                await value.play();
              },
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: (){
                  },
                  child: InkWell(
                    child: Row(
                      children: [
                        Text("Talk"),
                      ],
                    ),
                  )
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  //Navigator.pop(context);
                  value.lockTheDoor();
                },
                child: Row(
                  children: [
                    Text("Lock Door"),
                  ],
                )),



          ],
        ),
      ),
    );
  }
}
