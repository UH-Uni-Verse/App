import 'package:app/profile.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'messages.dart';
import 'marketplace.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}
// break

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500,
          child: Text(
            'Home/Explore page, This is the main hub of the app. This is where all students will get automatically updated classes, student groups, and other students. You can filter by class, students, and clubs/groups. This is innovative because it creates a single place for a lot of students to connect. It allows students to better pursue their interests, and it will overall make life easier for a lot of students looking to adjust to living far from home or people who just need to connect with others.'
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
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Welcome',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
