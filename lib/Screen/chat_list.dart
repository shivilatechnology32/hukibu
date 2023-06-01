import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hukibu/Screen/chatscreen.dart';
import 'package:hukibu/Screen/home_screen/getx_helper/home_controller.dart';
import 'package:hukibu/Screen/recommendation_screen.dart';
import 'package:hukibu/Screen/setting_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Cuddle_Screen/cuddle.dart';
import 'add_new_child.dart';
import 'kids_details.dart';

class ChatList extends GetView<HomeController> {
  const ChatList({super.key});

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
                        builder: (builder) => controller.bottomSheet(),
                      );
                    },
                    child: Obx(
                      () => CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            const Color.fromARGB(255, 239, 238, 235),
                        child: controller.imageURL.value != ''
                            ? ClipOval(
                                child: Image.network(
                                  controller.imageURL.value,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : controller.image.value != ''
                                ? ClipOval(
                                    child: Image.file(
                                      File(controller.image.value),
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipOval(
                                    child: Image.asset(
                                      'assets/images/empty.webp',
                                    ),
                                  ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const AddNewChild(),
                        ),
                      );
                    },
                    child: const Text(
                      "add another child",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ).tr(),
                  ),
                ],
              ),
            ),
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
            'Hukibu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 5),
            child: Icon(
              Icons.emoji_emotions,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // StreamBuilder<QuerySnapshot>(
            //   stream: firestore,
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasData) {
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: snapshot.data!.docs.length,
            //           itemBuilder: (context, index) {
            //             return InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (ctx) => ChatSreen(
            //                       frienduid: snapshot.data!.docs[index]['uid'],
            //                       username: snapshot.data!.docs[index]['username'].toString(),
            //                       phonenumber: snapshot.data!.docs[index]['phoneNumber'].toString(),
            //                     ),
            //                   ),
            //                 );
            //               },
            //               child: Card(
            //                 child: ListTile(
            //                   leading: const Icon(
            //                     Icons.person_outline_outlined,
            //                     color: Colors.black,
            //                     size: 30,
            //                   ),
            //                   title: Text(
            //                     snapshot.data!.docs[index]['username'].toString(),
            //                   ),
            //                   subtitle: Text(
            //                     snapshot.data!.docs[index]['phoneNumber'].toString(),
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     }
            //     return const Text('');
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
