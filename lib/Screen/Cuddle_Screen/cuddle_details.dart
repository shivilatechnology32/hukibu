import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CuddleDetails extends StatefulWidget {
  const CuddleDetails({super.key});

  @override
  State<CuddleDetails> createState() => _CuddleDetailsState();
}

class _CuddleDetailsState extends State<CuddleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ABOUT THE PROGRAM',
                  style: TextStyle(color: Colors.grey),
                ),
                10.heightBox,
                const Text(
                  'Cuddle Postnatal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                30.heightBox,
                const Text(
                    'Get expert assistance and personal care in the beginning of your journey as a parent .Because,smart parents raise smart kids, happy parent raise happy kids'),
                20.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 92)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(Icons.timer_outlined),
                            Text(
                              "5 mins\ndaily",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width / 4.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 92)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(Icons.person_2_rounded),
                            Text(
                              "One to One\nSession",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width / 4.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 92)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(Icons.local_activity),
                            Text(
                              "Activities",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 92)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(Icons.add_box_outlined),
                            Text(
                              "Bounes",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                30.heightBox,
                const Text(
                    'Make your first days of parenting awesome!\nAs a parent,you are taking up a responsibility inlike anythings else,\n\nYour are the biggest impact on your Child life!\n\nYour Happenies will be their happines.Your knoeledge Will be their.Your peace of mind will be theirs.\n\nYou need support.You need care.You need Cuddle.'),
                20.heightBox,
                Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    height: 30,
                    endIndent: 15,
                  )),
                  Text("Meet Your Instruction"),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    height: 30,
                    indent: 15,
                  )),
                ]),
                20.heightBox,
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(116, 195, 192, 183),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        width: double.infinity,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/teacher.jpeg',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 95.0, left: 10),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Nishana AM\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              TextSpan(
                                  text: 'Lactation Consultant',
                                  style: TextStyle(
                                      fontSize: 12,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ])),
                          )
                        ]),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Nishana is a certified lactation consultant and childbirth educator',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 100, 99, 99)),
                        ),
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(116, 183, 181, 173),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        width: double.infinity,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/teacher2.jpg',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 100.0, left: 10),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Nimrata Sharma\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              TextSpan(
                                  text: 'Certified ChildBirth Educator',
                                  style: TextStyle(
                                      fontSize: 12,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ])),
                          )
                        ]),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Nimrata is a CAPPA certified childbirth Educator',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 100, 99, 99)),
                        ),
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                Container(
                  height: MediaQuery.of(context).size.height / 3.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(116, 163, 158, 140),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        width: double.infinity,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/teacher.jpeg',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 100.0, left: 10),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Bharti Goel\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              TextSpan(
                                  text:
                                      'CAPPA certified childbirth Educator and Parental\n Yoga Instruction ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ])),
                          )
                        ]),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'As a CAPPA Certfied Childbirth Educator and Parental Yoga instruction.Bharti loves helping expecting moms to have a confortable and pain-free pregnancy as well as positive child-birthing experience',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 100, 99, 99)),
                        ),
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                Container(
                  height: MediaQuery.of(context).size.height / 3.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(116, 163, 158, 140),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        width: double.infinity,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/teacher2.jpg',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 100.0, left: 10),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'DR.Divya Jose\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              TextSpan(
                                  text: 'Consultant Obstetician and Gynologist',
                                  style: TextStyle(
                                      fontSize: 12,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ])),
                          )
                        ]),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Consultant Obstetrician and Gynecologist.Lourdes Hospital MBBS from Calicut Medical Collage and MS(OBG)from St.Jhons Medical Collage Banalore ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 100, 99, 99)),
                        ),
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                Container(
                  height: MediaQuery.of(context).size.height / 3.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(116, 163, 158, 140),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        width: double.infinity,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/teacher.jpeg',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 100.0, left: 10),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Dr.Seema Lal\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              TextSpan(
                                  text:
                                      'Psycolohist spacail Educator Medical Health Reacher',
                                  style: TextStyle(
                                      fontSize: 12,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ])),
                          )
                        ]),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Mental Health professional with over tewnty years of professional experience spannig both non-governmental organization and private sector instuition based out of india and the United Arab Emirates',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 100, 99, 99)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
