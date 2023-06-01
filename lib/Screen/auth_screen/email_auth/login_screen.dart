import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hukibu/routes/route_paths.dart';

import '../getx_helper/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                fontSize: 20,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Complete your profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
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
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email',
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Eamil Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Password',
                        labelText: 'Passowrd',
                      ),
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
                      controller.signInWithGoogle();
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
                      controller.signInWithFacebook();
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
                  InkWell(
                    onTap: () {
                      controller.signInWithTwitter();
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 237, 233, 233),
                      radius: 22,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset('assets/images/twitter.png'),
                      ),
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
                if (_formKey.currentState!.validate()) {
                  controller.signIn();
                  Get.offAllNamed(RoutePaths.homeScreen);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 103, 43, 215),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Don't have a account ",
                  children: [
                    TextSpan(
                      text: "Register?",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RoutePaths.createAccount);
                        },
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
