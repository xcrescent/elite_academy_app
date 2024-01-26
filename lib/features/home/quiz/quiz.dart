import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elite_academy/core/router/router.gr.dart';
import 'package:elite_academy/features/home/quiz/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Future<List<QuizModel>> futureUrl;
  Future<List<QuizModel>> fetchQuizUrl() async {
    Dio dio = Dio();
    final response = await dio.get(
      'https://elite-academy-quiz-backend.onrender.com/class/xii/subject/accountancy/?term=1',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return quizListFromJSON(response.data);
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
        Text(
          'Quiz Page',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<QuizModel>>(
          future: futureUrl,
          builder: (context, AsyncSnapshot<List<QuizModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemExtent: 80,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Loading...'),
                        ),
                      );
                      // print(snapshot.data!);
                      context.router.push(
                        QuizWebView(url: snapshot.data![index].href),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        snapshot.data![index].name,
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
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
