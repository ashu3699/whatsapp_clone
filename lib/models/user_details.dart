import 'package:flutter/material.dart';

class UserDetails {
  String name;
  String message;
  String time;
  String profilePic;

  UserDetails(
      {required this.name,
      required this.message,
      required this.time,
      required this.profilePic});
}

class SettingsItems {
  String title;
  String subtitle;
  IconData icons;
  String route;

  SettingsItems({
    required this.title,
    required this.subtitle,
    required this.icons,
    required this.route,
  });
}
