import 'package:app13_quiz_app/ui/answerbuttons.dart';
import 'package:app13_quiz_app/ui/answeroverlay.dart';
import 'package:app13_quiz_app/ui/questiontext.dart';
import 'package:app13_quiz_app/ui/scorepage.dart';
import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question(" Is New Delhi  the capital of India", true),
    new Question(" Is New york  the capital of USA", false),
    new Question("There Are 28 states in india", false),
    new Question("There are 51 states in USA", false),
    new Question("India got independence on 15 August 1947. ", true),
    new Question("Pandit Jawahar Lal Nehru is the ist prime minister of india", true),
    new Question("Android is an open source project", true),
    new Question("Islamabad is the capital of Afganisthan", false),
    new Question("Electrons are larger than Molecules", false),
    new Question("The Atlantic ocean is the largest ocean in the world", false),
    new Question("Spiders have six legs ", false),
  ]);

  String questionText;
  int questionnumber;
  bool isCorrect;
  bool answerOverlayShow = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionnumber = quiz.questionNumber;
  }

  void answerHandler(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      answerOverlayShow = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          //this is our main page
          children: <Widget>[
            //true button
            new AnswerButton(true, () {
              answerHandler(true);
            }),
            //question area
            new QuestionText(questionText, questionnumber),
            //false button
            new AnswerButton(false, () {
              answerHandler(false);
            }),
          ],
        ),
        answerOverlayShow == true
            ? new AnswerOverlay(isCorrect, () {
                if (quiz.length == questionnumber) {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (builContext) =>
                          new ScorePage(quiz.score, quiz.length)));
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  answerOverlayShow = false;
                  questionText = currentQuestion.question;
                  questionnumber = quiz.questionNumber;
                });
              })
            : new Container(),
      ],
    );
  }
}
