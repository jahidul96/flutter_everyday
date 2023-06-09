// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gallery_saver/gallery_saver.dart';

class FileDownloadScreen extends StatefulWidget {
  const FileDownloadScreen({super.key});

  @override
  State<FileDownloadScreen> createState() => _FileDownloadScreenState();
}

class _FileDownloadScreenState extends State<FileDownloadScreen> {
  bool isDownloading = false;
  bool completed = false;
  downloadFile() async {
    final baseStorage = await getExternalStorageDirectory();
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // var response = await dio.download(
      //     "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      //     "${baseStorage!.path}/${DateTime.now()}.mp4");

      // print(response.statusCode);

      setState(() {
        isDownloading = true;
      });

      try {
        final response = await Dio().get(
          "https://firebasestorage.googleapis.com/v0/b/memoryapp-a1eb3.appspot.com/o/groupProfilePic%2F2023-05-30%2013%3A36%3A34.414731scaled_FB_IMG_16847737829594860.jpg?alt=media&token=0373dbbf-7d17-4126-9543-81a0ccd737d4",
          options: Options(responseType: ResponseType.bytes),
        );

        final savedDir = baseStorage!.path;

        final file = File('$savedDir/${DateTime.now()}.png');
        await file.writeAsBytes(response.data);

        // Save the file to the gallery
        // await GallerySaver.saveVideo(file.path);
        await GallerySaver.saveImage(file.path);

        setState(() {
          isDownloading = false;
          completed = true;
        });

        print('File downloaded successfully and saved to the gallery');
      } catch (e) {
        print('Error occurred while downloading file: $e');

        setState(() {
          isDownloading = false;
        });
      }
    } else {
      print("no permision");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download file"),
      ),
      body: Center(
        child: isDownloading
            ? const Text("Downloading...")
            : completed
                ? const Text("completed")
                : Container(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: downloadFile, child: const Icon(Icons.download)),
    );
  }
}
