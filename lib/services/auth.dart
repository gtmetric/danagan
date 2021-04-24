import 'package:firebase_auth/firebase_auth.dart';
import 'package:term_project/models/user.dart';
import 'package:term_project/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:term_project/services/file.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getUid() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    return uid;
  }

  // create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    String type = '';

    if(user!=null) {
      final CollectionReference donorCollection = Firestore.instance.collection('donors');
      donorCollection.document(user.uid).get().then((val) {
        type = val.data['type'];
      });
      return User(uid: user.uid, type: type);
    }
    else return null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in with email and password as a donor
  Future signInWithEmailAndPasswordDonor(String email, String password) async {
    TempFile file = TempFile();
    String type = '';
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print(await file.writeID(user.uid));
      print(await file.readID());
      final CollectionReference donorCollection = Firestore.instance.collection('donors');
      type = (await donorCollection.document(user.uid).get()).data['type'];
      User userModel = _userFromFirebaseUser(user);
      userModel.type = type;
      return userModel;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password as a doctor
  Future signInWithEmailAndPasswordDoctor(String email, String password) async {
    TempFile file = TempFile();
    String type = '';
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print(await file.writeID(user.uid));
      print(await file.readID());
      final CollectionReference donorCollection = Firestore.instance.collection('doctors');
      type = (await donorCollection.document(user.uid).get()).data['type'];
      User userModel = _userFromFirebaseUser(user);
      userModel.type = type;
      return userModel;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign up with email and password
  Future signUpDonor(String email, String password, String type,
      String firstName, String lastName, String nid, String dob,
      String phoneNumber, String address) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateDonorData(type, firstName, lastName, nid, dob, phoneNumber, address);

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpDoctor(String email, String password, String type,
      String firstName, String lastName, String nid, String hospital,
      String phoneNumber) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateDoctorData(type, firstName, lastName, nid, hospital, phoneNumber);

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}