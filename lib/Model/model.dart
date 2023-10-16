import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Quiz {
  final String id;
  final String category;
  final String subcategory;
  final String question;
  final String optiona;
  final String optionb;
  final String optionc;
  final String optiond;
  final String answer;
  final String level;
  //final String note;
  Quiz({
    required this.id,
    required this.category,
    required this.subcategory,
    required this.question,
    required this.optiona,
    required this.optionb,
    required this.optionc,
    required this.optiond,
    required this.answer,
    required this.level,
    //required this.note,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      category: json['category'],
      subcategory: json['subcategory'],
      question: json['question'],
      optiona: json['optiona'],
      optionb: json['optionb'],
      optionc: json['optionc'],
      optiond: json['optiond'],
      answer: json['answer'],
      level: json['level'],
      // note: json['note'],
    );
  }
}

Future<List<Quiz>> getpost(String selectclass) async {
  var uri = Uri.https('gurukulsolution.com', '/quiz/api-v2.php');

  final List<Quiz> allpost = [];

  final prefs = await SharedPreferences.getInstance();
  if (selectclass == '6') {
    if (!prefs.containsKey('classname11')) {
      var response = await http.post(uri, headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      }, body: {
        ' access_key': '6808',
        'get_questions_by_subcategory': '1',
        'subcategory': selectclass
      });
      await save11(response.body);
      print("from 11");
    }
    var data = prefs.getString('classname11') ?? '';
    var jsondata = jsonDecode(data);
    for (var q in jsondata['data']) {
      allpost.add(Quiz(
        question: q['question'],
        answer: q['answer'],
        category: q['category'],
        id: q['id'],
        level: q['level'],
        optiona: q['optiona'],
        optionb: q['optionb'],
        optionc: q['optionc'],
        optiond: q['optiond'],
        subcategory: q['subcategory'],
      ));
    }
  } else {
    if (!prefs.containsKey('classname12')) {
      var response = await http.post(uri, headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      }, body: {
        ' access_key': '6808',
        'get_questions_by_subcategory': '1',
        'subcategory': selectclass
      });
      await save12(response.body);
      print("from 12");
    }

    var data = prefs.getString('classname12') ?? '';
    var jsondata = jsonDecode(data);
    for (var q in jsondata['data']) {
      allpost.add(Quiz(
        question: q['question'],
        answer: q['answer'],
        category: q['category'],
        id: q['id'],
        level: q['level'],
        optiona: q['optiona'],
        optionb: q['optionb'],
        optionc: q['optionc'],
        optiond: q['optiond'],
        subcategory: q['subcategory'],
      ));
    }
  }
  return allpost;
}

save11(String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('classname11', value);
}

save12(String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('classname12', value);
}

class Quizmodel11 {
  final Future<List<Quiz>> _data = getpost(6.toString());
  Future<List<Quiz>> get data => _data;
}

class Quizmodel12 {
  final Future<List<Quiz>> _data1 = getpost(8.toString());
  Future<List<Quiz>> get data => _data1;
}
