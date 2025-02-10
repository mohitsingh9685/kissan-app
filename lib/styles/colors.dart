
import 'package:flutter/material.dart';

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();
  static const primaryColor = Colors.green;
//  static const primaryColor = Color(0xfa25f5e3);
  static const darkGrey = Color(0xff1a1515);
}
