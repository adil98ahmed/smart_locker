import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart2/providers/Auth%20Provider.dart';
import 'package:smart2/providers/bg%20service%20provider.dart';
import 'package:smart2/screens/update%20Screen.dart';

import '../widgets/option Widget.dart';
import 'Login Screen.dart';
import 'check Person Screen.dart';
import 'logs Screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  initState(){
    super.initState();
    context.read<BgServices>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.purple[100],
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )
                    )
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .90,
                  child: Consumer<AuthProvider>(
                    builder:(context, value, child) =>  Card(
                      elevation: 25,
                      shadowColor: Colors.black54,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "images/p1.jpg",
                            ),
                            radius: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${value.loginUserRespnse!.name}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          Text(
                            "${value.loginUserRespnse!.user}@gmail.com",
                            style: TextStyle(
                                fontSize: 14, color: Colors.purple[200]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  width: MediaQuery.of(context).size.width * .90,
                  child: Card(
                    elevation: 25,
                    shadowColor: Colors.black54,
                    child: ListView(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .1,
                                vertical: 10),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * .7,
                            child: Text(
                              "Options",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple),
                            )),
                        OptionWidget(
                          go: UpdateUser(),
                          optionText: "Edit Profile",
                          icon: EvaIcons.edit,
                        ),
                        OptionWidget(
                          go: LogsScreen(),
                          optionText: "Logs",
                          icon: EvaIcons.options,
                        ),
                        OptionWidget(
                          go: CheckDoorScreen(),
                          optionText: "Check Door",
                          icon: EvaIcons.person,
                        ),
                        OptionWidget(
                          go: LoginScreen(),
                          optionText: "Sign Out",
                          icon: EvaIcons.logInOutline,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
