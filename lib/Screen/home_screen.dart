import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hukibu/Screen/Overcome_Screen/overcome_screen.dart';
import 'package:hukibu/Screen/Writing_Screen/writing_screen.dart';
import 'package:hukibu/Screen/add_new_child.dart';
import 'package:hukibu/Screen/Cuddle_Screen/cuddle.dart';
import 'package:hukibu/Screen/Tanturam_Screen/tanturam_timer.dart';
import 'package:hukibu/Screen/kids_details.dart';
import 'package:hukibu/Screen/recommendation_screen.dart';
import 'package:hukibu/Screen/setting_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;
  final searchController = TextEditingController();
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        context.setLocale(const Locale('en', 'US'));
      });
    } else {
      setState(() {
        isSwitched = false;
        context.setLocale(const Locale('tr', 'TR'));
      });
    }
  }

  final fireStore =
      FirebaseFirestore.instance.collection('New Child').snapshots();
  // final ref = FirebaseFirestore.instance.collection('New Child');
  File? _image;
  String? imageURL;
  final picker = ImagePicker();
  String? name;
  Future getImageFromGallery() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        name = (_image!.path);
      }
    });
    Reference ref = FirebaseStorage.instance.ref().child(name.toString());

    await ref.putFile(File(_image!.path));
    ref.getDownloadURL().then((value) async {
      setState(() {
        imageURL = value;
      });
    });
  }

  // ignore: non_constant_identifier_names
  Widget BottomSheet() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 13,
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              getImageFromGallery();
            },
            child: const ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 20, top: 80),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) => BottomSheet());
                          //  print('upload pic');
                          // Navigator.pop(context);
                          firebase_storage.Reference ref = firebase_storage
                              .FirebaseStorage.instance
                              .ref('/profile');

                          //print('uplaod profile');
                          firebase_storage.UploadTask uploadTask =
                              ref.putFile(_image!.absolute);
                          Navigator.pop(context);
                          Future.value(uploadTask).then((value) {
                            // ignore: unused_local_variable
                            var newUrl = ref.getDownloadURL();

                            // databaseRef
                            //     .child('1')
                            //     .set({'id': '1212', 'title': newUrl.toString()});

                            Fluttertoast.showToast(msg: 'Uploaded');
                          }).onError((error, stackTrace) {
                            Fluttertoast.showToast(
                                msg: 'Image Was Not Uploaded');
                          });
                        },
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                const Color.fromARGB(255, 239, 238, 235),
                            child: _image != null
                                ? ClipOval(
                                    child: Image.file(
                                      _image!,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipOval(
                                    child:
                                        Image.asset('assets/images/empty.webp'),
                                  ))),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const AddNewChild()));
                      },
                      child: const Text(
                        "add another child",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ).tr(),
                    ),
                  ],
                )),
            50.heightBox,
            ListTile(
              title: const Text("refer to a friend").tr(),
              leading: const Icon(
                Icons.send_sharp,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            20.heightBox,
            ListTile(
              title: const Text("settings").tr(),
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SettingScreen()));
              },
            ),
            20.heightBox,
            ListTile(
              title: const Text("Parents Space").tr(),
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const CuddleScreen()));
              },
            ),
            20.heightBox,
            ListTile(
              title: const Text("Add Content").tr(),
              leading: const Icon(
                Icons.note,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const RecommendationScreen()));
              },
            ),
            20.heightBox,
            ListTile(
              title: const Text("Kid Details").tr(),
              leading: const Icon(
                Icons.details_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const KidsDetails()));
              },
            ),
            //
            //rest of your items
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Text(
            "Hukibu",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          const Center(child: Text('English')),
          Switch(
            onChanged: toggleSwitch,
            value: context.locale.toString() == 'en_US' ? false : true,
            activeColor: Colors.purpleAccent,
            activeTrackColor: Colors.purple,
            inactiveThumbColor: Colors.deepPurple,
            inactiveTrackColor: Colors.deepPurpleAccent,
          ),
          const Center(child: Text('Turkish')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            10.heightBox,
            TextFormField(
              onChanged: (String _) {
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Vx.gray50)),
                hintText: "Search for a topic",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                fillColor: Vx.gray200,
                filled: true,
              ),
            ),
            searchController.text.isEmpty
                ? Expanded(
                    child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "suggestion for you",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ).tr(),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const CuddleScreen()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3.8,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(249, 192, 88, 210),
                                    Color.fromARGB(233, 47, 128, 194),
                                  ],
                                  begin: FractionalOffset(0.5, 0.0),
                                  end: FractionalOffset(0.99, 0.0),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset('assets/images/img1.png'),
                                  Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text: "cuddle".tr(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const TextSpan(
                                        text: "postnatal",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const OverComeScreen()));
                            },
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.8,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(118, 125, 191, 245),
                                      Color.fromARGB(121, 125, 89, 131),
                                    ],
                                    begin: FractionalOffset(0.0, 0.0),
                                    end: FractionalOffset(0.99, 0.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/teacher.jpeg',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        color:
                                            const Color.fromARGB(71, 0, 0, 0),
                                        colorBlendMode: BlendMode.darken,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 28.0, right: 200),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                text: "cuddle".tr(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const TextSpan(
                                                text: "postnatal",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const TantrumTamerSceen()));
                            },
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.8,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.purple,
                                      Colors.blue,
                                    ],
                                    begin: FractionalOffset(0.3, 0.0),
                                    end: FractionalOffset(0.99, 0.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/teacher2.jpg',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        color:
                                            const Color.fromARGB(71, 0, 0, 0),
                                        colorBlendMode: BlendMode.darken,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 28.0, right: 50),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                text: "cuddle".tr(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const TextSpan(
                                                text: "postnatal",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          10.heightBox,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const WriterScreen()));
                            },
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.8,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.purple,
                                      Colors.blue,
                                    ],
                                    begin: FractionalOffset(0.3, 0.0),
                                    end: FractionalOffset(0.99, 0.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/math-teacher.jpg',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        color:
                                            const Color.fromARGB(71, 0, 0, 0),
                                        colorBlendMode: BlendMode.darken,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 170.0, right: 150),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                text: "cuddle".tr(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const TextSpan(
                                                text: "postnatal",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                  )
                : Expanded(
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('UserData')
                            .where('username',
                                isGreaterThanOrEqualTo: searchController.text)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator().centered();
                          } else if (snapshot.data!.docs.isEmpty) {
                            return "No user found"
                                .text
                                .bold
                                .size(22)
                                .makeCentered();
                          } else {
                            var snap = snapshot.data!.docs;
                            return ListView(
                                children: List.generate(
                              snap.length,
                              (index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    10.heightBox,
                                    "${snap[index]['username']}"
                                        .text
                                        .size(18)
                                        .medium
                                        .make()
                                        .p12()
                                  ],
                                );
                              },
                            ));
                          }
                        }),
                  )
          ],
        ),
      ),
      //
    );
  }
}
