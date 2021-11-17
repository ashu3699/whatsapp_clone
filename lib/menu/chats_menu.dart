import 'package:flutter/material.dart';

class ChatsMenu extends StatelessWidget {
  const ChatsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (selectedValue) {
        Navigator.pushNamed(context, selectedValue.toString());
      },
      color: Colors.white,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: '/settings',
          child: Text(
            "New group",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuItem(
          value: '/settings',
          child: Text(
            "New broadcast",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuItem(
          value: '/settings',
          child: Text(
            "Linked devices",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuItem(
          value: '/settings',
          child: Text(
            "Starred messages",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuItem(
          value: '/settings',
          child: Text(
            "Payments",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuItem(
          value: '/settings',
          child: Text(
            "Settings",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
