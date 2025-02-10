import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  const AppButton({
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.yellow, // Default to yellow
    this.textColor = Colors.black, // Default to black
    this.fontWeight = FontWeight.w400,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Correct property for background color
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          color: textColor, // Set text color here
          fontWeight: fontWeight,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor, fontWeight: fontWeight),
      ),
    );
  }
}
