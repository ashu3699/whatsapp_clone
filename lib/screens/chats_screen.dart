import 'package:flutter/material.dart';
import 'package:whatsapp/models/user_details.dart';

final List<UserDetails> userDetails = [
  UserDetails(
    name: 'Tanmay ki Bandi 2',
    message: 'hi',
    time: 'time',
    profilePic: '',
  ),
  UserDetails(
    name: 'Hari',
    message: 'hi',
    time: 'time',
    profilePic: '',
  ),
  UserDetails(
    name: 'Tanmay ki Bandi',
    message: 'hi',
    time: 'time',
    profilePic: '',
  ),
  UserDetails(
    name: 'Hari ki Bandi',
    message: 'I love you',
    time: 'time',
    profilePic: '',
  ),
];

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: userDetails.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(11, 5, 11, 0),
              leading: CircleAvatar(
                radius: 28,
                child: const Icon(Icons.person),
                backgroundColor: Colors.blueGrey.shade100,
              ),
              title: Text(
                userDetails[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(userDetails[index].message),
              trailing: const Text('11:17 AM'),
            );
          }),
    );
  }
}
