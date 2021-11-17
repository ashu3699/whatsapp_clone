import 'package:flutter/material.dart';

class NotificationsSettings extends StatefulWidget {
  const NotificationsSettings({Key? key}) : super(key: key);

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  bool conversationKey = false;
  bool messageKey = false;
  bool groupKey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(8)),
            ListTile(
              title: const Text('Conversation tones'),
              subtitle:
                  const Text('Play sounds for incoming and outgoing messages.'),
              trailing: Switch(
                  value: conversationKey,
                  onChanged: (value) {
                    setState(() {
                      conversationKey = !conversationKey;
                    });
                  }),
            ),
            const Divider(thickness: 1.5),
            Container(
              child: const Text('Messages',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              margin: const EdgeInsets.all(17),
            ),
            const ListTile(
              title: Text('Notification tone'),
              subtitle: Text('Default (realme Jingle)'),
            ),
            const ListTile(
              title: Text('Vibrate'),
              subtitle: Text('Default'),
            ),
            const ListTile(
              enabled: false,
              title: Text('Popup notification'),
              subtitle: Text('Not available'),
            ),
            const ListTile(
              title: Text('Light'),
              subtitle: Text('White'),
            ),
            ListTile(
              title: const Text('Use high priority notifications'),
              subtitle: const Text(
                  'Show previews of notifications at the top of the screen.'),
              trailing: Switch(
                  value: messageKey,
                  onChanged: (value) {
                    setState(() {
                      messageKey = !messageKey;
                    });
                  }),
            ),
            const Divider(thickness: 1.5),
            Container(
              child: const Text('Groups',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              margin: const EdgeInsets.all(17),
            ),
            const ListTile(
              title: Text('Notification tone'),
              subtitle: Text('Default (realme Jingle)'),
            ),
            const ListTile(
              title: Text('Vibrate'),
              subtitle: Text('Default'),
            ),
            const ListTile(
              title: Text('Light'),
              subtitle: Text('White'),
            ),
            ListTile(
              title: const Text('Use high priority notifications'),
              subtitle: const Text(
                  'Show previews of notifications at the top of the screen.'),
              trailing: Switch(
                  value: groupKey,
                  onChanged: (value) {
                    setState(() {
                      groupKey = !groupKey;
                    });
                  }),
            ),
            const Divider(thickness: 1.5),
            Container(
              child: const Text('Calls',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              margin: const EdgeInsets.all(17),
            ),
            const ListTile(
              title: Text('Ringtone'),
              subtitle: Text("Default (it's realme)"),
            ),
            const ListTile(
              title: Text('Vibrate'),
              subtitle: Text('Default'),
            ),
          ],
        ),
      ),
    );
  }
}
