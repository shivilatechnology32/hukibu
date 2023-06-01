import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hukibu/Screen/Cuddle_Screen/cuddle_details.dart';

class CuddleScreen extends StatefulWidget {
  const CuddleScreen({super.key});

  @override
  State<CuddleScreen> createState() => _CuddleScreenState();
}

class _CuddleScreenState extends State<CuddleScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/img1.png'),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: "cuddle".tr(),
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const TextSpan(
                            text: "postnatal",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ]),
                      ),
                    ],
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
                      "cuddle postnatal",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ).tr(),
                    30.heightBox,
                    const Text(
                            "Get expert assistance and personal care in the beginning of your journey as a parent .Because,smart parents raise smart kids, happy parent raise happy kids")
                        .tr(),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 20),
                      child: Text(
                        "\$100",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    20.heightBox,
                    const Text(
                      "TAGS",
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
                                  color: const Color.fromARGB(255, 94, 92, 92)),
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
                                  color: const Color.fromARGB(255, 94, 92, 92)),
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
                                  color: const Color.fromARGB(255, 94, 92, 92)),
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
                                color: const Color.fromARGB(255, 94, 92, 92),
                              ),
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
                      "Experience and leran with ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ).tr(),
                    20.heightBox,
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(99, 136, 163, 181),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.cyan,
                            ),
                            10.widthBox,
                            const Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Nishana Am\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              TextSpan(text: 'Lactation Consultant')
                            ])),
                            20.widthBox,
                            Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 2, 215, 112),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "consult",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ).tr(),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.heightBox,
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
                            10.widthBox,
                            const Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Namrata Sharma\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              TextSpan(
                                  text: 'Certified Children Educator',
                                  style: TextStyle(fontSize: 12))
                            ])),
                            20.widthBox,
                            Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 2, 215, 112),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "consult",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ).tr(),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.heightBox,
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
                                  text: 'Bharti Gaol\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              TextSpan(
                                  text:
                                      'CAPPA Certified \nChilbirth Educator\n and Prenatal \nYoga Instruction',
                                  style: TextStyle(fontSize: 12))
                            ])),
                            50.widthBox,
                            Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 2, 215, 112),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "consult",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ).tr(),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.heightBox,
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
                                  text: 'Dr Divya Jose\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              TextSpan(
                                  text:
                                      'Consultant Obstetriction\n and Gynecologist',
                                  style: TextStyle(fontSize: 12))
                            ])),
                            20.widthBox,
                            Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 2, 215, 112),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "consult",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ).tr(),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.heightBox,
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
                                  text: 'Dr Seema Lal\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              TextSpan(
                                  text:
                                      'Psychologist Spacail\n Educator, Mentol \nHealth Research',
                                  style: TextStyle(fontSize: 12))
                            ])),
                            40.widthBox,
                            Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 2, 215, 112),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "consult",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ).tr(),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.heightBox,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const CuddleDetails()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 24,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: const Center(
                          child: Text(
                            'LERAN MORE',
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
                                      'Change After\n   Delivery',
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
                                      'Recovery Timeline',
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
                                    const Text(
                                      'C-Section\n Recovery',
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
                                      'Medical Needs',
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
                                    const Text(
                                      'Family Report',
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
                                      'Store the Banner',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
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
