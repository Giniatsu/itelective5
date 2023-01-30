import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _formKey = GlobalKey<FormState>();
  int currentIndex = 0;
  final images = [
    'assets/images/coffee-1.jpg',
    'assets/images/coffee-2.jpg',
    'assets/images/coffee-3.jpg',
    'assets/images/coffee-4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return desktopView(context);
        } else {
          return mobileView(context);
        }
      },
    ));
  }

  Widget desktopView(BuildContext context) {
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
            child: signupform(context),
          ),
        ),
      ],
    );
  }

  Widget mobileView(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomCenter,
                  child: buildIndicator())
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 420,
              height: 640,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: signupform(context))
        ],
      )
    ]);
  }

  Form signupform(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Create an account, It's free",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: tmf(
                      label: "First Name",
                      errormessage: "Please enter your first name"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: tmf(
                      label: "Last Name",
                      errormessage: "Please enter your last name"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            tmf(
                label: "Email Address",
                errormessage: "Please enter your email address"),
            const SizedBox(height: 10),
            tmf(label: "Username", errormessage: "Please enter your username"),
            const SizedBox(height: 10),
            tmf(
                label: "Password",
                errormessage: "Please enter your password",
                obscureText: true),
            const SizedBox(height: 10),
            tmf(
                label: "Confirm Password",
                errormessage: "Please confirm your password",
                obscureText: true),
            const SizedBox(height: 10),
            Container(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(20)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                  }
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Color.fromARGB(255, 239, 92, 102)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField tmf(
      {required String label,
      required String errormessage,
      obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errormessage;
        }
        return null;
      },
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

  Widget buildImage(String image, int index) => Container(
          child: Image.network(
        image,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
            dotWidth: 5, dotHeight: 5, activeDotColor: Colors.brown),
        activeIndex: currentIndex,
        count: images.length,
      );
}
