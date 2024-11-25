import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/UI/posts/post_screen.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';
import 'package:flutter_firebase_practice/widgets/round_btn.dart';

class VerifyCode extends StatefulWidget {
  final verificationid;

  VerifyCode({super.key, required this.verificationid});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: otpcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'enter 6 digits',
                  icon: Icon(Icons.phone_android_outlined)),
            ),
            SizedBox(height: 30),
            RoundBtn(
                title: 'verify',
                ontap: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: otpcontroller.text.toString());
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostScreen()));
                  } catch (e) {
                    Utilities().toastmessage(e.toString());
                    print(e.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
