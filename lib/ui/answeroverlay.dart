import 'dart:math';
import 'package:flutter/material.dart';

class AnswerOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;
  AnswerOverlay(this._isCorrect, this._onTap);
  @override
  _AnswerOverlayState createState() => _AnswerOverlayState();
}

class _AnswerOverlayState extends State<AnswerOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _answerAnimation;
  AnimationController _answerAnimationController;

  @override
  void initState() {
    super.initState();
    _answerAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 500,
      ),
    );
    _answerAnimation = new CurvedAnimation(
      parent: _answerAnimationController,
      curve: Curves.easeIn,
    );
    _answerAnimation.addListener(() {
      this.setState(() {});
    });
    _answerAnimationController.forward();
  }
  @override
  void dispose() {
    _answerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Theme.of(context).accentColor.withOpacity(0.6),
      child: new InkWell(
        onTap: () {
          widget._onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Transform.rotate(
                angle: _answerAnimation.value * 2 *pi,
                child: new Icon(
                  widget._isCorrect == true ? Icons.done : Icons.clear,
                  size: _answerAnimation.value * 60,
                  color: Colors.white,
                ),
              ),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white, width: 5.0),
                  borderRadius: new BorderRadius.all(Radius.circular(50.0))),
            ),
            new Text(
              widget._isCorrect == true ? "Correct Answer" : "Wrong Answer",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
