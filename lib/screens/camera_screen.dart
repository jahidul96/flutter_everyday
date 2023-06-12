// ignore_for_file: avoid_print, unused_field, use_build_context_synchronously

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_everyday/screens/preview_capture.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  bool flash = false;
  bool isFront = false;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraValue = cameraController.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    cameraController.dispose();
    super.dispose();
  }

  void capturePhoto() async {
    try {
      final image = await cameraController.takePicture();

      var tempFileImg = File(image.path);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewCaptureScreen(image: tempFileImg),
          ));
    } catch (e) {
      print(e);
    }
  }

  void toggleCamera() {
    setState(() {
      isFront = !isFront;
    });
    int cameraPostion = isFront ? 1 : 0;

    cameraController =
        CameraController(cameras[cameraPostion], ResolutionPreset.max);
    cameraValue = cameraController.initialize();
  }

// flash on off
  flashOnOff() {
    setState(() {
      flash = !flash;
    });

    flash
        ? cameraController.setFlashMode(FlashMode.torch)
        : cameraController.setFlashMode(FlashMode.off);
  }

  captureVideo() async {
    var video = await cameraController.startVideoRecording();
  }

  doneVideo() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(cameraController);
                } else {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => flashOnOff(),
                    icon: flash
                        ? const Icon(
                            Icons.flash_on,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.flash_off,
                            color: Colors.white,
                          ),
                  ),
                  GestureDetector(
                    onTap: () => capturePhoto(),
                    onLongPress: () => captureVideo(),
                    onLongPressUp: () => doneVideo(),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.shade400),
                      child: const Center(
                        child: Icon(Icons.camera),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => toggleCamera(),
                    icon: Icon(
                      isFront ? Icons.camera_alt : Icons.flip_camera_android,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
