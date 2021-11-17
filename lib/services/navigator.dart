import 'package:flutter/material.dart';
import 'package:whatsapp/pages/account_settings.dart';
import 'package:whatsapp/pages/chats_settings.dart';
import 'package:whatsapp/pages/help_settings.dart';
// import 'package:whatsapp/pages/homepage.dart';
import 'package:whatsapp/pages/invite_settings.dart';
import 'package:whatsapp/pages/notifications_settings.dart';
import 'package:whatsapp/pages/profile_settings.dart';
import 'package:whatsapp/pages/settingspage.dart';
import 'package:whatsapp/pages/storage_settings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/home':
      //   return MaterialPageRoute(builder: (context) => const HomePage(camera: ));
      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      case '/account':
        return MaterialPageRoute(builder: (context) => const AccountSettings());
      case '/chats':
        return MaterialPageRoute(builder: (context) => const ChatsSettings());
      case '/notifications':
        return MaterialPageRoute(
            builder: (context) => const NotificationsSettings());
      case '/storage':
        return MaterialPageRoute(builder: (context) => const StorageSettings());
      case '/help':
        return MaterialPageRoute(builder: (context) => const HelpSettings());
      case '/invite':
        return MaterialPageRoute(builder: (context) => const InviteSettings());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfileSettings());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR PAGE'),
        ),
      );
    });
  }
}
