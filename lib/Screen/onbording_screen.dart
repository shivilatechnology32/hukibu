import 'package:flutter/material.dart';
import 'package:hukibu/Screen/login_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => const Login_Screen(
                restorationId: 'main',
              )),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: true,
        autoScrollDuration: 3000,
        globalHeader: const Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 16, right: 16),
              // child: _buildImage('img1.png', 100),
            ),
          ),
        ),
        globalFooter: SizedBox(
          width: 300,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 103, 43, 215),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              _onIntroEnd(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Text('Get Started'),
                ), // <-- Text
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70.0),
                  child: Icon(
                    // <-- Icon
                    Icons.arrow_forward,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        pages: [
          PageViewModel(
            title: "Continuous Evaluations",
            body:
                "Be more aware about your child.Learing stages, difficulties,interests,intelligens,domains and more.",
            image: _buildImage('img1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Professional Help",
            body:
                "Personalized parenting assistance and professional help, just a click away.",
            image: _buildImage('img2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Personalized Learning Activities",
            body:
                "Daily learning activites, personlised for you child easy for the parent .Make the best use of your time with your child",
            image: _buildImage('img3.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Delightful Home Learning",
            body:
                "Super powers of knowledge and structure to parent .Making Home learning a delightful experience",
            image: _buildImage('img4.png'),
            decoration: pageDecoration,
            // reverse: true,
          ),
        ],
        onDone: () {},
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}
