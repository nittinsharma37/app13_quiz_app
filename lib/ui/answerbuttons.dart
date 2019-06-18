//this is the ui design of answer buttons 

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final bool _answer;
  final VoidCallback _onTap;
  AnswerButton(this._answer, this._onTap);
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: _answer == true ? Colors.blueAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () {
            _onTap();
          },
          child: new Center(
            child: new Container(
              padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              decoration: new BoxDecoration(
                border: new Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                borderRadius: new BorderRadius.all(Radius.circular(20.0)),
              ),
              child: new Text(
                _answer == true ? "True" : "False",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
