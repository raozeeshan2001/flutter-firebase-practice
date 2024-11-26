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
  final searchfliter = TextEditingController();
  final dialogcontroller = TextEditingController();
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: searchfliter,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'search',
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                  query: dbref,
                  defaultChild: Text('loading'),
                  itemBuilder: (context, snapshot, animation, index) {
                    final title = snapshot.child('title').value.toString();
                    if (searchfliter.text.isEmpty) {
                      return ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                        trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 1,
                                      child: ListTile(
                                        title: Text('Edit'),
                                        leading: Icon(Icons.edit),
                                        onTap: () {
                                          Navigator.pop(context);
                                          showmydialog(
                                              title,
                                              snapshot
                                                  .child('id')
                                                  .value
                                                  .toString());
                                        },
                                      )),
                                  PopupMenuItem(
                                      value: 1,
                                      child: ListTile(
                                        title: Text('Delete'),
                                        leading: Icon(Icons.delete),
                                        onTap: () {
                                          Navigator.pop(context);
                                          dbref
                                              .child(snapshot
                                                  .child('id')
                                                  .value
                                                  .toString())
                                              .remove();
                                        },
                                      ))
                                ]),
                      );
                    } else if (title
                        .toLowerCase()
                        .contains(searchfliter.text.toLowerCase())) {
                      return ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                      );
                    } else {
                      return Container();
                    }
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
                    dbref.child(id).update({
                      'title': dialogcontroller.text.toLowerCase()
                    }).then((value) {
                      Utilities().toastmessage('post added');
                    }).onError((error, stackTrace) {
                      Utilities().toastmessage(error.toString());
                    });
                  },
                  child: Text('update')),
            ],
          );
        });
  }
}




// Expanded(
//     child: StreamBuilder(
//         stream: dbref.onValue,
//         builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           } else {
//             Map<dynamic, dynamic> map =
//                 snapshot.data!.snapshot.value as dynamic;
//             final items = map.values.toList();
//             return ListView.builder(
//                 itemCount: snapshot.data!.snapshot.children.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(items[index]['title']),
//                     subtitle: Text(items[index]['id']),
//                   );
//                 });
//           }
//         })),
