import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/MovieBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';
import 'package:flutter_app/page/MovieDetailsPage.dart';
import 'package:flutter_app/page/MoviePage.dart';
import 'package:widget_chain/widget_chain.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondState();
  }
}

class SecondState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('发现'),),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.8,
        children: <Widget>[gridItem()],
      ).intoPadding(padding: EdgeInsets.all(10)) ,
    );
  }

  Widget gridItem() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (build) => MoviePage()));
      },
      child: Stack(
        children: <Widget>[
          Image.asset('find_tab_bg.webp',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
          Positioned(
            top: 50,
            left: 13,
            child: Text(
              '电影',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
