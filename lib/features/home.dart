import 'package:flutter/material.dart';
import 'user/profile.dart';
import 'user/messages.dart';
import 'marketplace/marketplace.dart';
import 'user/presentation/post_card.dart';
import 'class/data/class_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> classIDs;

  @override
  void initState() {
    super.initState();
    classIDs = userDB2.getClassIDs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: classIDs.length,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(classID: classIDs[index]);
          },
        ),
      ),
      drawer: Drawer(
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
          ],
        ),
      ),
    );
  }
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
