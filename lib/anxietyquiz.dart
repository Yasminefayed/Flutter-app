import 'package:flutter/material.dart';
import 'package:untitled3/dummy.dart';
import 'package:untitled3/recommendation1.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'How frequently do you feel anxious or worry about a lot of things?',
      'answers': [
        {'text': 'Very Little', 'score': 10},
        {'text': 'Often but not regularly', 'score': 4},
        {'text': 'Berlin', 'score': 3},

      ],
    },
    {
      'questionText': 'How often is it difficult for you to control your worrying?',
      'answers': [
        {'text': 'Very Little', 'score': 10},
        {'text': 'Often but not regularly', 'score': 4},
        {'text': 'Berlin', 'score': 3},
      ],
    },
    {
      'questionText': 'How often do you avoid situations due to fear of anxiety spiking or having a panic attack?',
      'answers': [
        {'text': 'Very Little', 'score': 10},
        {'text': 'Often but not regularly', 'score': 4},
        {'text': 'Berlin', 'score': 3},
      ],
    },
    {
      'questionText': 'How often do you feel like you are “losing your mind,” or fear that you might be?',
      'answers': [
        {'text': 'Very Little', 'score': 10},
        {'text': 'Often but not regularly', 'score': 4},
        {'text': 'Berlin', 'score': 3},
      ],
    },
    {
      'questionText': 'When your fear is triggered, how often do you have irrational thoughts or struggle to develop thoughts at all?',
      'answers': [
        {'text': 'Very Little', 'score': 10},
        {'text': 'Often but not regularly', 'score': 4},
        {'text': 'Berlin', 'score': 3},
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
                    MaterialPageRoute(builder: (context) => rec())
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