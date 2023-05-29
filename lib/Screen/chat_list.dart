import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hukibu/Screen/chatscreen.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final firestore = FirebaseFirestore.instance
      .collection('UserData')
      .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Text(
            'Hukibu',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: firestore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => ChatSreen(
                                            // pass uid of another user
                                            frienduid: snapshot
                                                .data!.docs[index]['uid'],
                                            username: snapshot
                                                .data!.docs[index]['username']
                                                .toString(),
                                            phonenumber: snapshot.data!
                                                .docs[index]['phonenumber']
                                                .toString())));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  title: Text(snapshot
                                      .data!.docs[index]['username']
                                      .toString()),
                                  subtitle: Text(snapshot
                                      .data!.docs[index]['phonenumber']
                                      .toString()),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return const Text('');
                })
          ],
        ),
      ),
    );
  }
}
