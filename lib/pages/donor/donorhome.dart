import 'package:flutter/material.dart';
import 'package:term_project/models/user.dart';
import 'package:term_project/pages/donor/donation.dart';
import 'package:term_project/pages/donor/home.dart';
import 'package:term_project/pages/donor/knowledge.dart';
import 'package:term_project/pages/donor/mycard.dart';
import 'package:term_project/pages/logo.dart';
import 'package:term_project/services/auth.dart';

class DonorHome extends StatefulWidget {
  User user;
  DonorHome({Key key, @required this.user}) : super(key: key);

  @override
  _DonorHomeState createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  // final AuthService _auth = AuthService();
  bool auth = true;

  List<Widget> pages = [Home(), Knowledge(), Donation(), MyCard()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    if(!auth) return Logo();
    return pages[_selectedIndex];
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Color.fromRGBO(85, 190, 237, 0.6),
    //     toolbarHeight: 25,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //         bottom: Radius.circular(25),
    //       ),
    //     ),
    //   ),
    //   body: pages[_selectedIndex],
    //   bottomNavigationBar: Container(
    //     height: 70,
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(25.0),
    //         topRight: Radius.circular(25.0),
    //       ),
    //       child: BottomNavigationBar(
    //         type: BottomNavigationBarType.fixed,
    //         backgroundColor: Color.fromRGBO(85, 190, 237, 0.6),
    //         items: const <BottomNavigationBarItem>[
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.home),
    //             label: 'Home',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.menu_book),
    //             label: 'Knowledge',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.medical_services),
    //             label: 'Donation',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.assignment_ind),
    //             label: 'My Card',
    //           ),
    //         ],
    //         currentIndex: _selectedIndex,
    //         selectedItemColor: Color.fromRGBO(56, 97, 241, 1),
    //         onTap: _onItemTapped,
    //       ),
    //     ),
    //   ),
    // );
  }
}