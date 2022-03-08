import 'package:flutter/material.dart';

void breakAlertDialog(
    {required context,
    required Function() yesOnPressed,
    required Function() noOnPressed}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BreakAlertDialog(
          yesOnPressed: yesOnPressed,
          noOnPressed: noOnPressed,
        );
      });
}

class BreakAlertDialog extends StatefulWidget {
  // const BreakAlertDialog({Key key}) : super(key: key);
  final Function() yesOnPressed;
  final Function() noOnPressed;

  BreakAlertDialog({required this.yesOnPressed, required this.noOnPressed});

  @override
  _BreakAlertDialogState createState() => _BreakAlertDialogState();
}

class _BreakAlertDialogState extends State<BreakAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("Are you ready to take your five minute break?"),
      title: const Text("5 Minute Break"),
      actions: [
        TextButton(onPressed: widget.yesOnPressed, child: const Text("Yes")),
        TextButton(onPressed: widget.noOnPressed, child: const Text("No")),
      ],
    );
  }
}
