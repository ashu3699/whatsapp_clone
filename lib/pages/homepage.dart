import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/menu/calls_menu.dart';
import 'package:whatsapp/menu/chats_menu.dart';
import 'package:whatsapp/menu/status_menu.dart';
import 'package:whatsapp/screens/calls_screen.dart';
import 'package:whatsapp/screens/camera_screen.dart';
import 'package:whatsapp/screens/chats_screen.dart';
import 'package:whatsapp/screens/status_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  Widget appMenuOptions() {
    switch (_selectedIndex) {
      case 1:
        return const ChatsMenu();

      case 2:
        return const StatusMenu();

      case 3:
        return const CallsMenu();
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return _selectedIndex == 0
        ? CameraScreen(cameras: widget.cameras)
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                "WhatsApp",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  splashRadius: 20,
                  onPressed: () {},
                ),
                appMenuOptions(),
              ],
              bottom: TabBar(
                isScrollable: true,
                // indicatorColor: Colors.white,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  const SizedBox(
                    child: Tab(icon: Icon(Icons.camera_alt)),
                    // width: 28,
                  ),
                  SizedBox(
                    child: const Tab(text: 'CHATS'),
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  SizedBox(
                    child: const Tab(text: 'STATUS'),
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  SizedBox(
                    child: const Tab(text: 'CALLS'),
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                // CameraScreen(camera: widget.camera),
                // ChatScreen(),
                SizedBox.shrink(),
                ChatScreen(),
                StatusScreen(),
                CallsScreen(),
              ],
            ));
  }
}
