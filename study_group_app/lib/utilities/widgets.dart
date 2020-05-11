import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onPressed;

  AuthButton(
      {@required this.text,
      this.width = 280.0,
      this.height = 70.0,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17),
      width: width,
      height: height,
      // Login button
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0XFF599ECA),
            letterSpacing: 1.5,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
