import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/farmer/reviews_farmer.dart';
import '../welcome_screen.dart';
import 'farmer_profile.dart';
import 'earning.dart';
import 'farmer_orders.dart';
import 'help.dart';
import 'requested_orders.dart';
import 'Delivery_list.dart';

class FarmerDrawer extends StatelessWidget {
  const FarmerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
 //   final imageUrl = "https://i.pinimg.com/736x/8c/ac/bd/8cacbd0d4d6915fd8be66ef6a6e9c411.jpg";
    return Drawer(
        child: Container(
          color:Colors.white,
          child: ListView(
            padding:EdgeInsets.zero,

            children: [
              DrawerHeader(
                padding:EdgeInsets.zero ,

                child: UserAccountsDrawerHeader(

                  margin:EdgeInsets.zero,
                  //decoration: BoxDecoration(color:Colors.grey),
                  accountName:Text("Mohit Singh"),
                  accountEmail: Text("mohitsinghrajput801103@gmail.com"),

                  currentAccountPicture: CircleAvatar(
                   backgroundImage:NetworkImage("https://www.shutterstock.com/image-photo/beautiful-dramatic-portrait-indian-rural-260nw-2030598839.jpg")  ,
                  ),
               //   currentAccountPicture: Image.network(imageUrl),
                ),
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.profile_circled,
                  color:Colors.black,

                ),
                title:Text( "Profile",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.money_dollar_circle,
                  color:Colors.black,

                ),
                title:Text( "Earning",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => EarningPage()));
                },
              ),

              ListTile(
                leading:Icon(
                  CupertinoIcons.cube_box,
                  color:Colors.black,

                ),
                title:Text( "Orders",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FarmerOrdersPage()));
                },
              ),

              ListTile(
                leading:Icon(
                  CupertinoIcons.timer,
                  color:Colors.black,

                ),
                title:Text( "Requested Orders",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RequestedOrdersPage()));
                },
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.square_list,
                  color:Colors.black,

                ),
                title:Text( "Deliveries List",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DeliveryListPage()));
                },
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.paperplane,
                  color:Colors.black,

                ),
                title:Text( "Reviews",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ReviewsPage()));
                },
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.question_circle,
                  color:Colors.black,

                ),
                title:Text( "Help",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HelpPage()));
                },
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.power,
                  color:Colors.black,

                ),
                title:Text( "LogOut",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomeScreen())
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}