import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/screens/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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


 void signInWithPhone(BuildContext context, String phoneNumber) async
 {
   try{
     await _firebaseAuth.verifyPhoneNumber(
       phoneNumber: phoneNumber,
         verificationCompleted:
             (PhoneAuthCredential phoneAuthCredential) async
         {
           await _firebaseAuth.signInWithCredential(phoneAuthCredential);
         },
         verificationFailed: (error)
         {
           throw Exception(error.message);
         },
         codeSent: (verificationId, forceResendingToken)
         {
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context)=> OTPScreen(
                   verificationId: verificationId
               ))
           );
         },
         codeAutoRetrievalTimeout: ((verificationId){})
     );
   } on FirebaseAuthException catch(e){

   }
 }
}