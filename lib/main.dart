import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "Contador de pessoas",
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar!";
  void _changePeople(int delta){
    setState(() {
      _people += delta;
    });
  }
  void _changeText(){
    if(_people >= 40) {
      setState(() {
        _infoText = "Lotado!";
      });
    }
    else if(_people < 0){
      setState(() {
        _infoText = "Mundo invertido";
      });
    }
    else{
      setState(() {
        _infoText = "Pode Entrar!";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 34.0),),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("+1", style: TextStyle(fontSize: 35.0, color: Colors.white),),
                        onPressed: (){_changePeople(1); _changeText();},
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("-1", style: TextStyle(fontSize: 35.0, color: Colors.white),),
                        onPressed: (){_changePeople(-1); _changeText();},
                      )),
                ]),
            Text(_infoText,
              style: TextStyle(color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
