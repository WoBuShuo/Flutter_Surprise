import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/SearchBean.dart';
import 'package:flutter_app/net/HttpManager.dart';
import 'package:flutter_app/page/widget/MyListView.dart';
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
  ScrollController _scrollController = new ScrollController();

  String searchkey;

  ListState(this.searchkey);

  List<Widget> dataList = new List();

  int page = 1;

  MyListView listView;

  @override
  void initState() {
    super.initState();
    getSearchResult();
    listView = new MyListView(dataList, scrollController: _scrollController,
        loadMoreListener: () {
      page++;
      getMoreData(page.toString());
    });
  }

//  var i=0;
  void getSearchResult() async {
    dataList.clear();
    page = 1;
    SearchBean data =
        await HttpManager.getInstance().searchList(searchkey, page.toString());
    List<Widget> widgetList = new List();
    setState(() {
      for (int i = 0; i < data.datas.length; i++) {
        widgetList.add(ListItem(data.datas[i].title, data.datas[i].link,
            data.datas[i].shareUser, data.datas[i].link));
      }
      listView.listState.addData(widgetList);
      listView.listState.loadComplete();
    });
  }

  void getMoreData(String page) async {
//    dataList.removeAt(dataList.length - 1);
    if (this.page == 3) {
      listView.listState.loadEnd();
      return;
    }

    SearchBean data =
        await HttpManager.getInstance().searchList(searchkey, page);
    List<Widget> widgetList = new List();
    setState(() {
      for (int i = 0; i < data.datas.length; i++) {
        widgetList.add(ListItem(data.datas[i].title, data.datas[i].link,
            data.datas[i].shareUser, data.datas[i].link));
      }
      listView.listState.addData(widgetList);
      listView.listState.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(onRefresh: _onRefresh, child: listView),
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

bool isLoading = false;

class LoadMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Center(
        child: new CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      ),
    );
  }
}
