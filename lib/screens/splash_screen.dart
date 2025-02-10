import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return WelcomeScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    //  backgroundColor: AppColors.primaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}
Widget splashScreenIcon() {
  String iconPath = "assets/icons/logo kissan setu.png"; // Ensure this path is correct
  return Image.asset(
    iconPath,
    height: 400, // Set a height to make sure it's visible
    width:400, // Set a width to make sure it's visible
  );
}
/*
Widget splashScreenIcon() {
  String iconPath = "assets/icons/splash_screen_icon.jpg";
  return SvgPicture.asset(
    iconPath,
  );
}

 */
