import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_app/net/HttpManager.dart';
import 'package:flutter_app/page/ListPage.dart';

class SearchRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }
}

class SearchState extends State<SearchRoute> {
  @override
  void initState() {
    getHotData();
    super.initState();
  }

  List<FlowText> flowTextList = new List();

  void getHotData() async {
    var data = await HttpManager.getInstance().hotList();
    setState(() {
      for (int i = 0; i < data.length; i++) {
        flowTextList.add(FlowText(data[i].name));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQueryData.fromWindow(window).padding.top,
            color: Colors.blue,
          ),
          SearchView(context),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 12, bottom: 5),
            child: Text(
              '别人再搜',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Wrap(
            children: flowTextList.toList(),
          ),
        ],
      ),
    ));
  }
}

List colorList = [
  Colors.deepOrange,
  Colors.green,
  Colors.blue,
  Colors.pink,
  Colors.cyan,
  Colors.deepPurpleAccent
];

class FlowText extends StatelessWidget {
  String content;

  FlowText(this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Container(
        height: 30,
        child: ActionChip(
          backgroundColor: colorList[Random().nextInt(colorList.length)],
          label: Text(
            content,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {

  BuildContext _context;

  SearchView(this._context);

  var controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 55,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(_context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Container(
            height: 35,
            child: TextField(
              controller: controler,
              onSubmitted: (a) {
                searchAction();
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: '请输入要搜索的关键字',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.only(
                    top: 2,
                    left: 10,
                  ),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                searchAction();
              },
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  void searchAction() {
    if (controler.text == "") {
      return;
    }
    Navigator.push(_context,
        MaterialPageRoute(builder: (context) => ListPage(controler.text)));
  }
}
