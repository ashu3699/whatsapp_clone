import 'package:flutter/material.dart';
import 'package:whatsapp/models/settings_account.dart';

final List<AccountItems> accountItems = [
  AccountItems(
    title: 'Privacy',
    icons: Icons.lock,
    route: '',
  ),
  AccountItems(
    title: 'Security',
    icons: Icons.security,
    route: '',
  ),
  AccountItems(
    title: 'Two-step verification',
    icons: Icons.message,
    route: '',
  ),
  AccountItems(
    title: 'Change number',
    icons: Icons.send_to_mobile,
    route: '',
  ),
  AccountItems(
    title: 'Request account info',
    icons: Icons.description,
    route: '',
  ),
  AccountItems(
    title: 'Delete my account',
    icons: Icons.delete,
    route: '',
  ),
];

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: accountItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(accountItems[index].icons),
            title: Text(accountItems[index].title),
            onTap: () {
              Navigator.pushNamed(context, accountItems[index].route);
            },
          );
        },
      ),
    );
  }
}
