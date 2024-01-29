import 'package:flutter/material.dart';
import 'package:untitled3/rec1.dart';

void main() => runApp(idk());

class idk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: idk1(),
    );
  }
}

class idk1 extends StatefulWidget {
  @override
  idk2 createState() => idk2();
}

class idk2 extends State<idk1> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'At times I am MUCH more talkative or speak MUCH faster than usual',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'Trouble falling or staying asleep, or sleeping too much',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'Do you feel disconnected from people?',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'How often do you feel restless or fidgety?',
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
      'questionText': 'Do you find it difficult to organize or keep track of your thinking?',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'How often is it difficult for you to control your worrying?',
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