import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';
  Future registerUser(String number) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91' + number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            log('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          this.verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await auth
          .signInWithCredential(credential)
          .then((value) => log('Login Successful'));
    } catch (e) {
      log(e.toString());
    }
  }
}
