import 'package:flutter/material.dart';
import 'package:app/features/home.dart';
import 'package:app/features/user/profile.dart';
import 'package:app/features/user/messages.dart';
import 'package:app/features/marketplace/marketplace.dart';
import 'package:app/features/class/data/class_data.dart';
import 'package:app/features/user/data/user_data.dart';
import 'package:app/features/user/data/user_provider.dart';
import 'package:app/features/class/data/class_provider.dart';
import 'package:app/features/user/other_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassPage extends StatefulWidget {
  final String classID;

  const ClassPage({Key? key, required this.classID}) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userDB2 = ref.read(userDBProvider2);
        UserData2 userData = userDB2.getUser(widget.classID);

        List<String> studentNames = userData.students.split(', ');

        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.green.shade900],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: 60.0,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                            AssetImage(userData.imagePath),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userData.name,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userData.professor,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Class Description',
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        userData.description,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Students Enrolled',
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: studentNames.map((studentName) {
                          return GestureDetector(
                            onTap: () async {
                              // Find the user's ID by name
                              String userId = userDB.getUserIDByName(studentName);

                              // Navigate to OtherProfilePage with the user's id
                              await Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => OtherProfilePage(studentID: userId),
                              ));
                            },
                            child: Text(
                              studentName,
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
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
                        builder: (BuildContext context) =>
                            MarketplacePage()));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
