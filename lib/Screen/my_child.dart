import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hukibu/Screen/child_screen/forzeen_baloon.dart';
import 'package:hukibu/Screen/child_screen/give_me_time.dart';
import 'package:hukibu/Screen/child_screen/jelly_dig.dart';
import 'package:hukibu/Screen/child_screen/make_music.dart';
import 'package:hukibu/Screen/child_screen/mash_wash.dart';
import 'package:hukibu/Screen/child_screen/mirror_time.dart';
import 'package:hukibu/Screen/child_screen/sensorry_bottle.dart';
import 'package:hukibu/Screen/child_screen/squchy.dart';
import 'package:hukibu/Screen/child_screen/water_paint.dart';
import 'package:hukibu/Screen/child_screen/widow_arts.dart';
import 'package:hukibu/Screen/recommendation_screen.dart';
import 'package:hukibu/Screen/setting_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Cuddle_Screen/cuddle.dart';
import 'add_new_child.dart';
import 'home_screen/getx_helper/home_controller.dart';
import 'kids_details.dart';

class MyChild extends GetView<HomeController> {
  const MyChild({super.key});

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
                                    child:
                                        Image.asset('assets/images/empty.webp'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const SettingScreen(),
                  ),
                );
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.05,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(209, 227, 27, 5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.error_sharp,
                      color: Colors.white,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Important! Evaluation Pending!\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: 'Answer the question about Alis',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              15.heightBox,
              Container(
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width / 1.05,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 217, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Alis's Evaluation Report",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'Help',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color.fromARGB(255, 33, 61, 243),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.amber,
                        backgroundImage: AssetImage('assets/images/empty.webp'),
                      ),
                    )
                  ],
                ),
              ),
              25.heightBox,
              const Text(
                'Suggestion Activities',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const SensorryBottle(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/3.webp',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '20 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Sensory Bottles',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const MakeSomeMusic()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/4.webp',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '25 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Make Some Music',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const WaterPainting()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/7.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '20 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Water Painting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const FrozenBalloons()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/8.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '30 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Frozen Balloons',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const JellyDig()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/6.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '30 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Jelly Dig',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const WindoeArts()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/9.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '20 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Window Arts',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const MirrorTime()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/10.jpg',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '20 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Mirror Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const MashWash()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/5.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '20 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Mash Wash',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const GiveMeTime()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/2.2.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '20 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Give me some Bubbles',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const Squchy()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/1.1.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Container(
                            height: MediaQuery.of(context).size.height / 25,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                'Handpicked for hqider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                10.widthBox,
                                const Text(
                                  '20 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Squchy Squchy',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
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
