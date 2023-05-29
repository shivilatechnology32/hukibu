import 'package:flutter/material.dart';
import 'package:hukibu/Screen/BottomSheet/cognitive_bottom.dart';
import 'package:hukibu/Screen/BottomSheet/language_bottom.dart';
import 'package:hukibu/Screen/BottomSheet/physical_bottom.dart';
import 'package:hukibu/Screen/BottomSheet/socail_bottom.dart';
import 'package:velocity_x/velocity_x.dart';

class ShowKidsWall extends StatefulWidget {
  const ShowKidsWall({super.key});

  @override
  State<ShowKidsWall> createState() => _ShowKidsWallState();
}

class _ShowKidsWallState extends State<ShowKidsWall> {
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
        padding: const EdgeInsets.only(top: 8.0, left: 8),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.05,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 219, 217, 215),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Alis's Evaluation Report",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 33, 61, 243)),
                    )
                  ],
                ),
              ),
              30.heightBox,
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => physicalBottom());
                    },
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 7,
                      // width: MediaQuery.of(context).size.width / 4.8,
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(Icons.person),
                          Text(
                            'Physical',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            endIndent: 20,
                            indent: 20,
                            thickness: 8,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  ),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) => SocialBottom());
                          },
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 7,
                            // width: MediaQuery.of(context).size.width / 4.8,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                shape: BoxShape.circle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.face_retouching_natural),
                                Text(
                                  'Social and\nEmotional',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  endIndent: 20,
                                  indent: 20,
                                  thickness: 8,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ),
                        5.widthBox,
                        const CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.amberAccent,
                        ),
                        5.widthBox,
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) => CognitiveBottom());
                          },
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 7,
                            // width: MediaQuery.of(context).size.width / 4.8,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                shape: BoxShape.circle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.heart_broken_outlined),
                                Text(
                                  'Cognitive',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  endIndent: 20,
                                  indent: 20,
                                  thickness: 8,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  5.heightBox,
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => LanguageBottom());
                    },
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 7,
                      // width: MediaQuery.of(context).size.width / 4.8,
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(Icons.message),
                          Text(
                            'Language',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            endIndent: 20,
                            indent: 20,
                            thickness: 8,
                            color: Colors.green,
                          )
                        ],
                      ),
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
}
