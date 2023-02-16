import 'package:flutter/material.dart';
import 'package:itelective5/screens/aboutscreen.dart';
import 'package:itelective5/screens/MyScreenManager.dart';
import 'package:itelective5/screens/homescreen.dart';

import '../screens/Screens.dart';

class LeftDrawer extends StatefulWidget {
  final Map<String, dynamic> userData;

  LeftDrawer({required this.userData});
  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container();
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              if (MyScreenManager.getCurrentScreen() != Screens.Home) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Homescreen(userData: widget.userData)));
                MyScreenManager.setCurrentScreen(Screens.Home);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Projects'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.data_thresholding_outlined),
            title: const Text('Report'),
            onTap: () {},
          ),
          SizedBox(
            height: 100,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Us'),
            onTap: () {
              if (MyScreenManager.getCurrentScreen() != Screens.AboutUs) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aboutscreen(userData: widget.userData)));
                MyScreenManager.setCurrentScreen(Screens.AboutUs);
              }
            },
          ),
        ],
      ),
    );
  }
}