import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/homepage.dart';
import 'package:whatsapp/services/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // initialRoute: '/home',
      home: HomePage(camera: camera),
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
