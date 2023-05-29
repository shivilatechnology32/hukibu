// ignore_for_file: file_names, body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hukibu/Screen/login_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../model/user_model.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  // final String phone;
  const OTPScreen({
    super.key,
    required this.verificationId,
    // required this.phone,
  });

  @override
  // ignore: no_logic_in_create_state
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _otpcontroller = OtpFieldController();
  // final String phone;
  final _auth = FirebaseAuth.instance;
  // _OTPScreenState(this.phone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80.0, right: 80),
                  child: Image.asset('assets/images/celebrating.png'),
                ),
                const SizedBox(
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150.0),
                  child: Text(
                    'Enter Code',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OTPTextField(
                  controller: _otpcontroller,
                  width: 250,
                  length: 6,
                  fieldWidth: 40,
                  fieldStyle: FieldStyle.box,
                  keyboardType: TextInputType.number,
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                    enabledBorderColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final crendital = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: _otpcontroller.toString());
                      postDetailsToFirestore();
                      try {
                        await _auth
                            .signInWithCredential(crendital)
                            .then((value) => {postDetailsToFirestore()})
                            .catchError((e) {
                          Fluttertoast.showToast(msg: e!.message);
                        });

                        Fluttertoast.showToast(msg: 'Login successfully');
                      } catch (e) {
                        if (e == 'invalid-otp') {
                          Fluttertoast.showToast(msg: 'Invalid OTP');
                        }
                        //Fluttertoast.showToast(msg: '$e');
                      }
                      Navigator.pushAndRemoveUntil(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => const Login_Screen(
                                    restorationId: 'main',
                                  )),
                          (route) => false);
                    },
                    child: const Text('Verify'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // userModel.phonenumber = phone;

    await firebaseFirestore
        .collection("UserData")
        .doc(user?.uid)
        .set(userModel.toMap());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => const Login_Screen(
                  restorationId: 'main',
                )),
        (route) => false);

    Fluttertoast.showToast(msg: 'Login successfully');
  }
}
