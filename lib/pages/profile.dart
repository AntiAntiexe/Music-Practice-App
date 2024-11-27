import 'package:flutter/material.dart';
import 'dart:io';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(45, 56, 78, 1),
      child: const Center(
        child: Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 123, 0),
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}