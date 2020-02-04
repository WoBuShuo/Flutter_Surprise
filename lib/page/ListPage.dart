import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/SearchBean.dart';
import 'package:flutter_app/net/HttpManager.dart';
import 'package:flutter_app/page/HomePage.dart';
import 'package:flutter_html/flutter_html.dart';

import 'WebPage.dart';

class ListPage extends StatefulWidget {
  String searchkey;

  ListPage(this.searchkey);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListState(searchkey);
  }
}

class ListState extends State<ListPage> {
  String searchkey;

  ListState(this.searchkey);

  List<Widget> dataList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchResult();
  }

//  var i=0;
  void getSearchResult() async {
    dataList.clear();
    SearchBean data;

//    if (i==0) {
    data = await HttpManager.getInstance().searchList(searchkey, "1");
//      i++;
//    } else {
//      data = await HttpManager.getInstance().searchList(searchkey, "2");
//    }

    setState(() {
      for (int i = 0; i < data.datas.length; i++) {
        dataList.add(ListItem(data.datas[i].title, data.datas[i].link,
            data.datas[i].shareUser, data.datas[i].link));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          children: dataList.toList(),
        ),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    getSearchResult();
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
//              Text(
//                title,
//                maxLines: 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontSize: 17,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black),
//              ),
            Html(
              data: title,
              defaultTextStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
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
