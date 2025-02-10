
import 'package:flutter/material.dart';
import 'package:grocery_app/styles/colors.dart';
class AppButton extends StatelessWidget {
  final String label;
  final double roundness;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final Widget? trailingWidget;
  final Widget? icon; // Add this line for the icon
  final VoidCallback? onPressed;
  final Color color; // Button color
  final Color textColor; // Text color

  const AppButton({
    Key? key,
    required this.label,
    this.roundness = 18,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
    this.trailingWidget,
    this.icon, // Include icon in the constructor
    this.onPressed,
    this.color = Colors.green, // Default button color
    this.textColor = Colors.white, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Use the color parameter
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundness),
          ),
          elevation: 0,
          padding: padding,
          minimumSize: const Size.fromHeight(50),
          textStyle: TextStyle(
            color: textColor, // Use the textColor parameter
            fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
            fontWeight: fontWeight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center items
          children: [
            if (icon != null) ...[
              icon!, // Display the icon if provided
              SizedBox(width: 8), // Space between icon and text
            ],
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: fontWeight,
                color: textColor, // Use the textColor parameter
              ),
            ),
            if (trailingWidget != null)
              Positioned(
                top: 0,
                right: 25,
                child: trailingWidget!,
              ),
          ],
        ),
      ),
    );
  }
}
/*
class AppButton extends StatelessWidget {
  final String label;
  final double roundness;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final Widget? trailingWidget;
  final VoidCallback? onPressed;
  final Color color; // Button color
  final Color textColor; // Text color

  const AppButton({
    Key? key,
    required this.label,
    this.roundness = 18,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
    this.trailingWidget,
    this.onPressed,
    this.color = Colors.green, // Default button color
    this.textColor = Colors.white, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Use the color parameter
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundness),
          ),
          elevation: 0,
          padding: padding,
          minimumSize: const Size.fromHeight(50),
          textStyle: TextStyle(
            color: textColor, // Use the textColor parameter
            fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
            fontWeight: fontWeight,
          ),
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: fontWeight,
                  color: textColor, // Use the textColor parameter
                ),
              ),
            ),
            if (trailingWidget != null)
              Positioned(
                top: 0,
                right: 25,
                child: trailingWidget!,
              ),
          ],
        ),
      ),
    );
  }
}

 */
