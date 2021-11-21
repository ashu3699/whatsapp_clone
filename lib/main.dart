import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/homepage.dart';
import 'package:whatsapp/services/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<CameraDescription> allCameras = await availableCameras();

  // final firstCamera = cameras.first;
  runApp(MyApp(allCameras: allCameras));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.allCameras}) : super(key: key);
  final List<CameraDescription> allCameras;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // initialRoute: '/home',
      home: HomePage(allCameras: allCameras),
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
