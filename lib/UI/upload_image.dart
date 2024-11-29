// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_practice/widgets/round_btn.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class UploadImage extends StatefulWidget {
//   const UploadImage({super.key});

//   @override
//   State<UploadImage> createState() => _UploadImageState();
// }

// class _UploadImageState extends State<UploadImage> {
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//   File? _image;
//   final picker = ImagePicker();
//   Future getimagegallery() async {
//     final pickedimage = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedimage != null) {
//         _image = File(pickedimage.path);
//       } else {
//         print('no image picked');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('upload image screen'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: InkWell(
//               onTap: () {
//                 getimagegallery();
//               },
//               child: Container(
//                 height: 100,
//                 width: 100,
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.black)),
//                 child: _image != null
//                     ? Image.file(_image!.absolute)
//                     : Icon(Icons.image),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: RoundBtn(
//                   title: 'add image',
//                   ontap: () {
//                     firebase_storage.Reference reference = firebase_storage
//                         .FirebaseStorage.instance
//                         .ref('/foldername' + '1234');
//                     firebase_storage.UploadTask uploadTask =
//                         reference.putFile(_image!.absolute);
//                   }))
//         ],
//       ),
//     );
//   }
// }
