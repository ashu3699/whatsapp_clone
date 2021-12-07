import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/authenticate/otp_page.dart';
import 'package:whatsapp/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.auth, required this.cameras})
      : super(key: key);
  final AuthService auth;
  final List<CameraDescription> cameras;
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // final AuthService _authService = widget.auth;
  final _phoneController = TextEditingController();
  String _countrycode = '+91';

  Map<String, String> countryItems = {'India': '+91', 'USA': '+1'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text('Enter your phone number'),
        centerTitle: true,
        // change actions to widget in the title section
        actions: [
          PopupMenuButton(
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
        children: [
          const SizedBox(height: 16),
          const Text('WhatsApp will need to verify your phone number.'),
          const Text(
            "What's my number?",
            style: TextStyle(color: Colors.blue),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                DropdownButton(
                  underline: Container(
                    height: 1,
                    color: Colors.teal,
                  ),
                  iconEnabledColor: Colors.teal,
                  isExpanded: true,
                  hint: const Text("Select Country"),
                  value: _countrycode,
                  onChanged: (String? value) {
                    setState(() {
                      _countrycode = value!;
                    });
                  },
                  items: countryItems
                      .map((countryName, countryCode) => MapEntry(
                            countryName,
                            DropdownMenuItem(
                              value: countryCode,
                              child: Center(child: Text(countryName)),
                            ),
                          ))
                      .values
                      .toList(),
                ),
                Row(
                  children: [
                    Text(
                      _countrycode,
                      // style: const TextStyle(
                      //     fontSize: 15,
                      //     decoration: TextDecoration.underline,
                      //     decorationThickness: 2,
                      //     decorationColor: Colors.teal),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "phone number"),
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Carrier charges may apply",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: const Text('NEXT'),
                onPressed: () async {
                  await widget.auth.registerUser(_phoneController.text);
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => OtpPage(
                        phoneNo: _phoneController.text,
                        auth: widget.auth,
                        cameras: widget.cameras,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
