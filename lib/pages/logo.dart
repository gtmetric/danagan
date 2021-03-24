import 'package:flutter/material.dart';
import 'package:term_project/pages/authenticate/doctor/authenticate.dart';
import 'package:term_project/pages/authenticate/donor/authenticate.dart';
import 'package:term_project/pages/wrapper.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  bool typeSelected = false;
  bool isDonor = false;

  @override
  Widget build(BuildContext context) {
    if(typeSelected) {
      if(isDonor) return DonorAuthenticate();
      else return DoctorAuthenticate();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: Image.asset('assets/icons/app_icon_cropped.jpg', width: 150)),
            Text(
              'DanaGan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.circle),
            SizedBox(height: 30),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 33),
              color: Color.fromRGBO(85, 190, 237, 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed: () {
                setState(() {
                  typeSelected = true;
                  isDonor = true;
                });
              },
              textColor: Colors.black,
              child: Text(
                'Donor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 15),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              color: Color.fromRGBO(240, 136, 136, 0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed: () {
                setState(() {
                  typeSelected = true;
                  isDonor = false;
                });
              },
              textColor: Colors.black,
              child: Text(
                'Doctor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
