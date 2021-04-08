import 'package:chitchat/components/rounded_button.dart';
import 'package:chitchat/screens/chat_screen.dart';
import 'package:chitchat/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RegisterationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  bool showSpiner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // 1e

                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  // 2

                  SizedBox(
                    height: 48.0,
                  ),
                  // 3

                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // 4

                  SizedBox(
                    height: 8.0,
                  ),
                  // 5

                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                    textAlign: TextAlign.center,
                    obscureText: true,
                  ),
                  // 6

                  SizedBox(
                    height: 24,
                  ),
                  //7

                  RoundedButton(
                    onPressed: () async {
                      final progress = ProgressHUD.of(context);
                      progress?.show();
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        progress?.dismiss();
                        if (newUser != null)
                          Navigator.pushNamed(context, ChatScreen.id);
                      } catch (e) {
                        print(e);
                      }
                    },
                    title: 'Register',
                    color: Colors.redAccent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
