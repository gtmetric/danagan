import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(85, 190, 237, 0.6),
        toolbarHeight: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
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
                // side: BorderSide(color: Colors.red)
              ),
              onPressed: () {
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
      bottomNavigationBar: Container(
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
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
