import 'package:flutter/material.dart';
import 'package:untitled3/rec1.dart';

void main() => runApp(eat());

class eat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: eats(),
    );
  }
}

class eats extends StatefulWidget {
  @override
  eating createState() => eating();
}

class eating extends State<eats> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'When you lose control over your eating, do you eat even though you are not hungry? ',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'Do you struggle to control when and how much you eat?',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': ' When you lose control over your eating, do you feel like you cannot stop eating once you have started?',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'When you cannot stop eating, do you eat so much that you feel uncomfortably full afterwards? ',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'Do you find yourself eating more when you try to restrict how much you eat? ',
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