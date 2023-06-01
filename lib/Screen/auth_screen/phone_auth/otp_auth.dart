import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../routes/route_paths.dart';
import '../getx_helper/auth_controller.dart';

class OTPScreen extends GetView<AuthController> {
  const OTPScreen({super.key});

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
                  onCompleted: (pin){
                    controller.otpController.value = pin;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.validateOtp();
                    Get.offAllNamed(RoutePaths.homeScreen);
                  },
                  child: const Text('Verify'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
