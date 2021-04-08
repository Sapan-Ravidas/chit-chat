import 'package:chitchat/screens/login_screen.dart';
import 'package:chitchat/screens/regiteration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chitchat/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  bool _initialized = false;
  bool _error = false;

  AnimationController controller;
  Animation animation;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      _initialized = true;
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 1

            Row(
              children: <Widget>[
                // 1.a

                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'images/logo.png',
                      height: 64,
                    ),
                  ),
                ),

                // 1.b

                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Chit-Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                  pause: Duration(seconds: 2),
                  totalRepeatCount: 1,
                )
              ],
            ),
            // 2

            SizedBox(
              height: 48.0,
            ),
            // 3

            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.orangeAccent,
              title: 'Log In',
            ),
            // 3

            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterationScreen.id);
              },
              color: Colors.redAccent,
              title: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
