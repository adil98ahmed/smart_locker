import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart2/providers/sound%20provider.dart';
import 'package:smart2/screens/video%20Call%20Screen.dart';

import '../providers/Api Provider.dart';

class CheckDoorScreen extends StatefulWidget {
  const CheckDoorScreen({Key? key}) : super(key: key);

  @override
  _CheckDoorScreenState createState() => _CheckDoorScreenState();
}

class _CheckDoorScreenState extends State<CheckDoorScreen> {
  initState(){
    super.initState();
    context.read<ApiProvider>().startVideo();
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back))
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .9,
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .1),
            child: ElevatedButton(
                onPressed: ()async {
                  await context.read<SoundProvider>().unlock();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green
                ),
                child: Row(
              children: [
                Text("Unlock  "),
                Icon(Icons.lock_open_sharp)
              ],
            )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red
            ),
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VideoCall(),));
              },
              child: Row(
            children: [
              Text("Video Call  "),
              Icon(Icons.video_call)
            ],
          )),
        ],
      ),
    );
  }
}
