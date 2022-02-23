import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_project/pages/donor/donorhome.dart';
import 'package:term_project/pages/logo.dart';
import 'package:term_project/services/auth.dart';
import 'package:term_project/shared/constants.dart';
import 'package:term_project/shared/blueloading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool auth = false;
  bool returnLogo = false;

  String email;
  String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    if(returnLogo) return Logo();
    else if(auth) return DonorHome();
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(85, 190, 237, 0.6),
        title: Text('Sign In'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign Up', style: TextStyle(color: Colors.white)),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 70.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email.' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6 characters long.' : null,
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: Color(0xff192550),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Go Back',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        returnLogo = true;
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: Color(0xff192550),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPasswordDonor(email, password);
                        if (result == null) setState(() {
                          error = 'Please, enter a valid email and password.';
                          loading = false;
                        });
                        else setState(() {
                          auth = true;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(error,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
