import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';

class SearchRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }
}

class SearchState extends State<SearchRoute> {
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
          SearchView(),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 12,bottom: 5),
            child: Text(
              '别人再搜',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Wrap(
            children: <Widget>[
              FlowText('悻离开你'),
              FlowText('悻离开你看看看得开'),
              FlowText('悻离开你放多少'),
              FlowText('悻离'),
              FlowText('孔隙比'),
              FlowText('哦哦该'),
              FlowText('库融通排期没寂寞跟'),
              FlowText('跟'),
            ],
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
//      width: 30,
//    alignment:AlignmentDirectional.center,
//      decoration: BoxDecoration(
//        color: colorList[Random().nextInt(colorList.length)],
//        borderRadius: BorderRadius.all(Radius.circular(30.0)),
//      ),
        child: ActionChip(
          backgroundColor: colorList[Random().nextInt(colorList.length)],
          label: Text(content,style: TextStyle(color: Colors.white),),
          onPressed: () {},
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 55,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Container(
            height: 35,
            child: TextField(
              onSubmitted: (a) {
                print(a);
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
            child: Text(
              '搜索',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class SearchFlowDelegate extends FlowDelegate {
  EdgeInsets edgeInsets = EdgeInsets.zero;

  SearchFlowDelegate({this.edgeInsets});

  @override
  void paintChildren(FlowPaintingContext context) {
    var screenW = context.size.width;

    var x = edgeInsets.left;
    var right = edgeInsets.right;
    var y = edgeInsets.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + right;
      if (w < screenW) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + edgeInsets.left;
      } else {
        x = edgeInsets.left;
        y +=
            context.getChildSize(i).height + edgeInsets.top + edgeInsets.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + edgeInsets.left + edgeInsets.right;
      }
      print('i===$i：height' + context.getChildSize(i).height.toString());
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
