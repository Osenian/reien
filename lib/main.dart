import 'package:flutter/material.dart';
import 'package:reien/screens/home.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Mi App",
      home: SafeArea(
        child: Home(),
      ),
    ),
  );
}
