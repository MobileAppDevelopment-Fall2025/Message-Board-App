import 'package:flutter/material.dart';
import 'package:message_board_app/components/app_button.dart';
import 'package:message_board_app/components/text_field.dart';
import 'package:message_board_app/services/auth_service_data.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSplash = true;

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInEmailPass(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 100), () {
      if (mounted) {
        setState(() {
          showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 173, 193, 196),
      body: SafeArea(
        child: Center(
          child: showSplash
              ? _buildSplashScreen(context)
              : _buildLoginForm(context),
        ),
      ),
    );
  }

  Widget _buildSplashScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.forum_rounded,
            size: 100,
            color: Color.fromARGB(255, 62, 73, 82),
          ),
          const SizedBox(height: 20),
          const Text(
            'Message Board App',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 62, 73, 82),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Connect and talk freely with people.\nJoin the community today!\nHave fun :>',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 50, 60, 65),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showSplash = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 62, 73, 82),
              padding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 62, 73, 82),
            ),
          ),
          const SizedBox(height: 10),
          TextFields(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          TextFields(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          UsefulButton(onTap: signIn, text: "Sign In"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("New member?"),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
