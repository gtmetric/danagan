import 'package:flutter/material.dart';
import 'package:term_project/pages/doctor/donation.dart';
import 'package:term_project/pages/doctor/home.dart';
import 'package:term_project/pages/doctor/trackcase.dart';
import 'package:term_project/pages/doctor/mycard.dart';
import 'package:term_project/pages/logo.dart';

class DoctorHome extends StatefulWidget {
  DoctorHome({Key key}) : super(key: key);

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  bool auth = true;

  List<Widget> pages = [Home(), TrackCase(), Donation(), MyCard()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if(!auth) return Logo();
    return pages[_selectedIndex];
  }
}