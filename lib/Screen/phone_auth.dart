// ignore_for_file: file_names, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hukibu/Screen/otp_auth.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final TextEditingController _countrycode = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          // height: 200,
                          width: 400,
                          child: Image.asset('assets/images/celebrating.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 9.5,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 223, 221, 221),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                controller: _phonecontroller,
                                // onSaved: (value) {
                                //   _phonecontroller.text;
                                // },
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your Phone Number',
                                    labelText: 'Phone Number'),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'email Required';
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
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Terms & Policy',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                loading = loading;
                                setState(() {
                                  loading = true;
                                });
                                _auth.verifyPhoneNumber(
                                    phoneNumber: _phonecontroller.text,
                                    verificationCompleted: (_) {
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                    verificationFailed: (e) {
                                      if (e.code == 'invalid-phone-number') {
                                        Fluttertoast.showToast(
                                            msg: 'Invalid Phone Number');
                                      } else if (e.code == 'to-many-request') {
                                        Fluttertoast.showToast(
                                            msg: 'To many request');
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                    codeSent:
                                        (String verificationId, int? token) {
                                      Fluttertoast.showToast(msg: "Code send");

                                      Navigator.pushAndRemoveUntil(
                                          (context),
                                          MaterialPageRoute(
                                              builder: (context) => OTPScreen(
                                                    verificationId:
                                                        verificationId,
                                                    // phone: _countrycode.text +
                                                    //     _phonecontroller.text,
                                                  )),
                                          (route) => false);
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                    codeAutoRetrievalTimeout: (e) {
                                      Fluttertoast.showToast(msg: e);
                                      setState(() {
                                        loading = false;
                                      });
                                    });
                              },
                              child: const Text('Send OTP'))),
                    ]),
              ),
            )));
  }
}
