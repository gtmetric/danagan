import 'package:flutter/material.dart';
import 'package:term_project/pages/authenticate/doctor/signin.dart';
import 'package:term_project/pages/authenticate/doctor/signup.dart';

class DoctorAuthenticate extends StatefulWidget {
  @override
  _DoctorAuthenticateState createState() => _DoctorAuthenticateState();
}

class _DoctorAuthenticateState extends State<DoctorAuthenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return SignIn(toggleView: toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  }
}
