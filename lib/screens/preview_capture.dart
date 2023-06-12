import 'dart:io';

import 'package:flutter/material.dart';

class PreviewCaptureScreen extends StatefulWidget {
  File image;
  PreviewCaptureScreen({super.key, required this.image});

  @override
  State<PreviewCaptureScreen> createState() => _PreviewCaptureScreenState();
}

class _PreviewCaptureScreenState extends State<PreviewCaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.file(
            widget.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 10,
            top: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
