import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/homepage.dart';
import 'package:whatsapp/services/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<CameraDescription> cameras = await availableCameras();

  // final firstCamera = cameras.first;
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // initialRoute: '/home',
      home: HomePage(cameras: cameras),
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
