import 'package:flutter/material.dart';
import 'package:untitled3/rec1.dart';

void main() => runApp(dep());

class dep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: depquiz(),
    );
  }
}

class depquiz extends StatefulWidget {
  @override
  depp createState() => depp();
}

class depp extends State<depquiz> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'Little interest or pleasure in doing things',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 4},
        {'text': 'Nearly everyday', 'score': 3},
        {'text': 'More than half of the days', 'score': 2},

      ],
    },
    {
      'questionText': 'Trouble falling or staying asleep, or sleeping too much',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 4},
        {'text': 'Nearly everyday', 'score': 3},
        {'text': 'More than half of the days', 'score': 2},

      ],
    },
    {
      'questionText': 'Feeling tired or having little energy',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 4},
        {'text': 'Nearly everyday', 'score': 3},
        {'text': 'More than half of the days', 'score': 2},

      ],
    },
    {
      'questionText': 'Trouble concentrating on things, such as reading the newspaper or watching television',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 4},
        {'text': 'Nearly everyday', 'score': 3},
        {'text': 'More than half of the days', 'score': 2},

      ],
    },
    {
      'questionText': 'If you have had any days with issues above, how difficult have these problems made it for you at work, home, school, or with other people?',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 4},
        {'text': 'Nearly everyday', 'score': 3},
        {'text': 'More than half of the days', 'score': 2},

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