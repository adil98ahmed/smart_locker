import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/edit profile text field.dart';


class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key}) : super(key: key);

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.purple[100],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Update Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        height: MediaQuery.of(context).size.height * .25,
                        child: Card(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("images/p1.jpg"),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.grey),
                                  onPressed: () {},
                                  child: Text("Pick Image"))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const EditProfileTextFieldWidget(
                          obsecure: false,
                          hint: "update user name",
                          suffixIcon: EvaIcons.edit),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text("Password"),
                      ),
                      const EditProfileTextFieldWidget(
                          obsecure: true,
                          hint: "New Password",
                          suffixIcon: EvaIcons.lock),
                      const EditProfileTextFieldWidget(
                          obsecure: true,
                          hint: "Confirm Password",
                          suffixIcon: EvaIcons.lock),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Save"))),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Discard"))),
                    ],
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
