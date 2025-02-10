
class AccountItem {
  final String label;
  final String iconPath;

  AccountItem(this.label, this.iconPath);
}

List<AccountItem> accountItems = [
  AccountItem("ऑर्डर", "assets/icons/account_icons/orders_icon.svg"),
  AccountItem("मेरी जानकारी", "assets/icons/account_icons/details_icon.svg"),
  AccountItem("डिलीवरी पता", "assets/icons/account_icons/delivery_icon.svg"),
  AccountItem("भुगतान के तरीके", "assets/icons/account_icons/payment_icon.svg"),
  AccountItem("Negotiation Requests", "assets/icons/account_icons/promo_icon.svg"),
  AccountItem("सूचनाएं", "assets/icons/account_icons/notification_icon.svg"),
  AccountItem("सहायता", "assets/icons/account_icons/help_icon.svg"),
  AccountItem("के बारे में", "assets/icons/account_icons/about_icon.svg"),
];


///////////////////////////////////below mohit code,,hum soche drawer page jaisa dal de
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //final imageUrl = "https://static.themarthablog.com/2021/01/PXL_20210114_192157378.MP_-scaled.jpg";
    return Drawer(
        child: Container(
          color:Colors.deepPurple,
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
                    backgroundImage:NetworkImage("https://static.themarthablog.com/2021/01/PXL_20210114_192157378.MP_-scaled.jpg")  ,
                  ),
                  //currentAccountPicture: Image.network(imageUrl),
                ),
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.home,
                  color:Colors.white,

                ),
                title:Text( "Home",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.mail,
                  color:Colors.white,

                ),
                title:Text( "Mail",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading:Icon(
                  CupertinoIcons.profile_circled,
                  color:Colors.white,

                ),
                title:Text( "Profile",
                  textScaleFactor: 1.2,
                  style:TextStyle(
                    color:Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
*/