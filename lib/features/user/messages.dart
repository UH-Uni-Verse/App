import 'package:flutter/material.dart';
import 'package:app/features/home.dart';
import 'package:app/features/user/profile.dart';
import 'package:app/features/marketplace/marketplace.dart';
import 'package:app/features/user/data/user_data.dart';
import 'package:app/features/user/data/message_data.dart';


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
        child: Align(
    // align the child within the container
            alignment: MessageValues.isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
            child: DecoratedBox(
    // chat bubble decoration
              decoration: BoxDecoration(
                color: MessageValues.isCurrentUser ? Colors.green.shade900 : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  MessageValues.text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: MessageValues.isCurrentUser ? Colors.white : Colors.black87),
                ),
              ),

            ) ,

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
