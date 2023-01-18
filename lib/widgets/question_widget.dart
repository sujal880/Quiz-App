import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/constants.dart';
class QuestionWidget extends StatefulWidget {
  final String question;
  final int indexAction;
  final int totalquestion;
  QuestionWidget({Key? key,required this.indexAction,required this.question,required this.totalquestion}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text("Question ${widget.indexAction+1}/${widget.totalquestion} : ${widget.question}",style: TextStyle(fontSize: 24,color: neutral),),
    );
  }
}
