import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(20)),
          const Center(
            child: CircleAvatar(
              radius: 70,
              child: Icon(
                Icons.person,
                size: 120,
              ),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          ListTile(
            leading: const Icon(Icons.person),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Name',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 3),
                Text('Ashutosh'),
                SizedBox(height: 8),
              ],
            ),
            subtitle: Column(
              children: const [
                Text(
                    'This is not your username or pin. This name will be visible to your WhatsApp contacts.'),
                // Divider(thickness: 1),
              ],
            ),
            trailing: const Icon(Icons.edit, color: Colors.teal),
          ),
          Divider(
            thickness: 1,
            indent: MediaQuery.of(context).size.width * 0.185,
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'About',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 3),
                Text('Hey there!'),
                SizedBox(height: 8),
              ],
            ),
            // subtitle: const Divider(thickness: 1),
            trailing: const Icon(Icons.edit, color: Colors.teal),
          ),
          Divider(
            thickness: 1,
            indent: MediaQuery.of(context).size.width * 0.185,
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 3),
                Text('+91 95722 95742'),
                SizedBox(height: 8),
              ],
            ),
          )
        ],
      ),
    );
  }
}
