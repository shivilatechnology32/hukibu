// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class ChatSreen extends StatefulWidget {
  const ChatSreen({
    Key? key,
    required this.username,
    required this.phonenumber,
    required this.frienduid,
  }) : super(key: key);
  final username;
  final phonenumber;
  final frienduid;
  @override
  State<ChatSreen> createState() => _ChatSreenState();
}

class _ChatSreenState extends State<ChatSreen> {
  final db = FirebaseFirestore.instance.collection("userMessages");
  final user = FirebaseFirestore.instance.collection("User");
  final admin = FirebaseFirestore.instance.collection("admin");
  final ScrollController _controller = ScrollController();
  final auth = FirebaseAuth.instance;
  String name = "";
  TextEditingController msgController = TextEditingController();
  String adminUid = "";
  bool isShowSticker = true;
  // FocusNode message = '';
  Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> getUid() async {
    var data = await FirebaseFirestore.instance.collection("admin").get();
    final username = await user.doc(auth.currentUser!.uid).get();

    setState(() {
      name = username['username'];
      adminUid = data.docs[0].data()['uid'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUid();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) => _scrollDown());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 213, 209, 214),
        title: Text(
          widget.username.toString(),
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: onBackPress,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.grey.shade200,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("messages")
                      .where('chatuid', whereIn: [
                        auth.currentUser!.uid + widget.frienduid,
                        widget.frienduid + auth.currentUser!.uid
                      ])
                      .orderBy('time', descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      QuerySnapshot? data = snapshot.data;
                      List<QueryDocumentSnapshot> documents = data!.docs;
                      return ListView.builder(
                          itemCount: documents.length,
                          controller: _controller,
                          itemBuilder: (context, int index) {
                            final us = documents[index]['chatuid'] ==
                                auth.currentUser!.uid + widget.frienduid;

                            return Align(
                              alignment: us
                                  ? Alignment.bottomRight
                                  : Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.height * 0.01,
                                    vertical: size.height * 0.01),
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.height * 0.01,
                                        vertical: size.height * 0.01),
                                    decoration: BoxDecoration(
                                      color: us
                                          ? const Color.fromARGB(
                                              255, 199, 222, 173)
                                          : const Color.fromARGB(
                                              255, 223, 218, 223),
                                      borderRadius: BorderRadius.circular(10.0),
                                      //  border: Border.all(color: Colors.black),
                                    ),
                                    child: Text(
                                      documents[index]['message'],
                                      style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          color: Colors.black),
                                    )),
                              ),
                            );
                          });
                    } else if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Center(
                        child: Text("No Chat"),
                      );
                    }

                    //return Container();
                  },
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (val) {
                            if (msgController.text.isEmpty) {
                              return "* required";
                            }
                            return null;
                          },
                          controller: msgController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    if (msgController.text.isEmpty) {
                                    } else {
                                      // uid + friend uid
                                      DateTime time = DateTime.now();
                                      DateTime date =
                                          DateTime.parse(time.toString());

                                      String da = DateFormat('dd/MM/yyyy')
                                          .format(date)
                                          .toString();

                                      user.doc(auth.currentUser!.uid).update({
                                        'lastMessage': msgController.text,
                                        'time': da,
                                      });

                                      FirebaseFirestore.instance
                                          .collection("messages")
                                          .doc()
                                          .set({
                                        'chatuid': auth.currentUser!.uid +
                                            widget.frienduid,
                                        'username': name,
                                        'sender': auth.currentUser!.uid,
                                        'receiver': adminUid,
                                        'message': msgController.text,
                                        'time': da,
                                      });

                                      _scrollDown();
                                      msgController.clear();
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: Colors.blue,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: "Enter Message..."),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
