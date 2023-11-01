import 'package:flutter/material.dart';
import 'package:app/features/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> allowedEmails = [
    'zp6@hawaii.edu',
    'user1@hawaii.edu',
    // Add more allowed email addresses here
  ];
  String enteredEmail = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 60),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/hawaii-image.jpg')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    enteredEmail = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'UHM Email',
                    hintText: 'Enter valid email id as abc@hawaii.edu'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 20),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'UHM Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.green[800], ),
              child: ElevatedButton(
                onPressed: () {
                  if (allowedEmails.contains(enteredEmail)) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                  } else {
                    // Show an error message or take other actions for unauthorized users
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.green[800], fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}