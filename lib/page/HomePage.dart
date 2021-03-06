import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/RecommendBean.dart';
import 'package:flutter_app/net/HttpManager.dart';
import 'package:flutter_app/page/WebPage.dart';
import 'package:flutter_html/flutter_html.dart';

import 'SearchPage.dart';

//void main() => runApp(PagerApp());

class PagerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PagerSate();
  }
}

class PagerSate extends State<PagerApp> {
  List<PagerItem> dataList = new List();
  List<Widget> listItems = new List();

  void _loadData() async {
//    HttpManager.getInstance();
    var data = await HttpManager.getInstance().articleList();

    RecommendBean recommend = await HttpManager.getInstance().recommendList();
    print("-----请求成功-------");

    setState(() {
      for (int i = 0; i < data.length; i++) {
        dataList.add(new PagerItem(data[i].imagePath, data[i].title));
      }

      listItems.add(MainPagerView(dataList));
      for (int i = 0; i < recommend.datas.length; i++) {
        listItems.add(new ListItem(
            recommend.datas[i].title,
            recommend.datas[i].publishTime.toString(),
            recommend.datas[i].shareUser,
            recommend.datas[i].link));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        actions: <Widget>[MainIcon()],
      ),
      body: ListView(
        children: listItems.toList(),
      ),
    );
  }
}

class MainPagerView extends StatelessWidget {
  List<PagerItem> items;

  MainPagerView(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: PageView(
        children: items.toList(),
      ),
    );
  }
}

class PagerItem extends StatelessWidget {
  String url;
  String title;

  PagerItem(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      children: <Widget>[
        Image.network(
          url,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
            color: Colors.black45,
            height: 30,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(title, style: TextStyle(color: Colors.white)),
              ],
            ))
      ],
      alignment: FractionalOffset(0.5, 1),
    );
    return Container(
      child: stack,
    );
  }
}

class ListItem extends StatelessWidget {
  String title;
  String time;
  String author;
  String url;

  ListItem(this.title, this.time, this.author, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebPage(title, url)));
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
//            Html(
//              data:title,
//            ),
            Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  author,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Divider(height: 1.0, indent: 0.0, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}



class MainIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  IconButton(icon: Icon(Icons.search),onPressed:(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=> SearchRoute()) );
    },);
  }
}