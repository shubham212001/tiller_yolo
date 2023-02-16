// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class FullScreenCameraScreen extends StatefulWidget {
//   const FullScreenCameraScreen({Key? key}) : super(key: key);

//   @override
//   _FullScreenCameraScreenState createState() => _FullScreenCameraScreenState();
// }

// class _FullScreenCameraScreenState extends State<FullScreenCameraScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   XFile? _image;

//   @override
//   void initState() {
//     super.initState();
//     _initializeControllerFuture = _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     final firstCamera = cameras.first;
//     _controller = CameraController(firstCamera, ResolutionPreset.high);
//     await _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Stack(
//               children: [
//                 Positioned.fill(
//                   child: CameraPreview(_controller),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     color: Colors.black.withOpacity(0.5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             _takePicture();
//                           },
//                           icon: Icon(Icons.camera_alt),
//                           color: Colors.white,
//                           iconSize: 36,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }

//   void _takePicture() async {
//     try {
//       await _initializeControllerFuture;

//       final XFile file = await _controller.takePicture();
//       setState(() {
//         _image = file;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FullScreenCameraScreen extends StatefulWidget {
  const FullScreenCameraScreen({Key? key}) : super(key: key);

  @override
  _FullScreenCameraScreenState createState() => _FullScreenCameraScreenState();
}

class _FullScreenCameraScreenState extends State<FullScreenCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? _image;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cameraButtonTopPosition = screenHeight * 0.9;
    final counterTopPosition = screenHeight * 0.85;

    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CameraPreview(_controller),
                ),
                Positioned(
                  top: cameraButtonTopPosition,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            _takePicture();
                            setState(() {
                              _counter++;
                            });
                          },
                          icon: Icon(Icons.camera_alt),
                          color: Colors.white,
                          iconSize: 36,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: counterTopPosition,
                  right: 20,
                  child: Text(
                    'Counter: $_counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _takePicture() async {
    try {
      await _initializeControllerFuture;

      final XFile file = await _controller.takePicture();
      setState(() {
        _image = file;
      });
    } catch (e) {
      print(e);
    }
  }
}
