// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_practice/UI/auth/login_screen.dart';
// import 'package:flutter_firebase_practice/UI/posts/post_screen.dart';

// class SplashServices {
//   void islogin(BuildContext context) {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final user = auth.currentUser;
//     if (user != null) {
//       Timer(
//           Duration(seconds: 3),
//           () => Navigator.push(
//               context, MaterialPageRoute(builder: (context) => PostScreen())));
//     } else {
//       Timer(
//           Duration(seconds: 3),
//           () => Navigator.push(
//               context, MaterialPageRoute(builder: (context) => LoginScreen())));
//     }
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/UI/auth/login_screen.dart';
import 'package:flutter_firebase_practice/UI/posts/post_screen.dart';

class SplashServices {
  void islogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Delay to simulate the splash screen duration
    Future.delayed(const Duration(seconds: 3), () async {
      final user = auth.currentUser;

      // Check if the user is still valid
      if (user != null) {
        try {
          // Attempt to refresh the user's ID token
          await user.getIdToken(true);
          // If successful, navigate to the PostScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PostScreen()),
          );
        } catch (e) {
          // If there's an error (e.g., user doesn't exist anymore), navigate to LoginScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      } else {
        // If no user is signed in, navigate to LoginScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }
}
