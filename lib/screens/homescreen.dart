import 'package:flutter/material.dart';
import 'package:itelective5/usercard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.person),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            )
          ],
        ),
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: UserCard(),
              ),
              Container(
                padding: EdgeInsets.all(24),
                child: Wrap(
                  runSpacing: 16,
                  children: [
                    ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  ]
                ),
              ),
            ],
          ),
        ),
        drawer: MediaQuery.of(context).size.width < 600
            ? const NavigationDrawer()
            : null,
        body: Row(
          children: [
            MediaQuery.of(context).size.width > 600
                ? Flexible(flex: 1, child: NavigationDrawer())
                : Container(),
            Flexible(
              flex: 3,
              child: Center(
                child: Image.asset(
                  'assets/icon/icon.png',
                  width: 500,
                  height: 500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
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
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
