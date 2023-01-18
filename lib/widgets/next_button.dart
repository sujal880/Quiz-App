import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/constants.dart';
class NextButton extends StatefulWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text("Next Question",textAlign: TextAlign.center),
      ),
    );
  }
}
