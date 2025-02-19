import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splash();
    super.initState();
  }

  Future<void> splash() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          child: Image.asset('assets/images/ang.jpg'),
        ),
      ),
    );
  }
}
