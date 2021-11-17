import 'package:flutter/material.dart';
import 'package:whatsapp/models/user_details.dart';

final List<SettingsItems> settingsItems = [
  SettingsItems(
    title: 'Account',
    subtitle: 'Privacy, security, change number',
    icons: Icons.vpn_key,
    route: '/account',
  ),
  SettingsItems(
    title: 'Chats',
    subtitle: 'Themes, wallpapers, chat history',
    icons: Icons.message,
    route: '/chats',
  ),
  SettingsItems(
    title: 'Notifications',
    subtitle: 'Message, group & call tones',
    icons: Icons.notifications,
    route: '/notifications',
  ),
  SettingsItems(
    title: 'Storage and data',
    subtitle: 'Network usage, auto-download',
    icons: Icons.data_usage,
    route: '/storage',
  ),
  SettingsItems(
    title: 'Help',
    subtitle: 'Help center, contact us, privacy policy',
    icons: Icons.help_outline,
    route: '/help',
  ),
];

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(7)),
            ListTile(
              leading: const CircleAvatar(
                radius: 28,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              title: const Text(
                'Ashutosh',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: 0.4),
              ),
              subtitle: const Text(
                'Hi there',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    letterSpacing: 0.4),
              ),
              trailing: const Icon(
                Icons.qr_code_outlined,
                color: Colors.teal,
                size: 28,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const Divider(thickness: 1),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: settingsItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(settingsItems[index].icons),
                  title: Text(settingsItems[index].title),
                  subtitle: Text(settingsItems[index].subtitle),
                  onTap: () {
                    Navigator.pushNamed(context, settingsItems[index].route);
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Invite a friend'),
              onTap: () {
                Navigator.pushNamed(context, '/invite');
              },
            ),
            const Padding(padding: EdgeInsets.all(15)),
            const Text('from'),
            const Padding(padding: EdgeInsets.all(3)),
            const Text('HEY DUDES')
          ],
        ),
      ),
    );
  }
}
