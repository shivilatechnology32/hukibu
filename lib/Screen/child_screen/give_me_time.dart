import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeline_tile/timeline_tile.dart';

class GiveMeTime extends StatefulWidget {
  const GiveMeTime({super.key});

  @override
  State<GiveMeTime> createState() => _GiveMeTimeState();
}

class _GiveMeTimeState extends State<GiveMeTime> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.8,
                    width: MediaQuery.of(context).size.width / 1,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/2.2.jpg',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          color: const Color.fromARGB(85, 0, 0, 0),
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 108.0),
                          child: Container(
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
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Give Me Time',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.light_mode,
                          // color: Colors.black,
                          size: 20,
                        ),
                        10.widthBox,
                        const Text(
                          '30 min',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //color: Colors.black,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 217, 216, 216),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 38.0),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'Materials needed\n',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: '       Balloons',
                                style: TextStyle(fontSize: 18))
                          ])),
                        ),
                      ],
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color.fromARGB(255, 145, 150, 147),
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const Text(
                      'Fill up balloons with water and put them in the freezer',
                      style: TextStyle(fontSize: 18),
                    ),
                    beforeLineStyle: const LineStyle(
                      color: Color.fromARGB(255, 145, 150, 147),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    axis: TimelineAxis.vertical,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color.fromARGB(255, 145, 150, 147),
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const Text(
                        'Take the balloons out once its forezen',
                        style: TextStyle(fontSize: 18)),
                    beforeLineStyle: const LineStyle(
                      color: Color.fromARGB(255, 145, 150, 147),
                    ),
                    afterLineStyle: const LineStyle(
                      color: Color.fromARGB(255, 145, 150, 147),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color.fromARGB(255, 145, 150, 147),
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const Text('Prepare a warm water bath for Ali',
                        style: TextStyle(fontSize: 18)),
                    beforeLineStyle: const LineStyle(
                      color: Color.fromARGB(255, 145, 150, 147),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color.fromARGB(255, 145, 150, 147),
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const Text(
                        'Place the frozen balloons in the firdge',
                        style: TextStyle(fontSize: 18)),
                    beforeLineStyle: const LineStyle(
                      color: Color.fromARGB(255, 145, 150, 147),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 15,
              width: double.infinity,
              color: const Color.fromARGB(255, 225, 225, 224),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.favorite_border_outlined),
                  Text('141'),
                  Icon(Icons.check_circle_outline),
                  Text(
                    'Mark as completed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Icon(Icons.share),
                  Icon(Icons.savings_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//