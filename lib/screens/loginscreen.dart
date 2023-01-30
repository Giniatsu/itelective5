import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:itelective5/screens/signupscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  int currentIndex = 0;
  final images = [
    'assets/images/coffee-1.jpg',
    'assets/images/coffee-2.jpg',
    'assets/images/coffee-3.jpg',
    'assets/images/coffee-4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return desktopView(context);
        } else {
          return mobileView(context);
        } 
      },
      ));
  }

  Widget desktopView(BuildContext context){
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: carouselSlider(context),
                ),
                Container(
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.bottomCenter,
                    child: buildIndicator())
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: loginButtons(context),
          ),
        ),
      ],
    );
  }

  Widget mobileView(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          width: MediaQuery.of(context).size.width,
          height: 500,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: carouselSlider(context),
              ),
              Container(
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.bottomCenter,
                  child: buildIndicator())
            ],
          ),
        ),
        Container(
          child: loginButtons(context),
        )
      ],
    );
  }

  CarouselSlider carouselSlider(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        final image = images[index];
        return buildImage(image, index);
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) => setState(() => currentIndex = index),
      ),
    );
  }

  Widget buildImage(String image, int index) =>
      Container(child: Image.network(image, fit: BoxFit.cover, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
            dotWidth: 5, dotHeight: 5, activeDotColor: Colors.brown),
        activeIndex: currentIndex,
        count: images.length,
      );
  
  Widget loginButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Coffee on your Desk",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Superfast..",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        theButton(
            "LOGIN",
            MediaQuery.of(context).size.width,
            Color.fromARGB(255, 239, 92, 102),
            Colors.white,
            Colors.transparent,
            0),
        const SizedBox(
          height: 15,
        ),
        theButton("SIGNUP", MediaQuery.of(context).size.width, Colors.white,
            Color.fromARGB(255, 239, 92, 102), Colors.black, 2),
        const SizedBox(
          height: 15,
        ),
        Row(children: <Widget>[
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
          Text("or Login with"),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                iconSize: 40,
                color: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 15),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                )),
            IconButton(
                onPressed: () {},
                iconSize: 40,
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 15),
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                )),
          ],
        ),
      ],
    );
  }

  void _login() {}
  void _signup() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const Signupscreen();
      },
    ));
  }
  Widget theButton(String caption, double width, Color bgcolor, Color txtcolor,
      Color bscolor, double num) {
    return Container(
      width: width * .75,
      child: ElevatedButton(
        onPressed: () {
          if (caption == "LOGIN") {
            _login();
          } else {
            _signup();
          }
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all<Color>(bgcolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: bscolor, width: num),
            ),
          ),
        ),
        child: Text(
          caption,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtcolor,
          ),
        ),
      ),
    );
  }

}
