import 'package:flutter/material.dart';
import '/timer/TimerPage.dart';
import '/LandingPageListTile.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({landingkey}) : super(key: landingkey);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return TimerPage();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
           const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white,
            ),
           BottomNavigationBarItem(
              icon: const Icon(Icons.alarm),
              label: "Timer",
              backgroundColor: Colors.blue[400],
            ),
           const BottomNavigationBarItem(
              icon: Icon(Icons.article_sharp),
              label: "FlashCards",
              backgroundColor: Color(0xFF243432),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xffF8C9A1),
          onTap: onItemTapped,
          type: BottomNavigationBarType.shifting,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Quiz App",
                style: TextStyle(
                    color: Color(0xffF8C9A1),
                    fontSize: 55,
                    fontWeight: FontWeight.w600),
              ),
            ),
            LandingPageListTile(
              title: "Search for study sets",
              subtitle:
                  "Save time by finding existing study sets for your subject or class",
              icon: Icons.search,
            ),
            LandingPageListTile(
              title: "Create a study set",
              subtitle:
                  "Create a study set pertaining to exactly what you're learning",
              icon: Icons.add_box_outlined,
            ),
            LandingPageListTile(
              title: "Pomodoro Timer",
              subtitle:
                  "Focus more on your studies by setting a 25 minute timer for studies and 5 minutes for breaks",
              icon: Icons.alarm,
            ),
          ],
        ),
      ),
    );
  }
}
