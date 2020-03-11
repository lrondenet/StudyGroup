import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool needsToRegister = false;

  void registerOrSignIn() {
    setState(() {
      needsToRegister = !needsToRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (needsToRegister) {
      return Register(toggleView: registerOrSignIn);
    } else {
      return SignIn(toggleView: registerOrSignIn);
    }
  }
