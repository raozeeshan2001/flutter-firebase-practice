import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';
import 'package:flutter_firebase_practice/widgets/round_btn.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgot screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  hintText: 'enter your email',
                  //helperText: 'enter email e.g abc@gmail.com',
                  prefixIcon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 20,
            ),
            RoundBtn(
                title: 'Forgot',
                ontap: () {
                  auth
                      .sendPasswordResetEmail(
                          email: emailcontroller.text.toString())
                      .then((value) {
                    Utilities()
                        .toastmessage('we have sent you an email. check link');
                  }).onError((error, stackTrace) {
                    Utilities().toastmessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
