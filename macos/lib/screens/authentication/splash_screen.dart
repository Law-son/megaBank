import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/screens/base_screen.dart';

//! splash screen class

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the Home screen route after a delay
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BaseScreen()),
      );
    });

    return Scaffold(
      backgroundColor: primaryWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'loading',
              flightShuttleBuilder: ((flightContext, animation, flightDirection, fromHeroContext, toHeroContext) => Image.asset(loadingImg)),
              child: Image.asset(loadingImg),
            ),
          ],
        ),
      ),
    );
  }
}
