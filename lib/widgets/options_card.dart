import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/constants.dart';
class OptionCard extends StatefulWidget {

  OptionCard({Key? key,required this.option,required this.color});
  final String option;
  final Color color;
  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:  widget.color ,
      child: ListTile(
        title: Text(
          widget.option,style: TextStyle(fontSize: 22,color: Colors.red!=Colors.green?neutral:Colors.black),textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
