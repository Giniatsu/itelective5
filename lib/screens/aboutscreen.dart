import 'package:flutter/material.dart';
import 'package:itelective5/shared%20widget/leftdrawer.dart';
import 'package:itelective5/shared%20widget/rightdrawer.dart';

class Aboutscreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  Aboutscreen({required this.userData});

  @override
  _AboutscreenState createState() => _AboutscreenState();
}

class _AboutscreenState extends State<Aboutscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('About Us Screen'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.userData['picture']['medium']),
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            )
          ],
        ),
        endDrawer: RightDrawer(userData: widget.userData,),
        drawer: MediaQuery.of(context).size.width < 600
            ? LeftDrawer(userData: widget.userData,)
            : null,
        body: Row(
          children: [
            MediaQuery.of(context).size.width > 600
                ? Flexible(flex: 1, child: LeftDrawer(userData: widget.userData,))
                : Container(),
            Flexible(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/coffee-2.jpg',
                        width: 500,
                        height: 500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Still have difficulties in understanding some terminologies.', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}