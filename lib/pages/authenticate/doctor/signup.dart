import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_project/services/auth.dart ';
import 'package:term_project/shared/constants.dart';
import 'package:term_project/shared/redloading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  final String type = 'Doctor';
  String email = '';
  String password = '';String nid = '';
  String firstName = '';
  String lastName = '';
  String hospital = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 136, 136, 0.8),
        title: Text('Sign Up'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign In', style: TextStyle(color: Colors.white)),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'National ID Number'),
                  validator: (val) => val.isEmpty ? 'Enter your National ID Number.' : null,
                  onChanged: (val) {
                    nid = val;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                  validator: (val) => val.isEmpty ? 'Enter your first name.' : null,
                  onChanged: (val) {
                    firstName = val;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                  validator: (val) => val.isEmpty ? 'Enter your last name.' : null,
                  onChanged: (val) {
                    lastName = val;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Hospital Name'),
                  validator: (val) => val.isEmpty ? 'Enter your hospital name.' : null,
                  onChanged: (val) {
                    hospital = val;
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Color.fromRGBO(142, 2, 2, 1),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signUpDoctor(email, password, type, firstName, lastName, nid, hospital);
                      if (result == null) setState(() {
                        error = 'Please, enter a valid email.';
                        loading = false;
                      });
                    }
                  },
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
      ),
    );
  }
}
