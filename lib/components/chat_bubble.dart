import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 112, 150, 137),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
