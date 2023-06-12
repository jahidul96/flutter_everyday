// ignore_for_file: avoid_print, unused_field

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;

  File? _image;

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

      setState(() {
        _image = tempFileImg;
      });
    } catch (e) {
      print(e);
    }
  }

  void toggleCamera() {
    final lensDirection = cameraController.description.lensDirection;
    CameraDescription newDescription;

    // Find the camera with the opposite lens direction
    if (lensDirection == CameraLensDirection.front) {
      newDescription = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);
    }

    cameraController = CameraController(newDescription, ResolutionPreset.max);
    cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _image != null
          ? Stack(
              children: [
                Image.file(
                  _image!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 10,
                  top: 20,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                )
              ],
            )
          : Stack(
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
                        return const Center(
                          child: Text("Wait"),
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.flash_off,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () => capturePhoto(),
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
                          icon: const Icon(
                            Icons.flip_camera_android,
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
