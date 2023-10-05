import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'messages.dart';
import 'marketplace.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500,
            child: Text(
              'Basic profile page, will include classes, basic personal info, major, interests, etc.',
            ),
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
