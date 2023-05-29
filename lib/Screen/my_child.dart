import 'package:flutter/material.dart';
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
import 'package:velocity_x/velocity_x.dart';

class MyChild extends StatelessWidget {
  const MyChild({super.key});

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.error_sharp,
                      color: Colors.white,
                    ),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Important! Evaluation Pending!\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                        TextSpan(
                            text: 'Answer the question about Alis',
                            style: TextStyle(color: Colors.white))
                      ]),
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
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Alis's Evaluation Report",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
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
                    const Padding(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const SensorryBottle()));
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
