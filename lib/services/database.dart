import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:term_project/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference donorCollection = Firestore.instance.collection('donors');
  final CollectionReference doctorCollection = Firestore.instance.collection('doctors');
  final CollectionReference requirementCollection = Firestore.instance.collection('requirements');

  Future<dynamic> getDonorData() async {
    dynamic snapshot = await donorCollection.document(uid).get();
    dynamic data = snapshot.data;
    return data;
  }

  Future<dynamic> getDoctorData() async {
    dynamic snapshot = await doctorCollection.document(uid).get();
    dynamic data = snapshot.data;
    return data;
  }

  Future<dynamic> getRequirement(String nid) async {
    dynamic snapshot = await requirementCollection.document(nid).get();
    dynamic data = snapshot.data;
    return data;
  }

  Future updateDonorData(String type, String firstName, String lastName,
      String nid, String dob, String phoneNumber, String address) async {
    List<String> organs = ['N/A'];
    return await donorCollection.document(uid).setData({
      'type': type,
      'firstName': firstName,
      'lastName': lastName,
      'nid': nid,
      'dob': dob,
      'phoneNumber': phoneNumber,
      'address': address,
      'status': 'N/A',
      'organs': organs
    });
  }

  Future updateDoctorData(String type, String firstName, String lastName,
      String nid, String hospital, String phoneNumber) async {
    try {
      return await doctorCollection.document(uid).setData({
        'type': type,
        'firstName': firstName,
        'lastName': lastName,
        'nid': nid,
        'hospital': hospital,
        'phoneNumber': phoneNumber
      });
    } catch(e) {
      return e;
    }
  }

  Future updateRequirement(String nid, String firstName, String lastName,
      String desc) async {
    return await requirementCollection.document(nid).setData({
      'doctorId': uid,
      'firstName': firstName,
      'lastName': lastName,
      'description': desc,
      'status': 'Submitted'
    });
  }

  Future updateDonationRequest(List<String> organs) async {
    await donorCollection.document(uid).updateData({
      'status': 'Submitted',
      'organs': organs
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