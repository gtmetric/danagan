import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_project/models/user.dart';
import 'package:term_project/pages/donor/home.dart';
import 'package:term_project/pages/doctor/home.dart';
import 'package:term_project/pages/logo.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // Return either Donor, Doctor, or Logo
    if(user == null) return Logo();
    else if(user.type=='Donor') return DonorHome();
    else return DoctorHome();
  }
}
