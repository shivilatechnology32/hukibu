// ignore_for_file: body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hukibu/Screen/login_screen.dart';
import 'package:hukibu/model/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? errorMessage;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final usernameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phoncontroller = TextEditingController();
  final GlobalKey<FormState> emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordkey = GlobalKey<FormState>();
  final GlobalKey<FormState> usernamekey = GlobalKey<FormState>();
  final GlobalKey<FormState> phonekey = GlobalKey<FormState>();
  bool loading = false;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Complete your profile Sign up',
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
                height: 60,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.3,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 221),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Form(
                        key: usernamekey,
                        child: TextFormField(
                          controller: usernameController,
                          onSaved: (value) {
                            usernameController.text;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Username',
                              labelText: 'Username'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username Required';
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
                        key: emailkey,
                        child: TextFormField(
                          onSaved: (value) {
                            emailcontroller.text;
                          },
                          // obscureText: true,
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Email', labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email Required';
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
                        key: phonekey,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phoncontroller,
                          onSaved: (value) {
                            phoncontroller.text;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Phone', labelText: 'Phone'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone Required';
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
                          obscureText: true,
                          controller: passwordcontroller,
                          onSaved: (value) {
                            passwordcontroller.text;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Password',
                              labelText: 'Password'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Passowrd Required';
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
                height: 60,
              ),
              InkWell(
                onTap: () {
                  if (emailkey.currentState!.validate()) {
                  } else if (passwordkey.currentState!.validate()) {
                  } else if (phonekey.currentState!.validate()) {
                  } else if (usernamekey.currentState!.validate()) {}
                  setState(() {
                    loading = true;
                  });
                  signUp(emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
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
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text.rich(
                    TextSpan(text: "Don't have a account ", children: [
                  TextSpan(
                      text: "Login?",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const Login_Screen(
                                        restorationId: 'main',
                                      )),
                              (route) => false);
                        },
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple))
                ])),
              )
            ],
          ),
        ));
  }

  void signUp(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
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

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameController.text;
    userModel.phonenumber = phoncontroller.text;

    await firebaseFirestore
        .collection("UserData")
        .doc(user.uid)
        .set(userModel.toMap());
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => const Login_Screen(restorationId: 'main')),
        (route) => false);
    setState(() {});
  }
}
