import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';
import 'package:flutter_firebase_practice/widgets/round_btn.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final postcontroller = TextEditingController();
  final databaseref = FirebaseDatabase.instance.ref('post');
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add post'),
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
                  databaseref.child(id).set({
                    'title': postcontroller.text.toString(),
                    'id': id,
                  }).then((value) {
                    Utilities().toastmessage('post added');
                    setState(() {
                      loading = false;
                    });
                  }).onError(
                    (error, stackTrace) {
                      Utilities().toastmessage(error.toString());
                      setState(() {
                        loading = false;
                      });
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
