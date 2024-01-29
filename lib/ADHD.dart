import 'package:flutter/material.dart';
import 'package:untitled3/dummy.dart';
import 'package:untitled3/rec1.dart';

void main() => runApp(ad());

class ad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: adhd(),
    );
  }
}

class adhd extends StatefulWidget {
  @override
  adh createState() => adh();
}

class adh extends State<adhd> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'Do you tend to avoid or delay getting started on a new important task?',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'All the time': 3},
        {'text': 'Very often', 'All the time': 2},

      ],
    },
    {
      'questionText': 'Do you find that the majority of your tasks (work/school assignments, etc.) are boring or repetitive, making them difficult to complete? ',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'How often do you feel restless or fidgety? ',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'Do you have difficulty unwinding or feel often on the go?',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'Do you have difficulty concentrating on people when they are speaking to you?',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },



  ];

  void _answerQuestion(int? score) {
    if (score != null) {
      setState(() {
        this.score += score;
        questionIndex++;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgrnd.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          questionIndex < questions.length
              ? Center(
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    questions[questionIndex]['questionText'],
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.red, // Set question text color to red
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>).map((answer) {
                    return ElevatedButton(
                      onPressed: () => _answerQuestion(answer['score'] ),
                      child: Text(answer['text'] as String),
                    );
                  }).toList(),
                ],
              )
          )  : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Quiz Completed!',
                  style: TextStyle(fontSize: 20.0, color: Color(0xffb11226)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Your Score: $score ',
                  style: TextStyle(fontSize: 20.0, color: Color(0xffb11226)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => rec1())
                    );

                  },
                  child: Text('Your Happy Place'),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }}