import 'package:flutter/material.dart';
import 'package:term_project/pages/donor/donation.dart';
import 'package:term_project/pages/donor/home.dart';
import 'package:term_project/pages/donor/mycard.dart';

class Knowledge extends StatefulWidget {
  @override
  _KnowledgeState createState() => _KnowledgeState();
}

class _KnowledgeState extends State<Knowledge> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_selectedIndex==0) return Home();
    else if(_selectedIndex==2) return Donation();
    else if(_selectedIndex==3) return MyCard();
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(85, 190, 237, 0.6),
            toolbarHeight: 25,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
          ),
          body: Container(
            child: Text(
              // TODO: put dummy data here
                'Knowledge'
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
