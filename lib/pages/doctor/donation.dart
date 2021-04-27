import 'package:flutter/material.dart';
import 'package:term_project/pages/doctor/home.dart';
import 'package:term_project/pages/doctor/mycard.dart';
import 'package:term_project/pages/doctor/trackcase.dart';
import 'package:term_project/services/auth.dart';
import 'package:term_project/services/database.dart';
import 'package:term_project/shared/constants.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String uid = '';
  String nid = '';
  String firstName = '';
  String lastName = '';
  String desc = '';
  String error = '';

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    @override
    Widget build(BuildContext context) {
      if(_selectedIndex==0) return Home();
      else if(_selectedIndex==1) return TrackCase();
      else if(_selectedIndex==3) return MyCard();
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(240, 136, 136, 0.8),
        //   toolbarHeight: 25,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.circular(25),
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Patient Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Color.fromRGBO(142, 2, 2, 1),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 4,
                    indent: 25,
                    endIndent: 25,
                    color: Color.fromRGBO(142, 2, 2, 1),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'National ID Number'),
                            validator: (val) => val.isEmpty ? 'Enter the patient\'s NID number.' : null,
                            onChanged: (val) {
                              setState(() {
                                nid = val;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                            validator: (val) => val.isEmpty ? 'Enter the patient\'s first name.' : null,
                            onChanged: (val) {
                              firstName = val;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                            validator: (val) => val.isEmpty ? 'Enter the patient\'s last name.' : null,
                            onChanged: (val) {
                              lastName = val;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Description\n\n\n'),
                            validator: (val) => val.isEmpty ? 'Enter the patient\'s condition.' : null,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (val) {
                              desc = val;
                            },
                          ),
                          SizedBox(height: 60.0),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            color: Color.fromRGBO(142, 2, 2, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                uid = await _auth.getUid();
                                final DatabaseService _databaseService = DatabaseService(uid: uid);
                                dynamic result = await _databaseService.updateRequirement(nid, firstName, lastName, desc);
                                if (result != null) setState(() {
                                  error = 'The patient information was unexpectedly failed to submit. Please, try again later.';
                                });
                                else {
                                  showAlertDialog(context);
                                  _formKey.currentState.reset();
                                }
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
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromRGBO(240, 136, 136, 0.8),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Track Case',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.medical_services),
                  label: 'Donation',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_ind),
                  label: 'My Card',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color.fromRGBO(142, 2, 2, 0.6),
              onTap: _onItemTapped,
            ),
          ),
        ),
      );
    }
  }

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { Navigator.of(context).pop(); },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Request Status"),
    content: Text("You have successfully submitted your Organ Requirement."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}