import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:whatsapp/pages/contact_page.dart';

class InviteSettings extends StatefulWidget {
  const InviteSettings({Key? key}) : super(key: key);

  @override
  State<InviteSettings> createState() => _InviteSettingsState();
}

class _InviteSettingsState extends State<InviteSettings> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  Widget _body() {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => ListTile(
            leading: avatar(_contacts![i], 18.0),
            title: Text(_contacts![i].displayName),
            onTap: () async {
              final fullContact =
                  await FlutterContacts.getContact(_contacts![i].id);
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactPage(fullContact!)));
            }));
  }

  Widget avatar(Contact contact,
      [double radius = 48.0, IconData defaultIcon = Icons.person]) {
    return CircleAvatar(
      child: contact.photoOrThumbnail != null
          ? Image.memory(contact.photoOrThumbnail!, gaplessPlayback: true)
          : Icon(defaultIcon),
      radius: radius,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite a friend'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            splashRadius: 20,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.share)),
              title: Text(
                'Share link',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: const Text('From Contacts',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              margin: const EdgeInsets.all(17),
            ),
            _body()
          ],
        ),
      ),
    );
  }
}
