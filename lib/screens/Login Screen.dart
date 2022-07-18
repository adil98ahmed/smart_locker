import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart2/providers/Auth%20Provider.dart';
import 'package:smart2/screens/profile%20Screen.dart';
import 'package:smart2/screens/register%20screen.dart';

import '../notification/notification function.dart';
import '../widgets/loginTextField.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController(text: "kareem");
  TextEditingController password = TextEditingController(text: "1");
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
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple
                  ),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height*.08,),
                 LoginTextFieldWidget(hint: "Email",obsecure: false,suffixIcon: Icons.email_outlined,controller: username,),
                 LoginTextFieldWidget(hint: "Password",obsecure: true,suffixIcon: EvaIcons.lock,controller: password,),
                SizedBox(height: 50,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.6,
                  child: Consumer<AuthProvider>(
                    builder:(context, value, child) =>  ElevatedButton(
                        onPressed: ()async{
                          var res = await value.login(username.text, password.text);
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
                        child: const Text("Login")),
                  ),
                ),SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                }, child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 20),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
