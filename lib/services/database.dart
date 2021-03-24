import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference donorCollection = Firestore.instance.collection('donors');
  final CollectionReference doctorCollection = Firestore.instance.collection('doctors');

  Future updateUserData(String type, String firstName, String lastName, String nid) async {
    return await userCollection.document(uid).setData({
      'type': type,
      'firstName': firstName,
      'lastName': lastName,
      'nid': nid
    });
  }

  Future updateDonorData(String type, String firstName, String lastName,
      String nid, String dob, String phoneNumber, String address) async {
    return await donorCollection.document(uid).setData({
      'type': type,
      'firstName': firstName,
      'lastName': lastName,
      'nid': nid,
      'dob': dob,
      'phoneNumber': phoneNumber,
      'address': address
    });
  }

  Future updateDoctorData(String type, String firstName, String lastName,
      String nid, String hospital) async {
    return await doctorCollection.document(uid).setData({
      'type': type,
      'firstName': firstName,
      'lastName': lastName,
      'nid': nid,
      'hospital': hospital
    });
  }

  // get user stream
  Stream<QuerySnapshot> get brews {
    return userCollection.snapshots();
  }
}