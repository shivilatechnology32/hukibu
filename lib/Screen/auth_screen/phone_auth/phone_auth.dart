import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/route_paths.dart';
import '../getx_helper/auth_controller.dart';

class PhoneAuth extends GetView<AuthController> {
  const PhoneAuth({super.key});

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            color: Colors.blue,
            child: Image.asset(
              'assets/images/celebrating.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          const Text(
            'Sign In',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Enter Your Phone Number',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
            color: const Color.fromARGB(255, 232, 230, 230),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildCountryPickerDropdown(
                    hasSelectedItemBuilder: true, context: context),
              ],
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              backgroundColor: const Color.fromARGB(255, 103, 43, 215),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Get.toNamed(RoutePaths.otpVerificationScreen);
            },
            child: const Text(
              'Get One Time Password',
            ),
          )
        ],
      ),
    );
  }

  _buildCountryPickerDropdown(
      {bool sortedByIsoCode = false,
      bool hasSelectedItemBuilder = false,
      required BuildContext context}) {
    double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.5;
    return Row(
      children: <Widget>[
        SizedBox(
          width: dropdownButtonWidth,
          child: CountryPickerDropdown(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            itemHeight: null,
            isDense: false,
            sortComparator: sortedByIsoCode
                ? (Country a, Country b) => a.isoCode.compareTo(b.isoCode)
                : null,
            onValuePicked: (Country country) {},
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Phone",
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.number,
          ),
        )
      ],
    );
  }
}
