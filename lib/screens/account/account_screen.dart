import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/helpers/column_with_seprator.dart';
import 'package:grocery_app/screens/account/account_item.dart';
import 'package:grocery_app/screens/account/profile_page.dart';
import 'package:grocery_app/styles/colors.dart';

import '../welcome_screen.dart';
import 'orders_page.dart';
import 'personal_info_page.dart';
import 'delivery_address_page.dart';
import 'payment_methods_page.dart';
import 'negotiation_requests_page.dart';
import 'notifications_page.dart';
import 'help_page.dart';
import 'about_page.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ListTile(
                    leading: SizedBox(width: 65, height: 65, child: getImageHeader()),
                    title: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: AppText(
                        text: "अनमोल",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: AppText(
                      text: "github.com/anmol110923",
                      color: Color(0xff7C7C7C),
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  Column(
                    children: getChildrenWithSeperator(
                      widgets: accountItems.map((e) {
                        return getAccountItemWidget(context, e);
                      }).toList(),
                      seperator: Divider(thickness: 1),
                    ),
                  ),
                  SizedBox(height: 100), // Adjust this height if needed
                ],
              ),
            ),
            Positioned(
              bottom: 20, // Distance from the bottom of the screen
              left: 25,
              right: 25,
              child: logoutButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: AppButton(
        label: "लॉग आउट   ",
        trailingWidget: Icon(Icons.logout, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        },
      ),
    );
  }

  Widget getImageHeader() {
    String imagePath = "assets/images/account_image.jpg";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }

  Widget getAccountItemWidget(BuildContext context, AccountItem accountItem) {
    return InkWell(
      onTap: () {
        switch (accountItem.label) {
          case "ऑर्डर":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrdersPage()));
            break;
          case "मेरी जानकारी":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalInfoPage()));
            break;
          case "डिलीवरी पता":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveryAddressPage()));
            break;
          case "भुगतान के तरीके":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentMethodsPage()));
            break;
          case "Negotiation Requests":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NegotiationRequestsPage()));
            break;
          case "सूचनाएं":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationsPage()));
            break;
          case "सहायता":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpPage()));
            break;
          case "के बारे में":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
            break;
          default:
            break;
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(accountItem.iconPath),
            ),
            SizedBox(width: 20),
            Text(
              accountItem.label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/helpers/column_with_seprator.dart';
import 'package:grocery_app/screens/account/account_item.dart';
import 'package:grocery_app/screens/account/profile_page.dart';
import 'package:grocery_app/styles/colors.dart';

import '../welcome_screen.dart';
// Import pages for each section
import 'orders_page.dart';
import 'personal_info_page.dart';
import 'delivery_address_page.dart';
import 'payment_methods_page.dart';
import 'negotiation_requests_page.dart';
import 'notifications_page.dart';
import 'help_page.dart';
import 'about_page.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              ListTile(
                leading: SizedBox(width: 65, height: 65, child: getImageHeader()),
                title: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with your ProfilePage
                    );
                  },
                  child: AppText(
                    text: "अनमोल",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: AppText(
                  text: "github.com/anmol110923",
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              Column(
                children: getChildrenWithSeperator(
                  widgets: accountItems.map((e) {
                    return getAccountItemWidget(context, e);
                  }).toList(),
                  seperator: Divider(thickness: 1),
                ),
              ),
              SizedBox(height: 20),
              logoutButton(context),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: AppButton(
        label: "लॉग आउट   ",
        trailingWidget: Icon(Icons.logout, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        },
      ),
    );
  }

  Widget getImageHeader() {
    String imagePath = "assets/images/account_image.jpg";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }

  Widget getAccountItemWidget(BuildContext context, AccountItem accountItem) {
    return InkWell(
      onTap: () {
        // Define navigation for each account item based on its label
        switch (accountItem.label) {
          case "ऑर्डर":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrdersPage()));
            break;
          case "मेरी जानकारी":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalInfoPage()));
            break;
          case "डिलीवरी पता":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveryAddressPage()));
            break;
          case "भुगतान के तरीके":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentMethodsPage()));
            break;
          case "Negotiation Requests":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NegotiationRequestsPage()));
            break;
          case "सूचनाएं":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationsPage()));
            break;
          case "सहायता":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpPage()));
            break;
          case "के बारे में":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
            break;
          default:
          // Optional: handle unknown cases
            break;
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(accountItem.iconPath),
            ),
            SizedBox(width: 20),
            Text(
              accountItem.label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

 */
///////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/helpers/column_with_seprator.dart';
import 'package:grocery_app/styles/colors.dart';

import '../welcome_screen.dart';
import 'account_item.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: SizedBox(width: 65, height: 65, child: getImageHeader()),
                title: AppText(
                  text: "अनमोल",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: AppText(
                  text: "github.com/anmol110923",
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              Column(
                children: getChildrenWithSeperator(
                  widgets: accountItems.map((e) {
                    return getAccountItemWidget(e);
                  }).toList(),
                  seperator: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              logoutButton(context), // Pass context here
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: AppButton(
        label: "लॉग आउट   ",
       // color: Color(0xffF2F3F2), // Background color for the button
      //  textColor: AppColors.primaryColor, // Text color
      //  roundness: 18.0,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),

        trailingWidget: Icon(
          Icons.logout,
          color:Colors.white,
        ),
        onPressed: () {
          // Navigate to the WelcomeScreen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        },
      ),
    );
  }
/*
  Widget logoutButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),

      child: AppButton(
        icon: Icon(Icons.logout),
        label: "लॉग आउट",
        color: Color(0xffF2F3F2), // Background color for the button
        textColor: AppColors.primaryColor, // Text color
        roundness: 18.0,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),

        /*
        trailingWidget: SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            "assets/icons/account_icons/logout_icon.svg",
          ),
        ),

   */
        onPressed: () {
          // Navigate to the WelcomeScreen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        },
      ),
    );
  }

 */


/*
  Widget logoutButton(BuildContext context) { // Accept context here
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0,
          backgroundColor: Color(0xffF2F3F2),
          textStyle: TextStyle(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  // Navigate to WelcomeScreen
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomeScreen())
                  );
                },
              ),

            /*
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/account_icons/logout_icon.svg",
              ),
            ),

             */
            Text(
              "लॉग आउट",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {
          // Navigate to the WelcomeScreen
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => WelcomeScreen())
          );
        },
      ),
    );
  }

 */



  Widget getImageHeader() {
    String imagePath = "assets/images/account_image.jpg";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }

  Widget getAccountItemWidget(AccountItem accountItem) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              accountItem.iconPath,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            accountItem.label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}



/*
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading:
                SizedBox(width: 65, height: 65, child: getImageHeader()),
                title: AppText(
                  text: "अनमोल",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: AppText(
                  text: "github.com/anmol110923",
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              Column(
                children: getChildrenWithSeperator(
                  widgets: accountItems.map((e) {
                    return getAccountItemWidget(e);
                  }).toList(),
                  seperator: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              logoutButton(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget logoutButton() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0,
          backgroundColor: Color(0xffF2F3F2),
          textStyle: TextStyle(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/account_icons/logout_icon.svg",
              ),
            ),
            Text(
              "लॉग आउट",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {
          // Navigate to the WelcomeScreen
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => WelcomeScreen())
          );
        },
      ),
    );
  }

/*
  Widget logoutButton() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0,
          backgroundColor: Color(0xffF2F3F2),
          textStyle: TextStyle(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/account_icons/logout_icon.svg",
              ),
            ),
            Text(
              "लॉग आउट",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {},
      ),
    );
  }

 */

  Widget getImageHeader() {
    String imagePath = "assets/images/account_image.jpg";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }

  Widget getAccountItemWidget(AccountItem accountItem) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              accountItem.iconPath,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            accountItem.label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}

 */
*/