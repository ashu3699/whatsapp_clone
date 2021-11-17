import 'package:flutter/material.dart';

class StorageSettings extends StatefulWidget {
  const StorageSettings({Key? key}) : super(key: key);

  @override
  State<StorageSettings> createState() => StorageSettingsState();
}

class StorageSettingsState extends State<StorageSettings> {
  bool lessDataKey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage and data')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Padding(padding: EdgeInsets.all(8)),
            const ListTile(
              leading: Icon(Icons.folder),
              title: Text('Manage storage'),
              subtitle: Text('28.3 MB'),
            ),
            const Divider(thickness: 1.5),
            const ListTile(
              leading: Icon(Icons.data_usage),
              title: Text('Network storage'),
              subtitle: Text('4.1 MB sent . 12.4 MB received'),
            ),
            ListTile(
              leading: const Icon(
                Icons.donut_large,
                color: Colors.transparent,
              ),
              title: const Text('Use less data for calls'),
              trailing: Switch(
                  value: lessDataKey,
                  onChanged: (value) {
                    setState(() {
                      lessDataKey = !lessDataKey;
                    });
                  }),
            ),
            const Divider(thickness: 1.5),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Media auto-download',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(4)),
                  Text(
                    'Voice messages are always automatically downloaded',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(17),
            ),
            const ListTile(
              leading: Icon(
                Icons.donut_large,
                color: Colors.transparent,
              ),
              title: Text('When using mobile data'),
              subtitle: Text('Photos'),
            ),
            const ListTile(
              leading: Icon(
                Icons.donut_large,
                color: Colors.transparent,
              ),
              title: Text('When connected on Wi-Fi'),
              subtitle: Text('All media'),
            ),
            const ListTile(
              leading: Icon(
                Icons.donut_large,
                color: Colors.transparent,
              ),
              title: Text('When roaming'),
              subtitle: Text('No media'),
            ),
            const Divider(thickness: 1.5),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Media upload quality',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(4)),
                  Text(
                    'Choose the quality of media files to be sent',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(17),
            ),
            const ListTile(
              leading: Icon(
                Icons.donut_large,
                color: Colors.transparent,
              ),
              title: Text('Photo upload quality'),
              subtitle: Text('Auto (recommended)'),
            ),
          ],
        ),
      ),
    );
  }
}
