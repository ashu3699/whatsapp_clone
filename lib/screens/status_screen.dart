import 'package:flutter/material.dart';
import 'package:whatsapp/models/status_details.dart';

final List<StatusDetails> statusDetails = [
  StatusDetails(
    name: 'Person 1',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
  StatusDetails(
    name: 'Person 2',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
  StatusDetails(
    name: 'Person 3',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
  StatusDetails(
    name: 'Person 4',
    time: 'Yesterday, 07:20 PM',
    profilePic: '',
  ),
];

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: statusDetails.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(11, 5, 11, 0),
              leading: CircleAvatar(
                radius: 28,
                child: const Icon(Icons.person),
                backgroundColor: Colors.blueGrey.shade100,
              ),
              title: Text(
                statusDetails[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(statusDetails[index].time),
            );
          }),
    );
  }
}
