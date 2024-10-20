import 'package:flutter/material.dart';
import 'dart:io';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 80, 80, 80),
      child: const Center(
        child: Text(
          "Page Number 3",
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