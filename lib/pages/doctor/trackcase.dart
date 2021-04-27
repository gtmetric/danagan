import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_project/pages/doctor/donation.dart';
import 'package:term_project/pages/doctor/home.dart';
import 'package:term_project/pages/doctor/mycard.dart';
import 'package:term_project/services/auth.dart';
import 'package:term_project/services/database.dart';
import 'package:term_project/shared/constants.dart';

class TrackCase extends StatefulWidget {
  @override
  _TrackCaseState createState() => _TrackCaseState();
}

class _TrackCaseState extends State<TrackCase> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  Widget patientInfo = SizedBox();

  String uid = '';
  String nid = '';
  String error = '';

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      if (_selectedIndex == 0)
        return Home();
      else if (_selectedIndex == 2)
        return Donation();
      else if (_selectedIndex == 3) return MyCard();
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Case Tracking',
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
                  SizedBox(height: 20.0),
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
                          SizedBox(height: 40.0),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            color: Color.fromRGBO(142, 2, 2, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Search',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                uid = await _auth.getUid();
                                final DatabaseService _databaseService = DatabaseService(uid: uid);
                                dynamic result = await _databaseService.getRequirement(nid);
                                if (result == null) setState(() {
                                  error = 'There is no organ request matched to this National ID Number.';
                                });
                                else {
                                  error = '';
                                  setState(() {
                                    patientInfo = PatientInfo(nid,
                                        result['firstName'],
                                        result['lastName'],
                                        result['description'],
                                        result['status']);
                                  });
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
                  patientInfo,
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

Widget PatientInfo(String nid, String firstName, String lastName, String desc, String status) {
  return Column(
    children: [
      SizedBox(height: 20),
      Center(
        child: Text(
          'Patient Information',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Color.fromRGBO(142, 2, 2, 1),
          ),
        ),
      ),
      const Divider(
        height: 20,
        thickness: 4,
        indent: 25,
        endIndent: 25,
        color: Color.fromRGBO(142, 2, 2, 1),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'National ID: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Name: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Status: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Description: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  nid,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  firstName + ' ' + lastName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 140,
                  child: Text(
                    desc,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}