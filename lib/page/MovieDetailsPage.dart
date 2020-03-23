import 'package:flutter_app/bean/MovieMessageBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';
import 'package:widget_chain/widget_chain.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  String movieID;

  MovieDetailsPage(this.movieID);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailsState(movieID);
  }
}

class MovieDetailsState extends State<MovieDetailsPage> {
  String movieID;

  MovieDetailsState(this.movieID);

  @override
  void initState() {
    super.initState();
    SecondHttpManager.getInstance().movieMessage(movieID, onSuccess: (data) {
      var bean = data as MovieMessageBean;
      print(bean.playState.toString());

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('看看'),
      ),
      body: ListView(
        children: <Widget>[
          headItem(),
        ],
      ),
    );
  }

  Padding headItem() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.network(
                "http://bj.people.com.cn//NMediaFile/2020/0313/LOCAL202003131750545452283166310.jpg",
                height: 150,
                width: 110,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '叶问',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('动作/历史/剧情')
                      .intoContainer(margin: EdgeInsets.only(top: 10)),
                  Text(
                    '甄子丹过招美军',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ).intoContainer(margin: EdgeInsets.only(top: 10))
                ],
              ).intoContainer(margin: EdgeInsets.all(10)).intoExpanded(),
            ],
          ),
          Row(
            children: <Widget>[
              Text.rich(TextSpan(children: [
                TextSpan(text: '时光评分', style: TextStyle(color: Colors.cyan)),
                TextSpan(
                    text: '7.7',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 30))
              ])),
              FlatButton.icon(
                label: Text('俊俊'),
                icon: new Image.asset(
                  'image/icon_bool.png',
                  width: 23,
                  height: 23,
                ),
                color: Colors.grey,
                shape: StadiumBorder(),
                onPressed: () {
                  print(AssetImage('image/icon_bool.png'));
                },
              )
                  .intoContainer(height: 30, padding: EdgeInsets.only(left: 20))
                  .intoExpanded(),
              FlatButton.icon(
                label: Text('俊俊'),
                icon: Icon(
                  Icons.add_box,
                  color: Colors.red,
                ),
                color: Colors.grey,
                shape: StadiumBorder(),
                onPressed: () {},
              )
                  .intoContainer(height: 30, padding: EdgeInsets.only(left: 20))
                  .intoExpanded(),
            ],
          ).intoPadding(padding: EdgeInsets.only(top: 13)),
          Text('简介',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
              .intoPadding(padding: EdgeInsets.only(top: 10)),
          Text(
              "因故来到美国唐人街的叶问，意外卷入一场当地军方势力与华人武馆的纠纷，面对日益猖狂的民族歧视与压迫，叶问挺身而出，在美国海军陆战队军营拼死一战，以正宗咏春，向世界证明了中国功夫"),
          Text('演职人员',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
              .intoPadding(padding: EdgeInsets.only(top: 10)),
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Image.network(
                "http://bj.people.com.cn//NMediaFile/2020/0313/LOCAL202003131750545452283166310.jpg",
                width: 85,
                height: 105,
              ),
              Image.network(
                "http://bj.people.com.cn//NMediaFile/2020/0313/LOCAL202003131750545452283166310.jpg",
                width: 85,
                height: 105,
              ),
              Image.network(
                "http://bj.people.com.cn//NMediaFile/2020/0313/LOCAL202003131750545452283166310.jpg",
                width: 85,
                height: 105,
              ),
              Image.network(
                "http://bj.people.com.cn//NMediaFile/2020/0313/LOCAL202003131750545452283166310.jpg",
                width: 85,
                height: 105,
              ),
            ],
          ).intoContainer(height: 110)
        ],
      ),
    );
  }
}
