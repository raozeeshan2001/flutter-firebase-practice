import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';
import 'package:flutter_firebase_practice/widgets/round_btn.dart';

class FirestoreAdd extends StatefulWidget {
  const FirestoreAdd({super.key});

  @override
  State<FirestoreAdd> createState() => _FirestoreAddState();
}

class _FirestoreAddState extends State<FirestoreAdd> {
  final postcontroller = TextEditingController();
  final dbref = FirebaseFirestore.instance.collection('users');
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firestore add post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 4,
              controller: postcontroller,
              decoration: InputDecoration(
                  hintText: 'whats in your mind', border: OutlineInputBorder()
                  // prefixIcon: Icon(Icons.email)),
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            RoundBtn(
                title: 'Add',
                loading: loading,
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  dbref.doc(id).set({
                    'title': postcontroller.text.toString(),
                    'id': id
                  }).then((value) {
                    Utilities().toastmessage('poast added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utilities().toastmessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
