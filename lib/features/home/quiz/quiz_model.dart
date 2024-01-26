import 'dart:convert';

List<QuizModel> quizListFromJSON(List<dynamic> str) =>
    List<QuizModel>.from(str.map((x) => QuizModel.fromJson(x)));

String quizListToJson(List<QuizModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
  QuizModel({
    required this.name,
    required this.href,
  });

  String name;
  String href;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        name: json["Name"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "href": href,
      };
}
