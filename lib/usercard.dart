import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 35, 55, 99),
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width * .5,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: Color.fromARGB(255, 255, 110, 49),
              foregroundImage: AssetImage(
                "assets/images/myself.png",
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Russel Garcia",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Text(
              "Web Developer",
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
                text: 'A student of ',
                style: TextStyle(color: Colors.white, fontSize: 15),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Ateneo de Davao University',
                      style: TextStyle(color: Colors.blue)),
                  TextSpan(
                    text: ', presently studying',
                  ),
                  TextSpan(
                      text: ' Information Technology.',
                      style: TextStyle(color: Colors.blue)),
                  TextSpan(
                    text: ' Learning',
                  ),
                  TextSpan(
                      text: ' Flutter',
                      style: TextStyle(color: Colors.cyan)),
                  TextSpan(
                    text: ' and',
                  ),
                  TextSpan(
                      text: ' React', style: TextStyle(color: Colors.cyan)),
                  TextSpan(
                    text: ' this semester.',
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
              child: Text("aragarcia@addu.edu.ph"),
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
                      color: Color.fromARGB(255, 173, 142, 112),
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Color.fromARGB(255, 173, 142, 112),
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Color.fromARGB(255, 173, 142, 112),
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.discord,
                      color: Color.fromARGB(255, 173, 142, 112),
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Color.fromARGB(255, 173, 142, 112),
                    )),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: FaIcon(
                      FontAwesomeIcons.dev,
                      color: Color.fromARGB(255, 173, 142, 112),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
