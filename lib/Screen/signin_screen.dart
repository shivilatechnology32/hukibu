// // ignore_for_file: unused_element, unused_local_variable

// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
// import 'package:flutter/material.dart';
// import 'package:hukibu/Screen/otp_screen.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.black,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Center(
//           child: Padding(
//             padding: EdgeInsets.only(right: 28.0),
//             child: Text(
//               'Hukibu',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 20),
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height / 4,
//             width: double.infinity,
//             color: Colors.blue,
//             child: Image.asset(
//               'assets/images/celebrating.png',
//               fit: BoxFit.fill,
//             ),
//           ),
//           const SizedBox(
//             height: 120,
//           ),
//           const Text(
//             'Sign In',
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text(
//             'Enter Your Phone Number',
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           Card(
//             color: const Color.fromARGB(255, 232, 230, 230),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 _buildCountryPickerDropdown(hasSelectedItemBuilder: true),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 120,
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(15),
//                   backgroundColor: const Color.fromARGB(255, 103, 43, 215),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30))),
//               onPressed: () {
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (ctx) => const OtpScreen()),
//                     (route) => false);
//               },
//               child: const Text('Get One Time Password'))
//         ],
//       ),
//     );
//   }

//   _buildCountryPickerDropdown(
//       {bool filtered = false,
//       bool sortedByIsoCode = false,
//       bool hasPriorityList = false,
//       bool hasSelectedItemBuilder = false}) {
//     double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.5;
//     //respect dropdown button icon size
//     double dropdownItemWidth = dropdownButtonWidth - 30;
//     double dropdownSelectedItemWidth = dropdownButtonWidth - 50;
//     return Row(
//       children: <Widget>[
//         SizedBox(
//           width: dropdownButtonWidth,
//           child: CountryPickerDropdown(
//             //show'em (the text fields) you're in charge now
//             onTap: () => FocusScope.of(context).requestFocus(FocusNode()),

//             itemHeight: null,

//             isDense: false,

//             sortComparator: sortedByIsoCode
//                 ? (Country a, Country b) => a.isoCode.compareTo(b.isoCode)
//                 : null,
//             onValuePicked: (Country country) {},
//           ),
//         ),
//         const SizedBox(
//           width: 8.0,
//         ),
//         const Expanded(
//           child: TextField(
//             decoration: InputDecoration(
//               labelText: "Phone",
//               isDense: true,
//               contentPadding: EdgeInsets.zero,
//             ),
//             keyboardType: TextInputType.number,
//           ),
//         )
//       ],
//     );
//   }
// }
