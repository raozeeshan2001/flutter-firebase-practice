import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_practice/UI/auth/login_screen.dart';
import 'package:flutter_firebase_practice/UI/firestore/firestore_add.dart';
import 'package:flutter_firebase_practice/UI/posts/add_post.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';

class FirestoreListScreen extends StatefulWidget {
  const FirestoreListScreen({super.key});

  @override
  State<FirestoreListScreen> createState() => _FirestoreListScreenState();
}

class _FirestoreListScreenState extends State<FirestoreListScreen> {
  final auth = FirebaseAuth.instance;
  final dbref = FirebaseFirestore.instance.collection('users').snapshots();
  final dialogcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('firestore list screen'),
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
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: dbref,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title:
                                    Text(snapshot.data!.docs[index]['title']),
                                subtitle: Text(
                                    snapshot.data!.docs[index].id.toString()),
                              );
                            }));
                  }
                  if (snapshot.hasError) {
                    return Text('some error');
                  } else
                    return Container();
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          hoverColor: Colors.blue[50],
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FirestoreAdd()));
          },
          child: Icon(Icons.add),
        ));
  }

  Future<void> showmydialog(String title, String id) async {
    dialogcontroller.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('update'),
            content: Container(
              child: TextField(
                controller: dialogcontroller,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('update')),
            ],
          );
        });
  }
}
