import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzes/timer/breakAlertDialog.dart';
import 'TimerClass.dart';

class TimerPage extends StatefulWidget {
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  //const ({Key key}) : super(key: timerpage);

//  variable for  timer and duration
  Timer timer = Timer.periodic(const Duration(seconds: 0), (timer) {});
  Duration duration = const Duration(minutes: 0, seconds: 10);
  bool breakTimeActivated = false;
  TextEditingController min = TextEditingController();
  TimerClass timerClassInstance = TimerClass();
  bool switchUpM = true;

  // method that causes the timer to countdown
  // make function a parameter

  void start() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int secondsCountdown = duration.inSeconds - 1;
      setState(() {
        duration = Duration(seconds: secondsCountdown);
        if (duration.inSeconds == 0 && breakTimeActivated == false) {
          timer.cancel();
          breakTime();
        } else if (duration.inSeconds == 0 && breakTimeActivated == true) {
          timer.cancel();
        }
      });
    });
  }

  void breakTime() {
    breakAlertDialog(
        context: context,
        yesOnPressed: () {
          breakTimeActivated = true;
          Navigator.pop(context);
          duration = const Duration(minutes: 0, seconds: 5);
          timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            setState(() {
              int secondsCountdown = duration.inSeconds - 1;
              duration = Duration(seconds: secondsCountdown);
              if (duration.inSeconds == 0) {
                // once at zero, 5 min break begins. Normal countdown procedure as above
                timer.cancel();
                breakTimeActivated = false;
                duration = const Duration(minutes: 0, seconds: 10);
                switchUpM = true;
              }

            });
          });
        },
        noOnPressed: () {
          Navigator.pop(context);
          breakTimeActivated = false;
          setState(() {
            duration = const Duration(minutes: 0, seconds: 10);
            switchUpM = true;
          });
        });
  }

  // Stop timer
  void stop() {
    timer.cancel();
    setState(() {
      duration = const Duration(minutes: 0, seconds: 10);
      breakTimeActivated = false;
    });
  }

  //made into a widget because of spacing
  Widget currentMode() {
    String currentModeChange = "Focus";
    if (duration.inSeconds == 0 && breakTimeActivated == false) {
      setState(() {
        currentModeChange = "Focus";
      });
    } else if (breakTimeActivated == true) {
      setState(() {
        currentModeChange = "Break";
      });
    }
    return Column(
      children: [
        const Icon(
          Icons.alarm,
          color: Colors.blue,
        ),
        Text(
          currentModeChange,
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  void askForTime() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: [
                TextField(
                  controller: min,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget buttonChange() {

    return Row(
      children: [
        timerClassInstance.timerButton(
            name: "Pause",
            onPressed: () {
             timer.cancel();
             setState(() {
               switchUpM = true;
             });
            }),
        timerClassInstance.timerButton(
            name: "Stop",
            onPressed: () {
              setState(() {
                switchUpM = true;
              });
              stop();
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            currentMode(),
            Center(
              child: timerClassInstance.showTime(
                  minute: duration.inMinutes.remainder(60),
                  second: duration.inSeconds.remainder(60)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                switchUpM
                    ? timerClassInstance.timerButton(
                    name: "Start",
                    onPressed: () {
                      setState(() {
                        switchUpM = false;
                      });
                      start();
                    }):buttonChange(),

              ],
            )
          ],
        ));
  }
}
