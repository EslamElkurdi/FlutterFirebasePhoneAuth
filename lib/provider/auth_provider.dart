import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{

 bool _isSignedIn = false;
 bool get isSignedIn=> _isSignedIn;

 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 AuthProvider()
 {
   checkSign();
 }

 void checkSign() async {
   final SharedPreferences s = await SharedPreferences.getInstance();
   _isSignedIn = s.getBool("is_signedin") ?? false;
   notifyListeners();
 }



}