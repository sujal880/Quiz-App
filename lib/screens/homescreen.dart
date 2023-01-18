import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quiz_app/models/db_connect.dart';
import 'package:quiz_app/widgets/constants.dart';
import 'package:quiz_app/widgets/options_card.dart';
import 'package:quiz_app/widgets/question_widget.dart';
import 'package:quiz_app/widgets/result_box.dart';

import '../models/ques_model.dart';
import '../widgets/next_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;
  bool ispressed=false;
  bool isAlreadySelected=false;
  int score=0;
  var db=DBConnect();
  late Future _questions;
  Future<List<QuesModel>>getData()async{
    return db.fetchQuestion();
  }


  void startOver(){
    setState(() {
      index=0;
      score=0;
      ispressed=false;
      isAlreadySelected=false;
    });
    Navigator.pop(context);
  }
  void checkAnswerAndUpdate(bool value){
    if(isAlreadySelected){
      return;
    }else{
      if(value==true){
        score++;
      }
      setState(() {
        ispressed=true;
        isAlreadySelected=false;
      });
    }
  }
  void nextQuestion(int queslength){
    setState(() {
      if(index==_question.length-1){
        showDialog(
            barrierDismissible: false,
            context: context, builder: (BuildContext context)=>
          ResultBox(questionlength: _question.length,result: score, onPressed:startOver)
        );
      }
      else{
        if(ispressed){
          setState(() {
            index++;
            ispressed=false;
          });
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select an Option")));
        }
      }
    });
  }
  List<QuesModel>_question=[
    QuesModel(id: '10', title: "What is 2+2 ?", options: {'50':false,'30':false,'4':true,'10':false})
  ];
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      _questions=getData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<QuesModel>>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasError){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(title: Text("${snapshot.hasError}"),actions: [TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok"))],);
            });
          }
          else if(snapshot.hasData){
            var extractedData=snapshot.data as List<QuesModel>;
            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                backgroundColor: background,
                shadowColor: Colors.transparent,
                title: Text("Quiz App"),
                actions: [
                  Padding(padding: EdgeInsets.all(18.0),child: Text("Score:${score}",style: TextStyle(fontSize: 18),),)
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    QuestionWidget(indexAction: index, question: _question[index].title, totalquestion: _question.length),
                    const Divider(thickness: 1,color: neutral,),
                    const SizedBox(height: 25),
                    for(int i=0;i<_question[index].options.length;i++)
                      GestureDetector(
                          onTap:(){
                            checkAnswerAndUpdate(_question[index].options.values.toList()[i]);
                          },
                          child: OptionCard(option:_question[index].options.keys.toList()[i],color: ispressed ? _question[index].options.values.toList()[i]==true ? correct:incorrect:neutral,)),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(onTap:(){nextQuestion(extractedData.length);},child: NextButton()),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        }
        return Text("No Data");
      },

    );
  }
}
