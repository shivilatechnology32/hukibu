// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hukibu/components/bottomnavigate.dart';

// final GoogleSignIn _googleSignIn = GoogleSignIn();

// nextPage() {
//   // Navigator.of(context)
//   //     .push(MaterialPageRoute(builder: (context) => const DetailsScreen()));
//   Navigator.pushAndRemoveUntil(context,
//       MaterialPageRoute(builder: (ctx) =>const BottomNavigator()), (route) => false);
// }

// Future<void> _signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     final User? user =
//         (await FirebaseAuth.instance.signInWithCredential(credential)).user;

//     // setState(() {
//     //   name = user!.displayName.toString();
//     //   email = user.email.toString();
//     //   image = user.photoURL.toString();
//     // });
//     nextPage();
//     if (kDebugMode) {
//       print("Signed in as ${user?.displayName}");
//     }
//   } catch (e) {
//     if (kDebugMode) {
//       print("Error signing in with Google: $e");
//     }
//   }
// }
