import 'package:elite_academy/features/home/quiz/quiz_model.dart';
import 'package:elite_academy/features/home/quiz/web_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Future<List<QuizModel>> futureUrl;
  Future<List<QuizModel>> fetchQuizUrl() async {
    final response = await http.get(
        Uri.parse(
            'https://elite-academy-quiz-backend.onrender.com/class/xii/subject/accountancy/?term=1'),
        headers: {});
    if (response.statusCode == 200) {
      return quizListFromJSON(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureUrl = fetchQuizUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text('Quiz Page'),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<QuizModel>>(
          future: futureUrl,
          builder: (context, AsyncSnapshot<List<QuizModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => ElevatedButton(
                  onPressed: () {
                    // print(snapshot.data!);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            QuizWebView(url: snapshot.data![index].href),
                      ),
                    );
                  },
                  child: Text(snapshot.data![index].name),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/quizView');
        //   },
        //   child: const Text('Quiz 1'),
        // ),
      ],
    );
  }
}
