import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DisplayPictureScreen extends StatefulWidget {
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;
  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  //for slideUpPanel
  final PanelController _panelController = PanelController();
  // late double _panelMargin = 130;
  // late Color _panelColor = Colors.transparent;

  Widget _panel(ScrollController _sc) {
    return ListView.builder(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.crop_rotate_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_emotions)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.text_fields)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      body: SlidingUpPanel(
        controller: _panelController,
        renderPanelSheet: false,
        // backdropEnabled: true,
        // backdropColor: Colors.white,
        // backdropOpacity: 1,
        maxHeight: 100,
        minHeight: 10,
        parallaxEnabled: true,
        parallaxOffset: .5,
        panelBuilder: (_sc) => _panel(_sc),
        // margin: EdgeInsets.only(bottom: _panelMargin),
        body: Stack(
          // alignment: Alignment.bottomLeft,
          children: [
            Image.file(File(widget.imagePath)),
            Container(
              // alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              child: const TextField(),
              color: Colors.red,
            ),
            IconButton(
              iconSize: 50,
              onPressed: () {},
              icon: const Icon(
                Icons.check_circle_rounded,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),

      // body: Stack(
      //   children: [
      //     Image.file(File(imagePath)),
      //     Container(
      //       width: 100,
      //       child: const TextField(),
      //       color: Colors.red,
      //     ),
      //     IconButton(
      //       iconSize: 50,
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.check_circle_rounded,
      //         color: Colors.teal,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
