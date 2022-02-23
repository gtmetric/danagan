import 'package:flutter/material.dart';
import 'package:term_project/pages/donor/donation.dart';
import 'package:term_project/pages/donor/home.dart';
import 'package:term_project/pages/donor/knowledge.dart';
import 'package:term_project/pages/logo.dart';
import 'package:term_project/services/auth.dart';
import 'package:term_project/services/database.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final AuthService _auth = AuthService();
  String uid = '';
  bool auth = true;

  String firstName = '';
  String lastName = '';
  String dob = '';
  List<String> organs = [];
  String status = '';

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getDonorData() async {
    uid = await _auth.getUid();
    final DatabaseService _databaseService = DatabaseService(uid: uid);
    dynamic data = await _databaseService.getDonorData();
    print(data);
    setState(() {
      firstName = data['firstName'];
      lastName = data['lastName'];
      dob = data['dob'];
      organs = data['organs'].cast<String>();
      status = data['status'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDonorData();
  }

  @override
  Widget build(BuildContext context) {
    if(!auth) return Logo();
    else if (_selectedIndex == 0)return Home();
    else if (_selectedIndex == 1)return Knowledge();
    else if (_selectedIndex == 2) return Donation();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 0),
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Donor Card',
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
                      'Date of Birth: ' + dob,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Donate:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      organs.join(', '),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Column(
                children: [
                  Container(
                    child: Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color(0xff192550),
                        width: 5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Color(0xff192550),
                    ),
                    child: Text('Donation Request: ' + status,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
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
              SizedBox(height: 5),
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
            backgroundColor: Color.fromRGBO(85, 190, 237, 0.6),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: 'Knowledge',
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
            selectedItemColor: Color.fromRGBO(56, 97, 241, 1),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}