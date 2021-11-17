import 'package:flutter/material.dart';

class ChatsSettings extends StatefulWidget {
  const ChatsSettings({Key? key}) : super(key: key);

  @override
  State<ChatsSettings> createState() => _ChatsSettingsState();
}

class _ChatsSettingsState extends State<ChatsSettings> {
  bool enterKey = false;
  bool mediaKey = false;
  bool archiveKey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text('Display',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              margin: const EdgeInsets.all(17),
            ),
            const ListTile(
              leading: Icon(Icons.brightness_6_sharp),
              title: Text('Theme'),
              subtitle: Text('System default'),
            ),
            const ListTile(
              leading: Icon(Icons.wallpaper_outlined),
              title: Text('Wallpaper'),
            ),
            const Divider(thickness: 1.5),
            Container(
              child: const Text('Chat settings',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              margin: const EdgeInsets.all(17),
            ),
            ListTile(
              leading: const Icon(Icons.check_box_outline_blank,
                  color: Colors.transparent),
              title: const Text('Enter is send'),
              subtitle: const Text('Enter key will send your message'),
              trailing: Switch(
                value: enterKey,
                onChanged: (value) {
                  setState(() {
                    enterKey = !enterKey;
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.check_box_outline_blank,
                  color: Colors.transparent),
              title: const Text('Media visibility'),
              subtitle: const Text(
                  "Show newly downloaded media in your phone's gallery"),
              trailing: Switch(
                value: mediaKey,
                onChanged: (value) {
                  setState(() {
                    mediaKey = !mediaKey;
                  });
                },
              ),
            ),
            const ListTile(
              leading: Icon(Icons.check_box_outline_blank,
                  color: Colors.transparent),
              title: Text('Font size'),
              subtitle: Text("Medium"),
            ),
            const Divider(thickness: 1.5),
            Container(
              child: const Text('Archived chats',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              margin: const EdgeInsets.all(17),
            ),
            ListTile(
              leading: const Icon(
                Icons.check_box_outline_blank,
                color: Colors.transparent,
              ),
              isThreeLine: true,
              title: const Text('Keep chats archived'),
              subtitle: const Text(
                  'Archived chats will remain archived when you receive a new message'),
              trailing: Switch(
                value: archiveKey,
                onChanged: (value) {
                  setState(() {
                    archiveKey = !archiveKey;
                  });
                },
              ),
            ),
            const Divider(thickness: 1.5),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('App Language'),
              subtitle: Text("Phone's language (Engish)"),
            ),
            const ListTile(
              leading: Icon(Icons.backup),
              title: Text('Chat backup'),
            ),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text('Chat history'),
            ),
          ],
        ),
      ),
    );
  }
}
