import 'package:flutter/material.dart';
import 'package:quiz_app/models/db_connect.dart';
import 'package:quiz_app/models/ques_model.dart';
import 'package:quiz_app/screens/homescreen.dart';

void main() {
  var db=DBConnect();
  db.addQuestion(QuesModel(id: '20', title: "What is 2*2=?", options: {'100':false,'4':true,'200':false,'300':false}));
  db.fetchQuestion();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}