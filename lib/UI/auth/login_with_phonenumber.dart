import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/UI/auth/verify_code.dart';
import 'package:flutter_firebase_practice/utils/utilities.dart';
import 'package:flutter_firebase_practice/widgets/round_btn.dart';

class LoginWithPhonenumber extends StatefulWidget {
  const LoginWithPhonenumber({super.key});

  @override
  State<LoginWithPhonenumber> createState() => _LoginWithPhonenumberState();
}

class _LoginWithPhonenumberState extends State<LoginWithPhonenumber> {
  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('phone number screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phonecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: '+92 256 698',
                  icon: Icon(Icons.phone_android_outlined)),
            ),
            SizedBox(height: 30),
            RoundBtn(
                title: 'login',
                ontap: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.verifyPhoneNumber(
                      phoneNumber: phonecontroller.text.toString(),
                      verificationCompleted: (context) {},
                      verificationFailed: (e) {
                        Utilities().toastmessage(e.toString());
                      },
                      codeSent: (String verificationid, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCode(
                                      verificationid: verificationid,
                                    )));
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utilities().toastmessage(e.toString());
                      });
                })
          ],
        ),
      ),
    );
  }
}
