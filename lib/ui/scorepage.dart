import 'package:app13_quiz_app/pages/istpage.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestion;
  ScorePage(this.score, this.totalQuestion);
  @override
  Widget build(BuildContext context) {
     return new Material(
      color: Theme.of(context).primaryColor,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50.0,),
          new Text(
            "Your Score",
            style: new TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20.0),
          new Text(
           score.toString() + "/" + totalQuestion.toString(),
            style: new TextStyle(
              fontSize: 70.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50.0,),
          new IconButton(
            icon: new Icon(Icons.arrow_back,),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (buildContext)=> new IstPage()), (Route route)=> route == null)
          ),
        ],
      ),
    );
  }
}