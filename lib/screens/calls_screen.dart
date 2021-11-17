import 'package:flutter/material.dart';
import 'package:whatsapp/models/call_details.dart';

final List<CallDetails> callDetails = [
  CallDetails(
    name: 'Hari ki Bandi',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
  CallDetails(
    name: 'Tanmay ki Bandi',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
  CallDetails(
    name: 'Tanmay ki Bandi',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
  CallDetails(
    name: 'Hari ki Bandi',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
];

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: callDetails.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(11, 5, 11, 0),
              leading: CircleAvatar(
                radius: 28,
                child: const Icon(Icons.person),
                backgroundColor: Colors.blueGrey.shade100,
              ),
              title: Text(
                callDetails[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(callDetails[index].time),
              trailing: const Icon(
                Icons.call,
                color: Colors.teal,
              ),
            );
          }),
    );
  }
}
