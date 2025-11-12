import 'package:flutter/material.dart';
import 'package:message_board_app/pages/login.dart';
import 'package:message_board_app/pages/registration.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;

  void switchPage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(onTap: switchPage);
    } else {
      return Register(onTap: switchPage);
    }
  }
}
