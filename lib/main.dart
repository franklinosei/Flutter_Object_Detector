import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detector/ui/home/home.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.dark(),
      theme: ThemeData(),
      home: Home(cameras: cameras),
      // onGenerateRoute: GenerateRoutes.generateRoute,
    );
  }
}
