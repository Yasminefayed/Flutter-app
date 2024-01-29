import 'package:flutter/material.dart';
import 'package:untitled3/rec1.dart';
void main() => runApp(bipolar());

class bipolar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: bipolar1(),
    );
  }
}

class bipolar1 extends StatefulWidget {
  @override
  bipolar2 createState() => bipolar2();
}

class bipolar2 extends State<bipolar1> {
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
      'questionText': 'I get into moods where I feel VERY speeded up or irritableh',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'My self-confidence ranges from GREAT self-doubt to EQUALLY GREAT overconfidence',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'FOR NO OBVIOUS REASON I sometimes have been VERY angry or hostile',
      'answers': [
        {'text': 'Never', 'score': 10},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Very often', 'score': 2},

      ],
    },
    {
      'questionText': 'At times I am GREATLY interested in being with people and at other times I just want to be left alone with my thoughts',
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