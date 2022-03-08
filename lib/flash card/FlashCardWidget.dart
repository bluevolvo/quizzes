import 'package:flutter/material.dart';

class FlashCardWidget extends StatefulWidget {
  final String question;

  FlashCardWidget({
    required this.question,
  });

  @override
  State<FlashCardWidget> createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 350,
        width: 220,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                widget.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            )),
      ),
    );
  }
}
