import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        throw CameraException(
            'No available cameras', 'Please check camera hardware');
      }
      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );

      await _controller.initialize();

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<File> takePicture() async {
    try {
      await _initializeControllerFuture;
      print('👌👌Camera initialized.');

      Directory root = await getTemporaryDirectory();
      String dirPath = "${root.path}/uploaded_camera";
      await Directory(dirPath).create(recursive: true);
      final path = "$dirPath/${DateTime.now()}.png";

      if (!_controller.value.isInitialized) {
        print('😘Controller not initialized');
        return Future.error('Controller not initialized');
      }

      if (_controller.value.isTakingPicture) {
        print('😒Camera is already taking a picture');
        return Future.error('Camera is already taking a picture');
      }

      print('💕💕Taking picture...');
      XFile picture = await _controller.takePicture();
      print('💕💕Taken picture...');
      await picture.saveTo(path);

      return File(path);
    } catch (e) {
      print('Error taking picture: $e');
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 2 - 28,
                  child: FloatingActionButton(
                    child: const Icon(Icons.camera_alt),
                    onPressed: () async {
                      try {
                        final image = await takePicture();
                        await _initializeControllerFuture;
                        print('👌👌Camera initialized.');
                        print("Success ❤️❤️❤️❤️");
                        Navigator.pop(context, image);
                      } catch (e) {
                        print('❤️❤️Error: $e');
                      }
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
