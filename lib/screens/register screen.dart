import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart2/providers/Auth%20Provider.dart';
import 'package:smart2/screens/profile%20Screen.dart';

import '../widgets/loginTextField.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nameCont = TextEditingController();
  TextEditingController mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/login.jpg",),
                    opacity: 1,
                    fit: BoxFit.fitHeight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10),
                  child:  Text("SMART LOCK",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.03,),
                const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.08,),
                LoginTextFieldWidget(hint: "Name",obsecure: false,suffixIcon: Icons.account_box_sharp,controller: nameCont,),
                LoginTextFieldWidget(hint: "Mobile Number",obsecure: false,suffixIcon: EvaIcons.phone,controller: mobile,),
                LoginTextFieldWidget(hint: "Email",obsecure: false,suffixIcon: Icons.email_outlined,controller: username,),
                LoginTextFieldWidget(hint: "Password",obsecure: true,suffixIcon: EvaIcons.lock,controller: password,),
                SizedBox(height: 50,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.6,
                  child: Consumer<AuthProvider>(
                    builder:(context, value, child) =>  ElevatedButton(
                        onPressed: ()async{
                          var res = await value.signUp(
                            username.text.trim(),
                            password.text,
                            nameCont.text.trim(),
                            mobile.text.trim()
                          );
                          if(res == null){
                            await Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen(),));
                          }else{
                            showDialog(context: context, builder: (c)=>AlertDialog(
                              title: Text("Error"),
                              content: Text(res.toString()),
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical:20 ),
                            primary: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            )
                        ),
                        child: const Text("Sign Up")),
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
