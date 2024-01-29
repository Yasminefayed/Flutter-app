import 'package:flutter/material.dart';
import 'package:untitled3/rec1.dart';

void main() => runApp(pt());

class pt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ptsd(),
    );
  }
}

class ptsd extends StatefulWidget {
  @override
  pts createState() => pts();
}

class pts extends State<ptsd> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'Since this event occurred, do you experience recurrent involuntary memories or dreams that make you suffer?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 4},


      ],
    },
    {
      'questionText': 'Do you try not to think about the traumatic event? ',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 4},

      ],
    },
    {
      'questionText': 'Do you blame yourself for the event happening?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 4},

      ],
    },
    {
      'questionText': 'Because of the event, do you now believe that no one can be trusted?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 4},

      ],
    },
    {
      'questionText': ' Do you feel disconnected from people? ',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 4},

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