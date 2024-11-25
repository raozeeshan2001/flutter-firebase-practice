import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/UI/auth/login_screen.dart';
import 'package:flutter_firebase_practice/UI/posts/add_post.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final dbref = FirebaseDatabase.instance.ref('post');
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
        body: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: dbref,
                  defaultChild: Text('loading'),
                  itemBuilder: (context, snapshot, animation, index) {
                    return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          hoverColor: Colors.blue[50],
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPost()));
          },
          child: Icon(Icons.add),
        ));
  }
}
