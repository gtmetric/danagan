import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(85, 190, 237, 0.7),
        body: Center(
            child: SpinKitRing(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}