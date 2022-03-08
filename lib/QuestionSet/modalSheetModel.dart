import 'package:flutter/material.dart';
import 'SetQuestionTextField.dart';



void modalSheetMethod(context){
  showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30))),
      context: context,
      builder: (BuildContext context) {
      return ModalSheetCustomization();
      });
}

class ModalSheetCustomization extends StatefulWidget {
  // const ModalSheetCustomization({Key key}) : super(key: key);

  @override
  _ModalSheetCustomizationState createState() =>
      _ModalSheetCustomizationState();
}

class _ModalSheetCustomizationState extends State<ModalSheetCustomization> {
  TextEditingController questionInput = TextEditingController();
  TextEditingController answerInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Set a question",
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )),
          ),
          SetQuestionTextFields(questionInput:questionInput, answerInput:answerInput),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: ElevatedButton(
              onPressed: () {
               setState(() {

               });
                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
