import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/MovieBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';
import 'package:flutter_app/page/MovieDetailsPage.dart';
import 'package:widget_chain/widget_chain.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
              bottom: TabBar(tabs: tabTitleList.toList()),
            ),
            body: TabBarView(children: tabViewList.toList())));
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
    SecondHttpManager.getInstance().recommendMovie(onSuccess: (data) {
      setState(() {
        print("lenght: " + data.hotPlayMovies.movies.length.toString());
        MovieBean movieBean=data as MovieBean;

        final size = MediaQuery.of(context).size;
        final width = size.width;

        for (int i = 0; i < movieBean.hotPlayMovies.movies.length; i++) {
          itemList.add(MovieItem(movieBean.hotPlayMovies.movies[i]));
        }

//        List mobileItemList = List<MovieItem>();
//
//        for(int i=0;i<movieBean.mobilemoviecoming.mobilemoviecoming.moviecomings.length;i++){
//          mobileItemList.add(SoonTabItem());
//        }

        tabTitleList.add(Tab(text: '正在热映'));
        tabTitleList.add(Tab(text: '即将上映'));

        tabViewList.add(TabItem(itemList));
        tabViewList.add(SoonTabItem(movieBean.mobilemoviecoming.moviecomings));
      });
    });
//    MovieBean data = await SecondHttpManager.getInstance().recommendMovie();
  }
}

class TabItem extends StatelessWidget {
  List<MovieItem> _itemList;

  TabItem(this._itemList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.60,
        children: _itemList.toList(),
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  Movy movy;

  MovieItem(this.movy);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (content)=>MovieDetailsPage(movy.movieId,movy.titleCn)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image.network(
                movy.img,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                movy.titleCn,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child:
              Text('豆瓣评分：' + movy.ratingFinal, style: TextStyle(fontSize: 13)),
            ),
          ],
        ) ,
      );
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
        children: itemList().toList(),
      ),
    );
  }

  List<Widget> itemList(){
    List<Widget> list=List();
    if(_itemList==null){
      return list;
    }
    for(int i=0;i<_itemList.length;i++){
      list.add(Column(
        children: <Widget>[
          Expanded(
            child: Image.network(_itemList[i].image),
          ),
          Text(
            _itemList[i].title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ).intoPadding(padding: EdgeInsets.only(top: 15)),
          Text(
            '上映时间：'+_itemList[i].rYear.toString()+"-"
                +_itemList[i].rMonth.toString()+"-"
                +_itemList[i].rDay.toString(),
          ).intoPadding(padding: EdgeInsets.only(top: 3))

        ],
      ));
    }
    return list;
  }
}



