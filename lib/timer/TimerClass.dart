import 'package:flutter/material.dart';

class TimerClass {
  Widget timeCard(String timeEntry) {
    return Card(
      elevation: 5,
      color:  Colors.blue[400],
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          timeEntry,
          style: const TextStyle(
              fontSize: 90,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
  }

  Widget timerButton({required String name, required Function() onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }

  Widget showTime({required int minute, required int second}) {
    String formatTime(int n) => n.toString().padLeft(2, "0");
    String minutes = formatTime(minute);
    String seconds = formatTime(second);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(7),
          child: timeCard(minutes),
        ),
         Text(
          ":",
          style: TextStyle(fontSize: 70,color: Colors.blue[400]),
        ),
        Padding(
          padding: const EdgeInsets.all(7),
          child: timeCard(seconds),
        ),
      ],
    );
  }
}
// duration.inMinutes.remainder(60)
// duration.inSeconds.remainder(60)
