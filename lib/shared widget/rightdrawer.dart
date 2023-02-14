import 'package:flutter/material.dart';
import 'package:itelective5/screens/loginscreen.dart';
import 'package:itelective5/usercard.dart';

class RightDrawer extends StatefulWidget {
  final Map<String, dynamic> userData;

  RightDrawer({required this.userData});

  @override
  State<RightDrawer> createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {
  void _clearUserData() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Loginscreen()), (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width > 600
          ? MediaQuery.of(context).size.width * 0.3
          : MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: UserCard(userData: widget.userData,),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Wrap(runSpacing: 16, children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Loginscreen()),
                      (Route<dynamic> route) => false);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
