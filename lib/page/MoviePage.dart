//class MoviePage{
//
//}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/MovieBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';
import 'package:flutter_app/page/MovieDetailsPage.dart';
import 'package:widget_chain/widget_chain.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieState();
  }
}

class MovieState extends State<MoviePage> {
//  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabTitleList.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text('电影'),
              bottom: TabBar(tabs: tabTitleList.toList()),
            ),
            body: TabBarView(children: tabViewList.toList())));
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  List tabViewList = List<Widget>();
  List tabTitleList = List<Widget>();

  void _loadData() async {
    SecondHttpManager.getInstance().recommendMovie(onSuccess: (data) {
      setState(() {
        MovieBean movieBean = data as MovieBean;

        final size = MediaQuery.of(context).size;
        final width = size.width;

        tabTitleList.add(Tab(text: '正在热映'));
        tabTitleList.add(Tab(text: '即将上映'));
        print(
            "热门电影lenght: " + movieBean.hotPlayMovies.movies.length.toString());
//        movieBean.hotPlayMovies.movies.clear();
        tabViewList.add(HotTabItem(movieBean.hotPlayMovies.movies));
        tabViewList.add(SoonTabItem(movieBean.mobilemoviecoming.moviecomings));
      });
    });
  }
}

class HotTabItem extends StatelessWidget {
  List<Movy> _itemList;

  HotTabItem(this._itemList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: _itemList.length == 0
          ? NothingView()
          : GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.60,
        children: dataList(context).toList(),
      ),
    );
  }

  List<Widget> dataList(BuildContext context) {
    List<Widget> dataList = new List();
    for (int i = 0; i < _itemList.length; i++) {
      dataList.add(  GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (content)=>MovieDetailsPage(_itemList[i].movieId,_itemList[i].titleCn)));
          },child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image.network(_itemList[i].img,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              _itemList[i].titleCn,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Text('豆瓣评分：' + _itemList[i].ratingFinal,
                style: TextStyle(fontSize: 13)),
          ),
        ],
      )),
      );
    }
    return dataList;
  }
}

class SoonTabItem extends StatelessWidget {
  List<Moviecoming> _itemList;

  SoonTabItem(this._itemList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.60,
        children: itemList(context).toList(),
      ),
    );
  }

  List<Widget> itemList(BuildContext context) {
    List<Widget> list = List();
    if (_itemList == null) {
      return list;
    }
    for (int i = 0; i < _itemList.length; i++) {
      list.add( GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (content)=>MovieDetailsPage(_itemList[i].movieId.toString(),_itemList[i].title)));
          },child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image.network(_itemList[i].image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
          ),
          Text(
            _itemList[i].title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ).intoPadding(padding: EdgeInsets.only(top: 15)),
          Text(
            '上映时间：' +
                _itemList[i].rYear.toString() +
                "-" +
                _itemList[i].rMonth.toString() +
                "-" +
                _itemList[i].rDay.toString(),
          ).intoPadding(padding: EdgeInsets.only(top: 3))
        ],
      )));
    }
    return list;
  }
}

class NothingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Image.asset(
          "nothing_bg.gif",
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
        Text(
          '暂时没有数据呢',
          style: TextStyle(fontSize: 13),
        ).intoPadding(padding: EdgeInsets.only(top: 8)),
        Expanded(child: Container()),
      ],
    );
  }
}
