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
  final _message = TextEditingController();
  // bool _show = true;
  //for slideUpPanel
  final PanelController _panelController = PanelController();
  double _panelMargin = 40;
  /*
  Widget _showBottomSheet() {
    return _show
        ? BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text("Close Bottom Sheet"),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    _show = false;
                    setState(() {});
                  },
                ),
              );
            },
          )
        : const SizedBox.shrink();
  }
*/

  Widget _noPanel(ScrollController sc) {
    return Container();
  }

  Widget _panel(ScrollController _sc) {
    return ListView.builder(
      controller: _sc,
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.only(right: 3.5),
          margin: const EdgeInsets.only(bottom: 100),
          child: const Image(
            image: AssetImage('lib/assets/8.jpg'),
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
      // resizeToAvoidBottomInset: false,
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
      // bottomSheet: _showBottomSheet(),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: Image.file(
                File(widget.imagePath),
                // height: MediaQuery.of(context).size.height - _panelMargin,
              ),
            ),
            OverflowBox(
              // maxWidth: MediaQuery.of(context).size.width,
              // maxHeight: MediaQuery.of(context).size.height,
              child: SlidingUpPanel(
                controller: _panelController,
                renderPanelSheet: false,
                // backdropEnabled: true,
                // backdropColor: Colors.white,
                // backdropOpacity: 1,
                maxHeight: 200,
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
                  // _panelColor = Colors.amber.withOpacity(0);
                }),
                onPanelClosed: () => setState(() {
                  _panelMargin = 40;
                  // _panelColor = Colors.transparent;
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
                      child: TextField(
                        // scrollController: ScrollController(),
                        // scrollPhysics: NeverScrollableScrollPhysics(),
                        // maxLength: null,
                        // autofocus: true,
                        controller: _message,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        // minLines: 1,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a caption...",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.photo_library_outlined),
                          suffixIcon: Icon(Icons.update_disabled_outlined),
                        ),
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
