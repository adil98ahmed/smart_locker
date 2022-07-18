import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/Login Screen.dart';

class OptionWidget extends StatefulWidget {
  final String optionText;
  final Widget go;
  final IconData icon;
  const OptionWidget(
      {Key? key,
      required this.icon,
      required this.optionText,
      required this.go})
      : super(key: key);

  @override
  _OptionWidgetState createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .7,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    primary: Colors.purple),
                onPressed: () {
                  if (widget.go is LoginScreen){
                    Navigator.pop(context);

                  }else{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => widget.go,
                        ));
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(widget.icon),
                    Text("   " + widget.optionText),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
