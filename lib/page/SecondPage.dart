import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/MovieBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondState();
  }
}

class SecondState extends State<SecondPage> {
//  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabTitleList.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text('电源'),
              bottom: TabBar(
                tabs:tabTitleList.toList()
              ),
            ),
            body: TabBarView(
              children: tabViewList.toList()
            )
        ));
  }

  @override
  void initState() {
    super.initState();
//    _tabController = new TabController(
//        vsync: this,//固定写法
//        length: 2   //指定tab长度
//    );

    _loadData();
  }

  List itemList = List<MovieItem>();
  List tabViewList = List<Widget>();
  List tabTitleList = List<Widget>();

  void _loadData() async {
    MovieBean data = await SecondHttpManager.getInstance().recommendMovie();
    setState(() {
      print("lenght: "+data.hotPlayMovies.movies.length.toString());
      for (int i=0; i < data.hotPlayMovies.movies.length; i++) {
        itemList.add(MovieItem(data.hotPlayMovies.movies[i].img));
      }
      tabTitleList.add(Tab(text: '正在热映'));
      tabTitleList.add(Tab(text: '即将上映'));
      tabViewList.add(TabItem(itemList));
      tabViewList.add(TabItem(itemList));
    });
  }
}


class TabItem extends StatelessWidget {
  List<MovieItem> _itemList;
  TabItem(this._itemList);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      children: _itemList.toList(),
    );
  }

}

class MovieItem extends StatelessWidget {
  String url;

  MovieItem(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Image.network(url),
    );
  }
}
