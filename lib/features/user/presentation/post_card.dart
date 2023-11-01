import 'package:flutter/material.dart';
import 'package:app/features/class/data/class_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/class/data/class_provider.dart';
import 'package:app/features/user/presentation/themes.dart';
import 'package:app/features/class/class.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 2,
      child: Card(
        child: Column(children: <Widget>[_Post(), _PostDetails()]),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: <Widget>[_PostImage(), _PostTitleAndSummary()],
      ),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final container = ProviderContainer(); // Create a ProviderContainer

    // Use the container to read the providers
    final userDB = container.read(userDBProvider);
    UserData userData = userDB.getUser('class-001');

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(userData.name, style: TextThemes.title),
        ],
      ),
    );
  }
}



class _PostImage extends StatelessWidget {
  const _PostImage({super.key});

  @override
  Widget build(BuildContext context) {
    UserData userData = userDB.getUser('class-001');
    return Expanded(flex: 2, child: Image.asset(userData.imagePath));
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_UserImage(), _UserNameAndEmail(), _ClassButton()],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    UserData userData = userDB.getUser('class-001');
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(userData.name),
          Text(userData.email),

        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    UserData userData = userDB.getUser('class-001');
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        backgroundImage: AssetImage(userData.imagePath),
      ),
    );
  }
}
class _ClassButton extends StatelessWidget {
  const _ClassButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 750,
      decoration: BoxDecoration(
        color: Colors.green[800], ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ClassPage()));
        },
        child: Text(
          'Class Page',
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
    );
  }
}
