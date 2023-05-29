import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hukibu/Screen/pdf_viewer_screen.dart';
import 'package:hukibu/Screen/show_kids_wall.dart';
import 'package:hukibu/Screen/steppers.dart';
import 'package:velocity_x/velocity_x.dart';

class KidsDetails extends StatefulWidget {
  const KidsDetails({super.key});

  @override
  State<KidsDetails> createState() => _KidsDetailsState();
}

class _KidsDetailsState extends State<KidsDetails> {
  final fireStore =
      FirebaseFirestore.instance.collection('New Child').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
            child: Text(
          "Kids Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          10.heightBox,
          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context,
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
                          return Card(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            const StepperScreen()));
                              },
                              child: SizedBox(
                                height: 80,
                                child: ListTile(
                                  title: Text(
                                    snapshot.data!.docs[index]['name']
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]['area'],
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      InkWell(
                                          onTap: () {
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
                                          child: const Text(
                                            'PDF',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent),
                                          )),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]['surname']
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        image: NetworkImage(snapshot
                                            .data!.docs[index]['image']
                                            .toString()),
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const Center(
                                              child: CircularProgressIndicator(
                                            color: Colors.black,
                                          ));
                                        },
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
    );
  }
}
