import 'package:flutter/material.dart';
import 'package:term_project/pages/doctor/donation.dart';
import 'package:term_project/pages/doctor/home.dart';
import 'package:term_project/pages/doctor/trackcase.dart';
import 'package:term_project/pages/logo.dart';
import 'package:term_project/services/auth.dart';
import 'package:term_project/services/database.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final AuthService _auth = AuthService();
  bool auth = true;

  String uid = '';
  String firstName = '';
  String lastName = '';
  String nid = '';
  String hospital = '';

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getDoctorData() async {
    uid = await _auth.getUid();
    print(uid);
    final DatabaseService _databaseService = DatabaseService(uid: uid);
    dynamic data = await _databaseService.getDoctorData();
    print(data);
    setState(() {
      firstName = data['firstName'];
      lastName = data['lastName'];
      nid = data['nid'];
      hospital = data['hospital'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDoctorData();
  }

  @override
  Widget build(BuildContext context) {
    if(!auth) return Logo();
      if (_selectedIndex == 0)
        return Home();
      else if (_selectedIndex == 1)
        return TrackCase();
      else if (_selectedIndex == 2) return Donation();
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/icons/doctor_icon.png'),
                  width: 600,
                ),
                SizedBox(height: 0),
                Container(
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doctor Card',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        firstName + ' ' + lastName,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'National ID: ' + nid,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        hospital,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Color.fromRGBO(142, 2, 2, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                    setState(() {
                      auth = false;
                    });
                  },
                ),
                SizedBox(height: 60),
              ],
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

