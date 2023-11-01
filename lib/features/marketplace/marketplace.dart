import 'package:flutter/material.dart';
import 'package:app/features/home.dart';
import 'package:app/features/user/profile.dart';
import 'package:app/features/user/messages.dart';
import 'package:app/features/marketplace/marketplace.dart';


class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});
  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500,
          child: Text(
              'Shows a college life specific marketplace where students can buy and sell things like used mopeds, shelves, fans, and other commonly used college items to other students. This will be a possible revenue stream through taking a percentage of the sales and will make life a lot easier for a lot of students.'  ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Text("Home Page"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
                },
              ),
              ListTile(
                title: Text("Profile Page"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProfilePage()));
                },

              ),
              ListTile(
                title: Text("Messages"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MessagesPage()));
                },

              ),
              ListTile(
                title: Text("Marketplace"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MarketplacePage()));
                },

              ),
              //add new pages here
            ]

        ),
      ),
    );
  }
}
