import 'package:http/http.dart' as http;
import 'package:quiz_app/models/ques_model.dart';
import 'dart:convert';
class DBConnect{
  final url=Uri.parse('https://quiz-app-239cf-default-rtdb.firebaseio.com/questions.json');
  Future<void>addQuestion(QuesModel question)async{
    http.post(url,body: json.encode({
      'title':question.title,
      'options':question.options
    }));
  }

  Future<List<QuesModel>>fetchQuestion()async{
   return http.get(url).then((response) {
      var data=json.decode(response.body) as Map<String,dynamic>;
      List<QuesModel>newquestions=[];
      data.forEach((key, value) {
        var newQuestion=QuesModel(id: key, title: value['title'], options: Map.castFrom(value['options']));
        newquestions.add(newQuestion);
        print(newquestions);
      });
      return newquestions;
    });
  }
}