import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hukibu/Screen/add_new_child.dart';
import 'package:hukibu/Screen/login_screen.dart';
import 'package:hukibu/Screen/pdf_viewer_screen.dart';
import 'package:hukibu/Screen/profile_screen.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? username;
  String? phonenumber;
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;
  File? _image;
  String? imageURL;
  final picker = ImagePicker();
  String? name;
  final fireStore =
      FirebaseFirestore.instance.collection('New Child').snapshots();

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

  _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get(const GetOptions(source: Source.cache))
        .then((snapshot) async {
      if (snapshot.exists &&
          snapshot.get('username') != null &&
          snapshot.get('phonenumber') != null) {
        setState(() {
          username = snapshot.data()!['username'];
          phonenumber = snapshot.data()!['phonenumber'];
        });
      } else {
        setState(() {
          username = snapshot.data()!['username'];
          phonenumber = snapshot.data()!['phonenumber'];
        });
      }
    });
  }

  @override
  void initState() {
    _getDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Center(
          child: const Text(
            "settings",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ).tr(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.white),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const Login_Screen(
                                  restorationId: 'main',
                                )),
                        (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "logout",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ).tr(),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.logout,
                        size: 18,
                        color: Colors.blue,
                      )
                    ],
                  ))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(children: [
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) => BottomSheet());
                        //print('upload pic');
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
                          Fluttertoast.showToast(msg: 'Image Was Not Uploaded');
                        });
                      },
                      child: CircleAvatar(
                          radius: 50,
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
                                ))
                                ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        phonenumber.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ])
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const ProfileScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 108.0),
                child: Row(
                  children: [
                    const Text(
                      "edit profile",
                      style: TextStyle(
                        color: Color.fromARGB(255, 90, 32, 100),
                      ),
                    ).tr(),
                    const SizedBox(
                      width: 6,
                    ),
                    const Icon(
                      Icons.edit,
                      size: 18,
                      color: Color.fromARGB(255, 90, 32, 100),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "my children",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const AddNewChild()));
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Text(
                          "add new",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 90, 32, 100),
                          ),
                        ).tr(),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.person_add,
                          size: 17,
                          color: Color.fromARGB(255, 90, 32, 100),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: fireStore,
                builder: (BuildContext contex,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text('Some Error');
                  }
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Card(
                                child: Container(
                                  //height: 50,
                                  width: 100,
                                  color:
                                      const Color.fromARGB(255, 205, 211, 214),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data!.docs[index]['surname']
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]['area']
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PdfViewerScreen(
                                                              url: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                      ['pdf']
                                                                  .toString(),
                                                            )));
                                              },
                                              child: const Text('PDF'))
                                        ],
                                      ),
                                      leading: Text(snapshot
                                          .data!.docs[index]['name']
                                          .toString()),
                                      trailing: CircleAvatar(
                                        radius: 30,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            width: 80,
                                            image: NetworkImage(snapshot
                                                .data!.docs[index]['image']
                                                .toString()),
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: Colors.black,
                                              ));
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }));
                }),
          ],
        ),
      ),
    );
  }
}
