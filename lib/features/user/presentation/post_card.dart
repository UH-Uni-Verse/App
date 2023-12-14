import 'package:flutter/material.dart';
import 'package:app/features/class/data/class_data.dart';
import 'package:app/features/class/data/class_provider.dart';
import 'package:app/features/user/presentation/themes.dart';
import 'package:app/features/class/class.dart';

class PostCard extends StatelessWidget {
  final String classID;

  const PostCard({Key? key, required this.classID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData2 userData = userDB2.getUser(classID);

    return AspectRatio(
      aspectRatio: 5 / 1,
      child: Card(
        margin: EdgeInsets.all(16.0),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _Post(userData: userData, onVisitClassPage: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ClassPage(classID: classID)),
              );
            }),
            _PostDetails(userData: userData, onVisitClassPage: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ClassPage(classID: classID)),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  final UserData2 userData;
  final VoidCallback onVisitClassPage;

  const _Post({Key? key, required this.userData, required this.onVisitClassPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _PostImage(userData: userData),
          SizedBox(width: 12.0),
          _PostTitleAndSummary(userData: userData),
        ],
      ),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  final UserData2 userData;

  const _PostTitleAndSummary({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(userData.name, style: TextThemes.title),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  final UserData2 userData;

  const _PostImage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      child: Image.asset(userData.imagePath, fit: BoxFit.cover),
    );
  }
}

class _PostDetails extends StatelessWidget {
  final UserData2 userData;
  final VoidCallback onVisitClassPage;

  const _PostDetails({Key? key, required this.userData, required this.onVisitClassPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _UserImage(userData: userData),
          SizedBox(width: 12.0),
          _UserNameAndEmail(userData: userData),
          SizedBox(width: 12.0),
          _ClassButton(onVisitClassPage: onVisitClassPage),
        ],
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  final UserData2 userData;

  const _UserNameAndEmail({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Professor: ${userData.professor}',
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  final UserData2 userData;

  const _UserImage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundImage: AssetImage(userData.imagePath2),
    );
  }
}

class _ClassButton extends StatelessWidget {
  final VoidCallback onVisitClassPage;

  const _ClassButton({Key? key, required this.onVisitClassPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.green[800],
      ),
      child: ElevatedButton(
        onPressed: onVisitClassPage,
        style: ElevatedButton.styleFrom(
          primary: Colors.green[800],
          padding: EdgeInsets.symmetric(vertical: 12.0),
        ),
        child: Text(
          'Visit Class Page',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
