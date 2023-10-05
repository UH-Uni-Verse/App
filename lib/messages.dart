import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'messages.dart';
import 'marketplace.dart';


class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500,
          child: Text(
            'Basic messaging page, allows students to connect with clubs and other students, ask them questions etc.'  ),
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
                title: Text("Messages Page"),
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
