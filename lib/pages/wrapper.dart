import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_project/models/user.dart';
import 'package:term_project/pages/donor/donorhome.dart';
import 'package:term_project/pages/doctor/doctorhome.dart';
import 'package:term_project/pages/logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:term_project/shared/blueloading.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    // if(user!=null) print(user.type);
    bool isDonor = false;

    // Return either Donor, Doctor, or Logo
    if(user == null) return Logo();
    else {
      final CollectionReference donorCollection = Firestore.instance.collection('donors');
      donorCollection.document(user.uid).get().then((val) {
        setState(() {
          isDonor = val.data!=null;
        });
        // print(val.data);
      });

      // print(isDonor);

      if(isDonor) return DonorHome();
      else if(!isDonor) return DoctorHome();
    }
    // if(user.type=='Donor') return DonorHome();
    // else return DoctorHome();
    return Loading();
  }
}

