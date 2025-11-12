import 'package:flutter/material.dart';

class UsefulButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const UsefulButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 101, 123, 102),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))),
      ),
    );
  }
}
