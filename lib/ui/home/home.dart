import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detector/ui/real_time/real_time.dart';
import 'package:object_detector/ui/static/static_page.dart';
import 'package:object_detector/utils/utils.dart';

class Home extends StatefulWidget {
  List<CameraDescription> cameras;
  Home({Key? key, required this.cameras}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<CameraDescription> cameras;

  @override
  void initState() {
    setState(() {
      cameras = widget.cameras;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kButtonBg,
          size: 30,
        ),
        backgroundColor: kBackgroungColor,
        title: Text(
          'Object Detector',
          style: TextStyle(
            color: kBlackColor,
            fontSize: 30,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: kBackgroungColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(160, 160),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  kButtonBg,
                ),
                elevation: MaterialStateProperty.all<double>(
                  20,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RealTime(
                      cameras: cameras
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_camera_back_rounded,
                    color: kTextColor,
                    size: 60,
                  ),
                  Text(
                    'Real Time Detection',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(160, 160),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  kButtonBg,
                ),
                elevation: MaterialStateProperty.all<double>(
                  20,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetectImage(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 60,
                    color: kTextColor,
                  ),
                  Text(
                    'Choose an Image from Gallery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
