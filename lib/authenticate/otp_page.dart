import 'package:flutter/material.dart';
import 'package:whatsapp/services/auth.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    Key? key,
    required this.phoneNo,
    // required this.vid,
    required this.auth,
  }) : super(key: key);
  final String phoneNo;
  // final String vid;
  final AuthService auth;
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // final AuthService _auth = AuthService();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          'Verifying your number',
        ),
        centerTitle: true,
        // change actions to widget in the title section
        actions: [
          PopupMenuButton(
            // padding: EdgeInsets.all(0),
            // color: Colors.teal,
            onSelected: (selectedValue) {
              Navigator.pushNamed(context, selectedValue.toString());
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                height: 30,
                value: '/settings',
                child: Text(
                  "Help",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          // const Text('Waiting to automatically detect an SMS sent to '),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Waiting to automatically detect an SMS sent to ',
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: ' +91 ' + widget.phoneNo + '.',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(
                  text: " Wrong number?",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        hintStyle: const TextStyle(fontSize: 30),
                        hintText: "- - -  - - -"),
                    controller: _otpController,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Enter 6-digit code",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text('VERIFY OTP'),
                  onPressed: () async {
                    await widget.auth.verifyOTP(_otpController.text);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
