/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/screens/FarmerScreen.dart'; // Import the FarmerScreen
import 'package:grocery_app/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'auth_buyer.dart';

class WelcomeScreen extends StatelessWidget {
  final String imagePath = "assets/images/image1.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit:BoxFit.cover,


          ),
        ),

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              icon(),
              SizedBox(
                height: 20,
              ),
              welcomeTextWidget(),
              SizedBox(
                height: 10,
              ),
              sloganText(),
              SizedBox(
                height: 40,
              ),
              getBuyerButton(context),
              SizedBox(
                height: 20,
              ),
              getFarmerButton(context),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget icon() {
    String iconPath = "assets/images/kisam.svg"; // Ensure this is the correct SVG file path
    return SvgPicture.asset(
      iconPath,
      width: 48,
      height: 56,
    );
  }

  Widget welcomeTextWidget() {
    return Column(
      children: [
        AppText(
          text: "",
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        AppText(
          text: "आगे बढ़े",
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget sloganText() {
    return AppText(
      text: "कृषकान्नं समृद्धि, सर्वभूतानांसुखम",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xff1a1515).withOpacity(0.7),
    );
  }

  Widget getBuyerButton(BuildContext context) {
    return AppButton(
      label: "उपभोक्ता",
      fontWeight: FontWeight.w800,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) {
            return AuthScreen();
          },
        ));
      },
    );
  }

  Widget getFarmerButton(BuildContext context) {
    return AppButton(
      label: "किसान",
      fontWeight: FontWeight.w800,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) {
            return FarmerPage();
          },
        ));
      },
    );
  }
}

 */

///////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/farmer/FarmerScreen.dart'; // Import the FarmerScreen
import 'package:grocery_app/screens/auth_buyer.dart';

class WelcomeScreen extends StatefulWidget {
 // final String imagePath = "assets/images/kissan setu boy png.png";
  const WelcomeScreen({super.key});


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();}


class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 165, 230, 243),




            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              //  padding: EdgeInsets.fromLTRB(
              //      20, MediaQuery.of(context).size.height * 0.1, 20, 0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallLogoWidget("assets/images/india-removebg-preview.png"),
                        smallLogoWidget("assets/images/languageButton-removebg-preview.png"),
                      ],
                    ),

                    const SizedBox(height: 10),
                    const Text(

                      'Welcome to KISSAN Setu',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20), // spacing between welocme msg and delivery boy logo


                    // delivery boy logo
                    logoWidget("assets/images/kissan setu boy png.png"),


                    const SizedBox(height: 30), // spacing between delivery boy logo and continue as
                    const Text(
                      'कृषकान्नं समृद्धि, सर्वभूतानांसुखम',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                       // color: Color(0xff1a1515).withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Continue as',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 30), //spacing between continue as and farmer button
                    // Farmer Button
                    Container(
                      width: 200, // Set the width of the button
                      height: 50, // Set the height of the button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) {
                              return FarmerPage();
                            },
                          ));
                        //  print("Farmer button pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 238, 180, 0), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Set the curve of the button
                          ),
                          elevation: 5, // Set shadow
                        ),
                        child: const Text(
                          'किसान',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Text color
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Space between the buttons


                    // Buyer Button
                    Container(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) {
                              return AuthScreen();
                            },
                          )
                          );
                       //   print("Buyer button pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 238, 180, 0), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Set the curve of the button
                          ),
                          elevation: 5, // Set shadow
                        ),
                        child: const Text(
                          'उपभोक्ता',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Text color
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30), // spacing between buyer button and disclaimer.......keep


                    // for disclaimer message
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity, // Full width of the screen
                        color: Color.fromARGB(255, 56, 149, 167),
                        padding: const EdgeInsets.all(7), // Padding around the text
                        child: const Text(
                          'By continuing, you agree to our Terms of Service and Privacy Policy.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
/*
          // for india logo
          Positioned(
            top: 15,
            left: 12,
            child: smallLogoWidget("assets/images/india-removebg-preview.png"),
            //child: smallLogoWidget("assets/images/Screenshot 2024-09-06 at 2.57.15 AM.png"),

          ),
          //for language log
          // for india logo
          Positioned(
            top: 15,
            right: 12,
            child: smallLogoWidget("assets/images/languageButton-removebg-preview.png"),
          ),

 */
        ],
      ),
    );
  }
}


// Reusable logo widget function for delivery boy png
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 300,
    height: 300,
  );
}


// Reusable logo widget function for india logo
Image smallLogoWidget(String imageName) {
  return Image.asset(
    imageName,
    width: 40, // Set the width for small logo
    height: 40, // Set the height for small logo
  );
}
