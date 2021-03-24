import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_project/pages/wrapper.dart';
import 'package:term_project/services/auth.dart';
import 'package:term_project/models/user.dart';

// void main() => runApp(MaterialApp(
//     initialRoute: '/',
//     routes: {
//       '/': (context) => Loading(),
//       '/home': (context) => Home(),
//     }
// ));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>. value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
