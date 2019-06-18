import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);
  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {
  Animation<double> _textSizeAnimation;
  AnimationController _textSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _textSizeAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 800),
    );
    _textSizeAnimation = new CurvedAnimation(
      parent: _textSizeAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    _textSizeAnimation.addListener(() {
      this.setState((){});
    });
    _textSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _textSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
      _textSizeAnimationController.reset();
      _textSizeAnimationController.forward();
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.green[900],
      child: new Container(
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.white,
            width: 3.0,
          ),
          borderRadius: new BorderRadius.all(Radius.circular(5.0)),
        ),
        child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Center(
            child: new Text(
              "Question (" + widget._questionNumber.toString() +  ") :  " + widget._question,
              style: new TextStyle(color: Colors.white, fontSize: _textSizeAnimation.value * 18),
            ),
          ),
        ),
      ),
    );
  }
}
