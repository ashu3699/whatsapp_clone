import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/authenticate/signin_page.dart';
import 'package:whatsapp/pages/homepage.dart';
import 'package:whatsapp/services/auth.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthService _authService = AuthService();
  // var user = _authService.auth.user
  @override
  Widget build(BuildContext context) {
    // return HomePage(cameras: widget.cameras);
    // return SignInPage(auth: _authService, cameras: widget.cameras);
    _authService.auth.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                SignInPage(auth: _authService, cameras: widget.cameras),
          ),
        );
      } else {
        log('User is signed in!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                HomePage(cameras: widget.cameras),
          ),
        );
      }
    });
    return Container();

    // return _authService.auth.authStateChanges().listen((User? user) { }) user== null
    //     ? SignInPage(auth: _authService, cameras: widget.cameras)
    //     : HomePage(cameras: widget.cameras);
  }
}
