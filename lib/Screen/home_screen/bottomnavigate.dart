import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hukibu/Screen/home_screen/home_screen.dart';
import 'package:hukibu/Screen/my_child.dart';
import 'package:hukibu/Screen/chat_list.dart';
import 'package:hukibu/Screen/notes_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyChild(),
    ChatList(),
    NotesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.only(
          //     topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: const Color.fromARGB(248, 188, 187, 187),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 30,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.white30,
            color: Colors.white,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "home".tr(),
                textColor: Colors.black,
                iconColor: const Color.fromARGB(255, 128, 126, 126),
                iconActiveColor: Colors.black,
              ),
              GButton(
                icon: Icons.person_pin_circle_rounded,
                text: "my child".tr(),
                textColor: Colors.black,
                iconColor: const Color.fromARGB(255, 128, 126, 126),
                iconActiveColor: Colors.black,
              ),
              GButton(
                icon: Icons.message_outlined,
                text: "my circle".tr(),
                textColor: Colors.black,
                iconColor: const Color.fromARGB(255, 128, 126, 126),
                iconActiveColor: Colors.black,
              ),
              GButton(
                icon: Icons.note_sharp,
                text: "Notes".tr(),
                textColor: Colors.black,
                iconColor: const Color.fromARGB(255, 128, 126, 126),
                iconActiveColor: Colors.black,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
