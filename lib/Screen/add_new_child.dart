// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable, duplicate_ignore, unnecessary_null_comparison

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hukibu/components/survey_question.dart';
import 'package:image_picker/image_picker.dart';

class AddNewChild extends StatefulWidget {
  const AddNewChild({super.key});

  @override
  State<AddNewChild> createState() => _AddNewChildState();
}

class _AddNewChildState extends State<AddNewChild> {
  String? imageURL;
  File? _image;
  final picker = ImagePicker();
  String? name;
  String? pdf;

  // final firebase_storage.FirebaseStorage _storage =
  //     firebase_storage.FirebaseStorage.instance;

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

  final namecontroller = TextEditingController();
  final areacontroller = TextEditingController();
  final surnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('New Child');
  final ref = FirebaseFirestore.instance.collection('New Child');

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
              'Add New Child',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                        context: context, builder: (builder) => BottomSheet());
                    // Navigator.pop(context);
                    firebase_storage.Reference ref = firebase_storage
                        .FirebaseStorage.instance
                        .ref('/Folder');
                    firebase_storage.UploadTask uploadTask =
                        ref.putFile(_image!.absolute);

                    Future.value(uploadTask).then((value) {
                      // ignore: unused_local_variable
                      var newUrl = ref.getDownloadURL();

                      // databaseRef
                      //     .child('1')
                      //     .set({'id': '1212', 'title': newUrl.toString()});

                      Fluttertoast.showToast(msg: 'Uploaded');
                    }).onError((error, stackTrace) {
                      Fluttertoast.showToast(msg: 'Image Was Not Uploaded');
                    });
                  },
                  child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: _image != null
                          ? ClipOval(
                              child: Image.file(
                                _image!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipOval(
                              child: Image.asset('assets/images/empty.webp'),
                            ))),

              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    hintText: 'Enter Your name', labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: surnamecontroller,
                // onSaved: (value) {
                //   surnamecontroller.text;
                // },
                decoration: const InputDecoration(
                    hintText: 'Enter Your Surname', labelText: 'SurName'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'SurName Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
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
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: gendercontroller,
                // onSaved: (value) {
                //   gendercontroller.text;
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
              const SizedBox(
                height: 30,
              ),
              ListTile(
                title: TextFormField(
                  controller: areacontroller,
                  // onSaved: (value) {
                  //   surnamecontroller.text;
                  // },
                  decoration: const InputDecoration(
                      hintText: 'Interested Area',
                      labelText: 'Interested Area'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Area Required';
                    } else {
                      return null;
                    }
                  },
                ),
                trailing: InkWell(
                    onTap: () async {
                      final path = await FlutterDocumentPicker.openDocument();
                      print(path);
                      File file = File(path!);
                      String downloadUrl = await uploadPDFToFirebaseStorage(
                          'filename.pdf', file);
                      setState(() {
                        pdf = downloadUrl;
                      });
                      print('Download URL: $downloadUrl');

                      // Navigator.pop(context);
                    },
                    child: const Icon(Icons.attach_file_rounded)),
              ),
              const SizedBox(
                height: 50,
              ),
              //const SurveyQuestion(title: 'title'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        loading = loading;
                      });
                      final uid =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      setState(() {
                        loading = true;
                      });
                      fireStore.doc(uid).set({
                        'uid': uid,
                        'name': namecontroller.text.toString(),
                        'surname': surnamecontroller.text.toString(),
                        'age': agecontroller.text.toString(),
                        'gender': gendercontroller.text.toString(),
                        'area': areacontroller.text.toString(),
                        'image': imageURL.toString(),
                        'pdf': pdf,
                      }).then((value) {
                        setState(() {
                          loading = false;
                        });
                        Fluttertoast.showToast(msg: 'New Child Added');
                      }).onError((error, stackTrace) {
                        setState(() {
                          loading = false;
                        });
                        Fluttertoast.showToast(
                          msg: 'Something Want Wrong',
                        );
                        setState(() {
                          loading = false;
                        });
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 16,
                      width: MediaQuery.of(context).size.width / 3,
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  const SurveyQuestion(title: '')));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 16,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 103, 43, 215),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                        'Quiz',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> uploadPDFToFirebaseStorage(String fileName, File file) async {
    try {
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('pdfs/$fileName');
      TaskSnapshot taskSnapshot = await storageReference.putFile(file);
      String downloadUrl = await storageReference.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e.toString());
      return 'null';
    }
  }
}
