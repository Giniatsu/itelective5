import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class UserCard extends StatefulWidget {
  final Map<String, dynamic> userData;

  UserCard({required this.userData});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final _random = Random();
// Generate a random color for the gradient
    final color1 = Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0,
    );
    final color2 = Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0,
    );

    return Card(
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1 , color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width * .5,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(widget.userData['picture']['large']),
            ),
            const SizedBox(height: 15),
            Text(
              "${widget.userData['name']['first']} ${widget.userData['name']['last']}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Text(
              "${widget.userData['login']['username']}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 255, 235, 183),
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'I am ',
                style: TextStyle(color: Colors.white, fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: '${widget.userData['dob']['age']} years old',
                      style: TextStyle(color: Colors.blue)),
                  TextSpan(
                    text: ', presently living in',
                  ),
                  TextSpan(
                      text: ' ${widget.userData['location']['street']['number']} ${widget.userData['location']['street']['name']}, ${widget.userData['location']['city']}, ${widget.userData['location']['state']} ${widget.userData['location']['postcode']}, ${widget.userData['location']['country']}.',
                      style: TextStyle(color: Colors.blue)),
                  TextSpan(
                    text: ' My phone number is',
                  ),
                  TextSpan(
                      text: ' ${widget.userData['phone']}',
                      style: TextStyle(color: Colors.cyan)),
                  TextSpan(
                    text: ' and cell number is',
                  ),
                  TextSpan(
                      text: ' ${widget.userData['cell']}', style: TextStyle(color: Colors.cyan)),
                  TextSpan(
                    text: ' currently.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 255, 235, 183)),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Colors.grey),
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )),
              ),
              child: Text("${widget.userData['email']}"),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: color1,
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: color1,
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: color1,
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.discord,
                      color: color1,
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: color1,
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.dev,
                      color: color1,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
