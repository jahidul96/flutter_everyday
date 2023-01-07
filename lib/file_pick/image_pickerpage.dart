import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final img =
      "https://i.pinimg.com/736x/70/e8/95/70e8957ec64793bcf30f0666c7c0b96e--bougainvillea.jpg";

  File? _image;

// from gallery
  Future pickFromGallery(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imgTemp = File(image.path);

      print(imgTemp);

      setState(() {
        _image = imgTemp;
      });
    } on PlatformException catch (e) {
      print("some error found $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image pick from gallery"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(
                    _image!,
                    width: 200,
                    height: 150,
                  )
                : Image.network(
                    img,
                    width: 200,
                    height: 200,
                  ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () => pickFromGallery(ImageSource.gallery),
              child: Text("Pick From Gallery!"),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () => pickFromGallery(ImageSource.camera),
              child: Text("Camera Image!"),
            ),
          ],
        ),
      ),
    );
  }
}
