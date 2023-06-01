import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../API/api_client.dart';
import '../../../routes/route_paths.dart';

class AuthController extends GetxController {
  Rx<int> seconds = 60.obs;
  Rx<bool> isLoading = false.obs;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<String> otpController = ''.obs;
  final TextEditingController countryCode = TextEditingController();
  String uid = '';
  Rx<bool> isValid = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signIn() async {
    Response res = await ApiClient.to.postData(
      'http://35.78.201.111:4000/user/login',
        {
          "username": emailController.text,
          "password": passwordController.text
        }
    );
    log('This is the email auth response: ${res.body}');
    if (res.body['status'] == true) {
      uid = res.body['uid'];
      Get.toNamed(RoutePaths.otpVerificationScreen);
    } else {
      Fluttertoast.showToast(
        msg: "Unknown error occurred",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey[300],
        textColor: Colors.black,
        fontSize: 16.0,
      );
    }
  }

  validateOtp() async {
    log('$otpController is the otp');
    if (otpController.value.length == 6) {
      isLoading.value = true;
      log('sending the otp');
      try {
        Response res = await ApiClient.to.postData(
          'http://35.78.201.111:4000/user/otp/verify',
            {
              "mobile": phoneNumber.text,
              "otp": otpController.value
            }
        );
        isLoading.value = false;
        log('This is the otp verification response: ${res.body}');
        if (res.body['status'] == true) {
          ApiClient.to.token = res.body['uid'].toString();
          return true;
        } else {
          return false;
        }
      } catch (error) {
        isLoading.value = false;
        Get.snackbar(
          "Auth Failed",
          'The input OTP is either invalid or expired',
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(
            Icons.person,
            color: Color(0xff28282B),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey[200],
          borderRadius: 10.r,
          margin: EdgeInsets.all(10.w),
          padding: EdgeInsets.all(15.w),
          colorText: const Color(0xff28282B),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } else {
      return false;
    }
  }

  validatePhoneNumber() {
    isValid.value = (int.tryParse(phoneNumber.text) != null) &&
        phoneNumber.text.length == 10;
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final User? user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      Get.offAllNamed(RoutePaths.homeScreen);
      if (kDebugMode) {
        print("Signed in as ${user?.displayName}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in with Google: $e");
      }
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      User? user = (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user;
      Get.offAllNamed(RoutePaths.homeScreen);
      if (kDebugMode) {
        print("Signed in as ${user?.displayName}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in with facebook: $e");
      }
    }
  }

  Future<void> signInWithTwitter() async {
    try {
      final twitterLogin = TwitterLogin(
        apiKey: '<your consumer key>',
        apiSecretKey: ' <your consumer secret>',
        redirectURI: '<your_scheme>://',
      );
      final authResult = await twitterLogin.login();

      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );
      User? user = (await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential)).user;
      Get.offAllNamed(RoutePaths.homeScreen);
      if (kDebugMode) {
        print("Signed in as ${user?.displayName}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in with facebook: $e");
      }
    }
  }

  Future<void> signUp() async {
      try {
        Response res = await ApiClient.to.postData(
            'http://35.78.201.111:4000/user/otp/send/$otpController',
            {}
        );
        isLoading.value = false;
        log('This is the mobile verify response: ${res.body}');
      } catch (error) {
        isLoading.value = false;
        Get.snackbar(
          "Auth Failed",
          'The input OTP is either invalid or expired',
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(
            Icons.person,
            color: Color(0xff28282B),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey[200],
          borderRadius: 10.r,
          margin: EdgeInsets.all(10.w),
          padding: EdgeInsets.all(15.w),
          colorText: const Color(0xff28282B),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    }
}
