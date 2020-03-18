import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MovieDetailsState();
  }
}

class MovieDetailsState extends State<MovieDetailsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('看看'),),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }

}


class MovieIntroduction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return null;
  }
}






