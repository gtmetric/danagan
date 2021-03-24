import 'package:flutter/material.dart';
import 'package:term_project/pages/authenticate/donor/signin.dart';
import 'package:term_project/pages/authenticate/donor/signup.dart';

class DonorAuthenticate extends StatefulWidget {
  @override
  _DonorAuthenticateState createState() => _DonorAuthenticateState();
}

class _DonorAuthenticateState extends State<DonorAuthenticate> {
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
