import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/authenticate/signin_page.dart';
import 'package:whatsapp/pages/homepage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    // return HomePage(cameras: cameras);
    return const SignInPage();
  }
}
