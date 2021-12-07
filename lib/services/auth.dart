import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';
  late final UserCredential authCredential;

  Future registerUser(String number) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91' + number,
        verificationCompleted: (PhoneAuthCredential credential) {},
        // (PhoneAuthCredential credential) async {
        //   await auth.signInWithCredential(credential);
        // },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            log('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          this.verificationId = verificationId;
        },
        timeout: const Duration(seconds: 120),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

//   Stream<FirebaseAuth> get user {

// return _auth.authStateChanges().listen((event) { });
//   }

  Future verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      authCredential = await auth.signInWithCredential(credential);
    } catch (e) {
      log(e.toString());
    }

    return authCredential;
  }
}
