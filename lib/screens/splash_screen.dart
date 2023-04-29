import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_machine_task/screens/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Text(
        'Users App',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
      )),
    );
  }
}
