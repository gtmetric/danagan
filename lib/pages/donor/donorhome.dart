import 'package:flutter/material.dart';
import 'package:term_project/models/user.dart';
import 'package:term_project/pages/donor/donation.dart';
import 'package:term_project/pages/donor/home.dart';
import 'package:term_project/pages/donor/knowledge.dart';
import 'package:term_project/pages/donor/mycard.dart';
import 'package:term_project/pages/logo.dart';

class DonorHome extends StatefulWidget {
  User user;
  DonorHome({Key key, @required this.user}) : super(key: key);

  @override
  _DonorHomeState createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  bool auth = true;

  List<Widget> pages = [Home(), Knowledge(), Donation(), MyCard()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if(!auth) return Logo();
    return pages[_selectedIndex];
  }
}