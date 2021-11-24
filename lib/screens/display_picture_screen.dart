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
  double _panelMargin = 100;
  Color _panelColor = Colors.transparent;

  Widget _noPanel(ScrollController sc) {
    return Container();
  }

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
        shadowColor: Colors.transparent,
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
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sentiment_satisfied_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.title_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Image.file(File(widget.imagePath)),
            OverflowBox(
              child: SlidingUpPanel(
                controller: _panelController,
                renderPanelSheet: false,
                // backdropEnabled: true,
                // backdropColor: Colors.white,
                // backdropOpacity: 1,
                maxHeight: 100,
                minHeight: 100,
                parallaxEnabled: true,
                parallaxOffset: .5,
                panelBuilder: (_sc) =>
                    _panelMargin == 0 ? _panel(_sc) : _noPanel(_sc),
                margin: EdgeInsets.only(bottom: _panelMargin),
                collapsed: Column(
                  children: const [
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                    Text(
                      'Filters',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onPanelOpened: () => setState(() {
                  _panelMargin = 0;
                  _panelColor = Colors.amber;
                }),
                onPanelClosed: () => setState(() {
                  _panelMargin = 100;
                  _panelColor = Colors.transparent;
                }),
              ),
            ),
            //bottombar
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a caption...",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.photo_library_outlined),
                            suffixIcon: Icon(Icons.update_disabled_outlined)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                    child: CircleAvatar(
                      radius: 25,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
