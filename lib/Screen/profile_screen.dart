// ignore_for_file: unused_field, non_constant_identifier_names, duplicate_ignore, unused_catch_clause

import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ignore: non_constant_identifier_names
  File? Pickedimage;

  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref('New Child');
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //
      Pickedimage = File(image.path);
      setState(() {});
    } on Exception catch (e) {
      return const Text('Uploding Faild');
    }
  }

  Widget BottomSheet() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              //Navigator.of(ctx).pop();
              pickImage(ImageSource.camera);
              Navigator.of(context).pop();
            },
            child: const ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text('Camera'),
            ),
          ),
          InkWell(
            onTap: () {
              pickImage(ImageSource.gallery);
              Navigator.of(context).pop();
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

  final namecontroller = TextEditingController();
  final dadcontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final areacontroller = TextEditingController();
  final educationcontroller = TextEditingController();
  final jobcontroller = TextEditingController();
  final vocationcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              'Profile',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => BottomSheet());
              },
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.amber,
              ),
            ),
            TextFormField(
              controller: namecontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Name/Surname',
                  labelText: 'Name/Surname'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: dadcontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your DAD/Mom name',
                  labelText: 'Dad/MOM name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Dad/Mom Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: agecontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Age', labelText: 'Age'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Age Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: gendercontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Gender', labelText: 'Gender'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Gender Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: phonecontroller,
              keyboardType: TextInputType.phone,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  labelText: 'Phone Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Phone Number Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: areacontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Area', labelText: 'Area'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Area Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: educationcontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Education', labelText: 'Education'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Education Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: jobcontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Job', labelText: 'Job'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Job Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: vocationcontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Vocation', labelText: 'Vocation'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Vocation Required';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: agecontroller,
              // onSaved: (value) {
              //   agecontroller.text;
              // },
              decoration: const InputDecoration(
                  hintText: 'Enter Your Age', labelText: 'Age'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Age Required';
                } else {
                  return null;
                }
              },
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height / 16,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 103, 43, 215),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
