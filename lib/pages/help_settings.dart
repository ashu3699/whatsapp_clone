import 'package:flutter/material.dart';

class HelpSettings extends StatelessWidget {
  const HelpSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Help'),
        ),
        body: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help Center'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Contact us'),
              subtitle: Text('Questions? Need help?'),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Terms and Privacy Policy'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('App info'),
            ),
          ],
        ));
  }
}
