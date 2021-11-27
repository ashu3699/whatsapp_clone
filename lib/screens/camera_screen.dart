import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:whatsapp/screens/display_picture_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  //for slideUpPanel
  late PanelController _pc = PanelController();
  late double _panelMargin = 130;
  late Color _panelColor = Colors.transparent;

  //for camera
  late FlashMode _currentFlashMode = FlashMode.off;
  late IconData _flashIcon = Icons.flash_off;
  late int _flashCount = 0;

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int selectedCamera = 0;
  List<File> capturedImages = [];

  initializeCamera(int cameraIndex) async {
    _controller = CameraController(
      widget.cameras[cameraIndex],
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _controller.initialize();
    _currentFlashMode = FlashMode.off;
  }

  @override
  void initState() {
    _pc = PanelController();
    initializeCamera(selectedCamera);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                onPressed: () async {
                  _flashCount++;
                  try {
                    if (_flashCount % 3 == 0) {
                      setState(() {
                        _currentFlashMode = FlashMode.torch;
                        _flashIcon = Icons.flash_on;
                      });
                      await _controller.setFlashMode(FlashMode.always);
                    } else if (_flashCount % 3 == 1) {
                      setState(() {
                        _currentFlashMode = FlashMode.auto;
                        _flashIcon = Icons.flash_auto;
                      });
                      await _controller.setFlashMode(FlashMode.auto);
                    } else if (_flashCount % 3 == 2) {
                      setState(() {
                        _currentFlashMode = FlashMode.off;
                        _flashIcon = Icons.flash_off;
                      });
                      await _controller.setFlashMode(
                        FlashMode.off,
                      );
                    }
                  } catch (e) {
                    //
                  }
                },
                icon: Icon(
                  _flashIcon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  setState(() {
                    capturedImages.add(File(image.path));
                  });
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        imagePath: image.path,
                      ),
                    ),
                  );
                } catch (e) {
                  //to handle camera exceptions
                }
              },
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: IconButton(
                onPressed: () {
                  if (widget.cameras.length > 1) {
                    setState(() {
                      selectedCamera =
                          selectedCamera == 0 ? 1 : 0; //Switch camera
                      initializeCamera(selectedCamera);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No secondary camera found'),
                      duration: Duration(seconds: 2),
                    ));
                  }
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

  Widget _noPanel(ScrollController sc) {
    return Container();
  }

  Widget _panel(ScrollController sc) {
    List<File> reversedImages = capturedImages.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.grey,
          onPressed: () {
            _pc.close();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_box_outlined),
            color: Colors.grey,
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.topLeft,
              child: Text(
                "RECENT",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
            ),
            preferredSize: const Size.fromHeight(30)),
      ),
      body: GridView.builder(
          controller: sc,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: reversedImages.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayPictureScreen(
                      imagePath: reversedImages[index].path,
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: _panelColor,
                    border: Border.all(color: Colors.white),
                    image: reversedImages.isNotEmpty
                        ? DecorationImage(
                            image: FileImage(reversedImages[index]),
                            fit: BoxFit.cover)
                        : null),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double _panelHeightClosed = 80;
    double _panelHeightOpen = MediaQuery.of(context).size.height;

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
                      panelBuilder: (sc) =>
                          _panelMargin == 0 ? _panel(sc) : _noPanel(sc),
                      margin: EdgeInsets.only(bottom: _panelMargin),
                      collapsed: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.only(right: 3.5),
                            child: const Image(
                              image: AssetImage('lib/assets/6.jpg'),
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
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
            //until camera is initialized
            return const Center(child: CircularProgressIndicator());
            // return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
