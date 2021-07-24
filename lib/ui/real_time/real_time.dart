import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detector/utils/utils.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';

import 'bounding_box.dart';
import 'camera_feed.dart';

class RealTime extends StatefulWidget {
  final List<CameraDescription> cameras;

  RealTime({required this.cameras});

  @override
  _RealTimeState createState() => _RealTimeState();
}

class _RealTimeState extends State<RealTime> {
  late List<dynamic> _recognitions = [];
  int _imageHeight = 0;
  int _imageWidth = 0;

  loadTfModel() async {
    Tflite.close();
    await Tflite.loadModel(
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  /* 
  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
  */
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTfModel();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroungColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kButtonBg,
        ),
        title: Text(
          "Real Time Object Detection",
          style: TextStyle(
            color: kBlackColor,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          CameraFeed(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions == null ? [] : _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
          ),
        ],
      ),
    );
  }
}
