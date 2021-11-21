import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.allCameras}) : super(key: key);
  final List<CameraDescription> allCameras;
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late PanelController _pc = PanelController();
  late CameraController _controller1;
  late CameraController _controller2;
  late CameraController _controller = _controller1;
  late Future<void> _initializeControllerFuture;
  late final frontCamera = widget.allCameras[1];
  late final rearCamera = widget.allCameras.first;
  late double _panelMargin = 130;
  late Color _panelColor = Colors.amber;
  @override
  void initState() {
    // Future.delayed(const Duration(milliseconds: 0), () {
    //   _pc.animatePanelToPosition(0.4);
    // });

    super.initState();
    // _fabHeight = _initFabHeight;
    _pc = PanelController();
    _controller1 = CameraController(frontCamera, ResolutionPreset.max);
    _controller2 = CameraController(rearCamera, ResolutionPreset.max);
    _initializeControllerFuture = _controller1.initialize();
    // _initializeControllerFuture = _controller2.initialize();
  }

  @override
  void dispose() {
    _controller1.dispose();
    // _controller2.dispose();
    super.dispose();
  }

  // final double _initFabHeight = 100.0;
  // double _fabHeight = 0;
  // double _panelHeightOpen = 0;
  // final double _panelHeightClosed = 100;
  // Color _panelColor = Colors.transparent;

  Widget _cameraButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
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
                        builder: (context) => DisplayPictureScreen(
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
                onPressed: () {
                  setState(() {
                    if (_controller == _controller1) {
                      _controller = _controller2;
                    } else {
                      _controller = _controller1;
                    }
                  });
                },
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
    );
  }

  Widget _panel(ScrollController sc) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 120,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: _panelColor,
            child: Center(child: Text('$index')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const double _panelHeightClosed = 70;
    double _panelHeightOpen = MediaQuery.of(context).size.height;

    // final PanelController _pc = PanelController();
    // _pc.isAttached =true;
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
                  _cameraButtons(),
                  OverflowBox(
                    child: SlidingUpPanel(
                      controller: _pc,
                      renderPanelSheet: false,
                      backdropEnabled: true,
                      backdropColor: Colors.white,
                      backdropOpacity: 1,
                      maxHeight: _panelHeightOpen,
                      minHeight: _panelHeightClosed,
                      parallaxEnabled: true,
                      parallaxOffset: .5,
                      panelBuilder: (sc) => _panel(sc),
                      margin: EdgeInsets.only(bottom: _panelMargin),
                      collapsed: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.only(right: 5),
                            child: const Image(
                              image: AssetImage('lib/assets/6.jpg'),
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          );
                        },
                      ),
                      onPanelOpened: () => setState(() {
                        _panelMargin = 0;
                        _panelColor = Colors.amber;
                      }),
                      onPanelClosed: () => setState(() {
                        _panelMargin = 130;
                        _panelColor = Colors.transparent;
                      }),
                    ),
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
