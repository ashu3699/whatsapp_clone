import 'package:flutter/material.dart';

class StatusMenu extends StatelessWidget {
  const StatusMenu({Key? key}) : super(key: key);

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
            "Status Privacy",
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
