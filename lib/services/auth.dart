import 'package:firebase_auth/firebase_auth.dart';
import 'package:term_project/models/user.dart';
import 'package:term_project/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
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
      User userObj = _userFromFirebaseUser(user);

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateDonorData(type, firstName, lastName, nid, dob, phoneNumber, address);

      // await DatabaseService(uid: user.uid).updateUserData('Donor', 'meow', 'mao', '123456');

      return userObj;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpDoctor(String email, String password, String type,
      String firstName, String lastName, String nid, String hospital) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      User userObj = _userFromFirebaseUser(user);

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateDoctorData(type, firstName, lastName, nid, hospital);

      // await DatabaseService(uid: user.uid).updateUserData('Donor', 'meow', 'mao', '123456');

      return userObj;
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