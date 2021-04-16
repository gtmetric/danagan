import 'package:flutter/material.dart';
import 'package:term_project/pages/doctor/home.dart';
import 'package:term_project/pages/doctor/mycard.dart';
import 'package:term_project/pages/doctor/trackcase.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
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
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 136, 136, 0.8),
          toolbarHeight: 25,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        body: Container(
          // TODO: upload organ request to firestore
          child: Text('Donation'),
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
