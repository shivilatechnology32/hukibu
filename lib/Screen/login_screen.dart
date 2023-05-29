// ignore_for_file: camel_case_types, unused_element, non_constant_identifier_names, unused_local_variable, unused_field, prefer_final_fields, use_build_context_synchronously, unnecessary_null_comparison, avoid_returning_null_for_void
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hukibu/Screen/sign_up.dart';
import 'package:hukibu/components/bottomnavigate.dart';
import 'package:hukibu/model/user_model.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({
    super.key,
    required this.restorationId,
  });

  final String? restorationId;

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name = '';
  String email = '';
  String image = '';

  User get user => _auth.currentUser!;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  nextPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BottomNavigator()));
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final User? user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;

      setState(() {
        name = user!.displayName.toString();
        email = user.email.toString();
        image = user.photoURL.toString();
      });
      nextPage();
      if (kDebugMode) {
        print("Signed in as ${user?.displayName}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in with Google: $e");
      }
    }
  }

  bool validation = false;
  String? errorMessage;
  bool loading = false;
  Map _userObj = {};
  final GlobalKey<FormState> emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading:const Icon(Icons.arrow_back),
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 28.0),
            child: Text(
              'Hukibu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Complete your profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Enter the following details',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: double.infinity,
            color: const Color.fromARGB(255, 223, 221, 221),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Form(
                    key: emailkey,
                    child: TextFormField(
                      controller: emailcontroller,
                      onSaved: (value) {
                        emailcontroller.text;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Email', labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Eamil Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Form(
                    key: passwordkey,
                    child: TextFormField(
                      onSaved: (value) {
                        passwordcontroller.text;
                      },
                      obscureText: true,
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Password',
                          labelText: 'Passowrd'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    _signInWithGoogle();
                  },
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 237, 233, 233),
                    radius: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        'assets/images/gmail.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    // signInWithGoogle();
                  },
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 237, 233, 233),
                    radius: 22,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/images/facebook.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 237, 233, 233),
                  radius: 22,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/images/twitter.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              if (emailkey.currentState!.validate()) {
              } else if (passwordkey.currentState!.validate()) {}
              setState(() {
                loading = true;
              });
              signIn(emailcontroller.text.toString(),
                  passwordcontroller.text.toString());
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (ctx) => const BottomNavigator()),
              //     (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 16,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 103, 43, 215),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text.rich(TextSpan(text: "Don't have a account ", children: [
              TextSpan(
                  text: "Register?",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const SignUpScreen()),
                          (route) => false);
                    },
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.purple))
            ])),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void signIn(String email, String password) async {
    if (emailkey.currentState!.validate()) {
      setState(() {
        validation = true;
      });
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigator()),
                      (route) => false),
                });
      } on FirebaseAuthException catch (error) {
        setState(() {
          validation = false;
        });
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameController.text;

    await firebaseFirestore
        .collection("UserData")
        .doc(user.uid)
        .set(userModel.toMap());
    Nao(route) => false;
    setState(() {});
  }
}
