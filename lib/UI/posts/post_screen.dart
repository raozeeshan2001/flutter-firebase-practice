import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/UI/auth/login_screen.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                  .onError(
                (error, stackTrace) {
                  Utilities().toastmessage(error.toString());
                },
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
