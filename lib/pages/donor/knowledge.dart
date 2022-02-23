import 'package:flutter/material.dart';
import 'package:term_project/pages/donor/donation.dart';
import 'package:term_project/pages/donor/home.dart';
import 'package:term_project/pages/donor/mycard.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/knowledge_icon.png'),
                      width: 500,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Organ donation",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "is the process when a person allows an organ of their own to be removed and transplanted to another person, legally, either by consent while the donor is alive or dead with the assent of the next of kin.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "General Information about Organ Donation",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: 'QHdPksngqVk', //Add videoID.
                        flags: YoutubePlayerFlags(
                          hideControls: false,
                          controlsVisibleAtStart: true,
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "The Process of Organ Transplantation",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                     YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: 'hCxywDtpIQI', //Add videoID.
                        flags: YoutubePlayerFlags(
                          hideControls: false,
                          controlsVisibleAtStart: true,
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                    ),
                    SizedBox(height: 40),
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
