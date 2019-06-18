import 'package:app13_quiz_app/pages/quizpage.dart';
import 'package:flutter/material.dart';

//this is the Ist Page of this application 

class IstPage extends StatefulWidget {
  @override
  _IstPageState createState() => _IstPageState();
}

class _IstPageState extends State<IstPage>  {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Theme.of(context).accentColor,
      child: new InkWell(
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (buildContext)=> new QuizPage()));
        },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Let's start Quiz", style: new TextStyle(color: Colors.white, fontSize:  50, fontWeight: FontWeight.bold)),
               new Text("Tap to start Quiz", style: new TextStyle(color: Colors.white, fontSize: 30.0,)),
               SizedBox(height: 50.0,),
              new Icon(Icons.face, color: Colors.white, size: 80.0,),
            ],
          ),
        ),
    );
  }
}
