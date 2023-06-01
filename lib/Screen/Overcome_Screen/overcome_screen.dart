import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hukibu/Screen/Overcome_Screen/overcome_details.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hukibu/Screen/Cuddle_Screen/cuddle_details.dart';

class OverComeScreen extends StatefulWidget {
  const OverComeScreen({super.key});

  @override
  State<OverComeScreen> createState() => _OverComeScreenState();
}

class _OverComeScreenState extends State<OverComeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 3.3,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.blue,
                  ],
                  begin: FractionalOffset(0.5, 0.0),
                  end: FractionalOffset(0.99, 0.0),
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/teacher.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 88.0, left: 10),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "cuddle".tr(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const TextSpan(
                          text: "postnatal",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ]),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 242, 238, 238),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ListView(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Overcome Screen Addiction with Lahar Bhatnagar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ).tr(),
                    30.heightBox,
                    const Text(
                            "Help you child detach from screen and enjoye the world outside")
                        .tr(),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "\$999",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 18,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 2, 215, 112),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Join Now",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ).tr(),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      ],
                    ),
                    30.heightBox,
                    const Text(
                      "WHAT YOU GET",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ).tr(),
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
                                color: const Color.fromARGB(255, 94, 92, 92),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.timer_outlined),
                                const Text(
                                  "5 mins\ndaily",
                                  style: TextStyle(fontSize: 12),
                                ).tr(),
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
                                color: const Color.fromARGB(255, 94, 92, 92),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.person_2_rounded),
                                const Text(
                                  "One to One\nSession",
                                  style: TextStyle(fontSize: 10),
                                ).tr(),
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
                                color: const Color.fromARGB(255, 94, 92, 92),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.local_activity),
                                const Text(
                                  "Activities",
                                  style: TextStyle(fontSize: 12),
                                ).tr(),
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
                              children: [
                                const Icon(Icons.add_box_outlined),
                                const Text(
                                  "Bounes",
                                  style: TextStyle(fontSize: 12),
                                ).tr(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "EXPERIENCE AND LEARN WITH ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ).tr(),
                    20.heightBox,
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(99, 136, 163, 181),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.cyan,
                              // backgroundImage:
                              //     AssetImage('assets/images/4.jpg'),
                            ),
                            20.widthBox,
                            const Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Lahar Bhatnagar\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              TextSpan(text: 'Scientific Parenting Coach')
                            ]))
                          ],
                        ),
                      ),
                    ),
                    20.heightBox,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const OverComeDetails()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 24,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: const Center(
                          child: Text(
                            'LEARN MORE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    20.heightBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'Day 1-Self\n  Regular',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 15),
                                      child: Text(
                                        'Day 1-30 mint for yourself',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'Bounes-Mind \n Mapping \nTechniques',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'Day 2-Felling \n   words',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 15),
                                      child: Text(
                                        'Day 2-Look into thier Eyes',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 15),
                                      child: Text(
                                        'Days 3-Delayed Gratification',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 15),
                                      child: Text(
                                        'Day 3-Habit\n change',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, left: 10, right: 10),
                                      child: Text(
                                        'Days 4-Non Verbal \n Cues',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 15),
                                      child: Text(
                                        '    Day 4 -\nNotification',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 15),
                                      child: Text(
                                        'Days 5-Positive \n Reinforcement',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(right: 160.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(195, 16, 89, 192),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 58.0),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  10.heightBox,
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 8.0, left: 15),
                                    child: Text(
                                      'Days 5 - Nothing \n    Time',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
