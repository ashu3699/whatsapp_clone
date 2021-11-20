import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: Colors.black,
              child: Stack(
                children: [
                  Center(
                    child: CameraPreview(_controller),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.3,
                    minChildSize: 0.3,
                    maxChildSize: 1,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                              child: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          )),
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: scrollController,
                              itemCount: 25,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    width: 70,
                                    height: 70,
                                    child: const Image(
                                      image: AssetImage('lib/assets/1.jpg'),
                                      fit: BoxFit.cover,
                                      height: 70,
                                      width: 70,
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: scrollController,
                              itemCount: 25,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    width: 100,
                                    height: 100,
                                    child: const Image(
                                      color: Colors.transparent,
                                      image: AssetImage('lib/assets/2.jpg'),
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                    ));
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.flash_off,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: IconButton(
                              alignment: Alignment.topCenter,
                              onPressed: () async {
                                try {
                                  await _initializeControllerFuture;
                                  final image = await _controller.takePicture();

                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DisplayPictureScreen(
                                        imagePath: image.path,
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  // print(e);
                                }
                              },
                              icon: const Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 85,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.flip_camera_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Hold for video, tap for photo',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
