import 'package:flutter/material.dart';
//import 'package:quizzler/question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

//  List<String> question = [
//    'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.'
//  ];
//  List<bool> answers =[false , true , true ];
//
//  Question q1 = Question(q: 'You can lead a cow down stairs but not up stairs.',a: false );
//  Question q2 = Question(q: 'Approximately one quarter of human bones are in the feet.',a: true );
//  Question q3 = Question(q: 'A slug\'s blood is green.',a: true );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
//                question[questionNumber],
//                quizBrain.questionBank[questionNumber].questionText,
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                //                  bool correctAnswer = answers[questionNumber];
//                  bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
//                bool correctAnswer = quizBrain.getQuestionAnswer();
//                if(correctAnswer==true){
//                  print('user got it right');
//                }
//                else{
//                  print('user got it wrong');
//                }
//                setState(() {
//                  quizBrain.nextQuestion();
//                });
//                print(questionNumber);
//               setState(() {
//                 scoreKeeper.add(
//                   Icon(Icons.check,color: Colors.green,),
//                 );
//               });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
//                bool correctAnswer = answers[questionNumber];
//                bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
//                bool correctAnswer = quizBrain.getQuestionAnswer();
//                if(correctAnswer==false){
//                  print('user got it right');
//                }
//                else{
//                  print('user got it wrong');
//                }
//                //The user picked false.
//                setState(() {
//                  quizBrain.nextQuestion();
//                });
//                print(questionNumber);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

//
//Icon(Icons.check,color: Colors.green,),
//Icon(Icons.close,color: Colors.red,),
//Icon(Icons.check,color: Colors.green,),
//Icon(Icons.close,color: Colors.red,),
//Icon(Icons.check,color: Colors.green,),
//Icon(Icons.close,color: Colors.red,),

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
