import 'package:flutter/material.dart';
import 'package:term_project/pages/donor/donation.dart';
import 'package:term_project/pages/donor/knowledge.dart';
import 'package:term_project/pages/donor/mycard.dart';
import 'package:term_project/pages/logo.dart';
import 'package:term_project/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool auth = true;

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_selectedIndex==1) return Knowledge();
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage('assets/icons/people_icon.png'),
                width: 280,
                height: 180,
              ),
              RaisedButton(
                color: Color.fromRGBO(85, 190, 237, 0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                onPressed: () async {
                  _onItemTapped(2);
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                  child: Container(
                    width: 155,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('+ ',
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold)),
                        Text(
                          "DONATE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          height: 130,
                          child: Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffd2d2d2),
                                width: 5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd2d2d2),
                            ),
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "REGISTERED",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 19),
                                Container(
                                  width: 140,
                                  height: 60,
                                  child: Container(
                                    width: 140,
                                    height: 51,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 11,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "126,440",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 130,
                          child: Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffd2d2d2),
                                width: 5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd2d2d2),
                            ),
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "DONATED",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 19),
                                Container(
                                  width: 140,
                                  height: 60,
                                  child: Container(
                                    width: 140,
                                    height: 51,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 11,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "315",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          height: 130,
                          child: Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffd2d2d2),
                                width: 5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd2d2d2),
                            ),
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "SAVED",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 19),
                                Container(
                                  width: 140,
                                  height: 60,
                                  child: Container(
                                    width: 140,
                                    height: 51,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 11,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "697",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 130,
                          child: Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffd2d2d2),
                                width: 5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd2d2d2),
                            ),
                            padding: const EdgeInsets.only(
                              top: 12,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "WAITING FOR\nDONATION",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  width: 140,
                                  height: 60,
                                  child: Container(
                                    width: 140,
                                    height: 51,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                    padding: const EdgeInsets.only(
                                      top: 11,
                                      bottom: 10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "5,735",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
