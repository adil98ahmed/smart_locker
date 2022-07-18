import 'package:flutter/material.dart';

class EditProfileTextFieldWidget extends StatefulWidget {
  final String hint;
  final IconData suffixIcon;
  final bool obsecure;
  const EditProfileTextFieldWidget(
      {Key? key,
        required this.obsecure,
        required this.hint,
        required this.suffixIcon})
      : super(key: key);

  @override
  _EditProfileTextFieldWidgetState createState() => _EditProfileTextFieldWidgetState();
}

class _EditProfileTextFieldWidgetState extends State<EditProfileTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1, vertical: 10),
      child: TextField(

        obscureText: widget.obsecure,
        decoration: InputDecoration(
          constraints: BoxConstraints(
          ),
            focusColor: Colors.white,
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hint,
            suffixIcon: Icon(widget.suffixIcon),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
