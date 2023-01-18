import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/constants.dart';

class ResultBox extends StatefulWidget {
  final int result;
  final int questionlength;
  final VoidCallback onPressed;
  ResultBox({Key? key, required this.questionlength, required this.result,required this.onPressed})
      : super(key: key);

  @override
  State<ResultBox> createState() => _ResultBoxState();
}

class _ResultBoxState extends State<ResultBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Result",
              style: TextStyle(fontSize: 22, color: neutral),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              child: Text(
                "${widget.result}/${widget.questionlength}",
                style: TextStyle(fontSize: 20),
              ),
              radius: 60,
              backgroundColor: widget.result == widget.questionlength / 2
                  ? Colors.yellow
                  : widget.result < widget.questionlength / 2
                      ? incorrect
                      : correct,
            ),
            SizedBox(height: 20),
            Text(
              widget.result == widget.questionlength / 2
                  ? "Almost There"
                  : widget.result < widget.questionlength / 2
                      ? "Try Again"
                      : "Great!!",style: TextStyle(fontSize: 18,color: neutral),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: widget.onPressed,
              child: Text("Start Over",style: TextStyle(fontSize: 20,color: Colors.blue,letterSpacing: 1.0),),
            )
          ],
        ),
      ),
    );
  }
}
