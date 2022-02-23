import 'package:flutter/material.dart';
import 'package:term_project/pages/donor/home.dart';
import 'package:term_project/pages/donor/knowledge.dart';
import 'package:term_project/pages/donor/mycard.dart';
import 'package:term_project/services/auth.dart';
import 'package:term_project/services/database.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  final AuthService _auth = AuthService();
  String uid = '';

  List<String> donateOrgans = [];
  bool heart = false;
  bool liver = false;
  bool kidney = false;
  bool lung = false;

  bool message = false;

  void showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.of(context).pop(); },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Request Status"),
      content: Text("You have successfully submitted your Donation Request."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_selectedIndex==0) return Home();
    else if(_selectedIndex==1) return Knowledge();
    else if(_selectedIndex==3) return MyCard();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  'Donation Request',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Select the organ(s) you would like to donate:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Text('Heart'),
                        value: heart,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool val) {
                          setState(() {
                            if(val) donateOrgans.add('Heart');
                            else donateOrgans.remove('Heart');
                            heart = val;
                            print(donateOrgans);
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Liver'),
                        value: liver,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool val) {
                          setState(() {
                            if(val) donateOrgans.add('Liver');
                            else donateOrgans.remove('Liver');
                            liver = val;
                            print(donateOrgans);
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Kidney'),
                        value: kidney,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool val) {
                          setState(() {
                            if(val) donateOrgans.add('Kidney');
                            else donateOrgans.remove('Kidney');
                            kidney = val;
                            print(donateOrgans);
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Lung'),
                        value: lung,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool val) {
                          setState(() {
                            if(val) donateOrgans.add('Lung');
                            else donateOrgans.remove('Lung');
                            lung = val;
                            print(donateOrgans);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xff192550),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    uid = await _auth.getUid();
                    final DatabaseService _databaseService = DatabaseService(uid:uid);
                    await _databaseService.updateDonationRequest(donateOrgans);
                    showAlertDialog(context);
                  },
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
