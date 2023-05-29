import 'package:flutter/material.dart';
import 'package:hukibu/Screen/show_kids_wall.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:favorite_button/favorite_button.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeWithHussain.com',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  bool check1 = false;
  bool check2 = false;

  bool cardcolor = false;
  int currentStep = 0;
  continueStep() {
    if (currentStep < 4) {
      setState(() {
        currentStep = currentStep + 1; //currentStep+=1;
      });
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1; //currentStep-=1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: SizedBox(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: details.onStepContinue,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 110.0),
                child: Text('Next'),
              ),
              90.widthBox,
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const ShowKidsWall()),
                        (route) => false);
                  },
                  icon: const Icon(Icons.arrow_forward)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Stepper(
            elevation: 0, //Horizontal Impact
            // margin: const EdgeInsets.all(20), //vertical impact
            controlsBuilder: controlBuilders,
            type: StepperType.horizontal,
            physics: const ScrollPhysics(),
            onStepTapped: onStepTapped,
            onStepContinue: continueStep,
            onStepCancel: cancelStep,
            currentStep: currentStep,
            //0, 1, 2

            steps: [
              Step(
                  title: const Text(''),
                  content: Padding(
                    padding: const EdgeInsets.only(top: 330.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('recognise familiar faces'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  child: check
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('smile at familiar faces'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check1 = !check1;
                                    });
                                  },
                                  child: check1
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('respond positively to touch'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check2 = !check2;
                                    });
                                  },
                                  child: check2
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: const Text(''),
                  content: Padding(
                    padding: const EdgeInsets.only(top: 330.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'clam himself by bringing hands \nto mouth',
                                //style: TextStyle(fontSize: 12),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  child: check
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                  'express emotion like plesure \nand discomfort'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check1 = !check1;
                                    });
                                  },
                                  child: check1
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('try to look for this parent'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check2 = !check2;
                                    });
                                  },
                                  child: check2
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  isActive: currentStep >= 1,
                  state: currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: const Text(''),
                  content: Padding(
                    padding: const EdgeInsets.only(top: 280.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('make gurgling sounds'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  child: check
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('cry differently to different needs'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  child: check
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('turn his head towords the sounds'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check1 = !check1;
                                    });
                                  },
                                  child: check1
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('try to imitate sounds'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check2 = !check2;
                                    });
                                  },
                                  child: check2
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  isActive: currentStep >= 2,
                  state: currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: const Text(''),
                  content: Padding(
                    padding: const EdgeInsets.only(top: 330.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('follow poeple with his eyes'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  child: check
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('follows object with his eyes'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check1 = !check1;
                                    });
                                  },
                                  child: check1
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('observe faces with interest'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check2 = !check2;
                                    });
                                  },
                                  child: check2
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  isActive: currentStep >= 3,
                  state: currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: const Text(''),
                  content: Padding(
                    padding: const EdgeInsets.only(top: 330.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('raise his need lying on hid stomach'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  child: check
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('bring his hand to his mouth'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check1 = !check1;
                                    });
                                  },
                                  child: check1
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        ),
                        10.heightBox,
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('try to touch dangling objects'),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      check2 = !check2;
                                    });
                                  },
                                  child: check2
                                      ? const Text('Yes')
                                      : const Text('No')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  isActive: currentStep >= 4,
                  state: currentStep >= 4
                      ? StepState.complete
                      : StepState.disabled),
            ],
          ),
        ),
      ),
    );
  }
}
