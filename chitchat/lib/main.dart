import 'package:chitchat/screens/chat_screen.dart';
import 'package:chitchat/screens/login_screen.dart';
import 'package:chitchat/screens/regiteration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chitchat/screens/welcome_screem.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChitChat",
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegisterationScreen.id: (context) => RegisterationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
