import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:term_project/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference donorCollection = Firestore.instance.collection('donors');
  final CollectionReference doctorCollection = Firestore.instance.collection('doctors');
  final CollectionReference donationCollection = Firestore.instance.collection('donation');
  final CollectionReference requirementCollection = Firestore.instance.collection('requirement');

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
      String nid, String hospital, String phoneNumber) async {
    return await doctorCollection.document(uid).setData({
      'type': type,
      'firstName': firstName,
      'lastName': lastName,
      'nid': nid,
      'hospital': hospital,
      'phoneNumber': phoneNumber
    });
  }

  Future updateDonationRequest(List<String> organs) async {
    await donorCollection.document(uid).setData({
      'status': 'Modified'
    });
    return await donationCollection.document(uid).setData({
      'organs': [organs]
    });
  }

  List<User> _userFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(uid: doc.data['uid'], type: doc.data['type']);
    }).toList();
  }

  // get user stream
  Stream<List<User>> get donors {
    return donorCollection.snapshots()
      .map(_userFromSnapshot);
  }
  Stream<List<User>> get doctors {
    return doctorCollection.snapshots()
        .map(_userFromSnapshot);
  }
}