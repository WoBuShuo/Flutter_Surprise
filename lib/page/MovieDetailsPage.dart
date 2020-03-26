import 'package:flutter_app/bean/MovieCommentaryBean.dart';
import 'package:flutter_app/bean/MovieDetailBean.dart';
import 'package:flutter_app/bean/MovieMessageBean.dart';
import 'package:flutter_app/bean/TidbitsBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';
import 'package:flutter_app/util/RelativeDateFormat.dart';
import 'package:widget_chain/widget_chain.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  String movieID;
  String title;

  MovieDetailsPage(this.movieID, this.title);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailsState(movieID, title);
  }
}

class MovieDetailsState extends State<MovieDetailsPage> {
  String movieID;

  String title;
  MovieMessageBean _messageBean;
  TidbitsBean _tidbitsBean;
  MovieCommentaryBean _commentaryBean;

  MovieDetailsState(this.movieID, this.title);

  List<Widget> dataList = List();

  @override
  void initState() {
    super.initState();
    SecondHttpManager.getInstance().movieMessage(movieID, onSuccess: (data) {
      setState(() {
        _messageBean = data as MovieMessageBean;
        addData();
      });
    });
    SecondHttpManager.getInstance().movieTidbits(movieID, onSuccess: (data) {
      setState(() {
        _tidbitsBean = data as TidbitsBean;
        addData();
      });
    });
    SecondHttpManager.getInstance().movieCommentary(movieID, onSuccess: (data) {
      setState(() {
        _commentaryBean = data as MovieCommentaryBean;
        addData();
      });
    });
  }

  void addData() {
    dataList.clear();
    if (_messageBean != null) {
      dataList.add(headItem(_messageBean));
    }

    if (_tidbitsBean != null) {
      dataList.add(subtitleText('预告片与花絮')
          .intoPadding(padding: EdgeInsets.only(top: 10)));
      dataList.add(tidbits());
    }
    if (_commentaryBean != null) {
      dataList.add(
          subtitleText('短评').intoPadding(padding: EdgeInsets.only(top: 10)));
      List<Widget> commentaryList = shortCommentary();
      for (int i = 0; i < commentaryList.length; i++) {
        dataList.add(commentaryList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: dataList.toList(),
      ).intoPadding(padding: EdgeInsets.only(left: 10, right: 10)),
    );
  }

  Widget headItem(MovieMessageBean messageBean) {
    if (messageBean == null) {
      return Padding(padding: EdgeInsets.all(10));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
//              NetworkImage
            Image.network(
              messageBean.basic.img,
              height: 150,
              width: 110,
            ).intoClipRRect(borderRadius: BorderRadius.circular(6)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  messageBean.basic.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  messageBean.basic.nameEn,
                  style: TextStyle(fontSize: 11),
                ).intoContainer(margin: EdgeInsets.only(top: 2)),
                Text(movieType() + "•" + messageBean.basic.mins,
                        style: TextStyle(fontSize: 11))
                    .intoContainer(margin: EdgeInsets.only(top: 9)),
                Text(
                  messageBean.basic.commentSpecial,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
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
                  text: messageBean.basic.overallRating,
                  style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 30))
            ])),
            FlatButton.icon(
              label: Text('看过'),
              icon: new Image.asset(
                'image/icon_bool.png',
                width: 23,
                height: 23,
              ),
              color: Colors.red,
              shape: StadiumBorder(),
              onPressed: () {
                print(AssetImage('image/icon_bool.png'));
              },
            )
                .intoContainer(height: 30, padding: EdgeInsets.only(left: 20))
                .intoExpanded(),
            FlatButton.icon(
              label: Text('想看'),
              icon: Icon(
                Icons.add_box,
              ),
              color: Colors.blue,
              shape: StadiumBorder(),
              onPressed: () {},
            )
                .intoContainer(height: 30, padding: EdgeInsets.only(left: 20))
                .intoExpanded(),
          ],
        ).intoPadding(padding: EdgeInsets.only(top: 13)),
        subtitleText('简介').intoPadding(padding: EdgeInsets.only(top: 10)),
        Text(messageBean.basic.story)
            .intoPadding(padding: EdgeInsets.only(top: 10)),
        subtitleText('演职人员').intoPadding(padding: EdgeInsets.only(top: 10)),
        ListView(
          scrollDirection: Axis.horizontal,
          children: performanceList().toList(),
        ).intoContainer(height: 145, margin: EdgeInsets.only(top: 10))
      ],
    ).intoPadding(padding: EdgeInsets.only(top: 10));
  }

  ///演员列表
  List<Widget> performanceList() {
    List<Widget> list = new List();
    for (int i = 0; i < _messageBean.basic.actors.length; i++) {
      list.add(Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              _messageBean.basic.actors[i].img,
            ).intoClipRRect(borderRadius: BorderRadius.circular(5)),
          ),
          Text(
            _messageBean.basic.actors[i].name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
            ),
          ).intoPadding(padding: EdgeInsets.only(top: 4, left: 2, right: 2)),
          Text(
            _messageBean.basic.actors[i].nameEn,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ).intoPadding(padding: EdgeInsets.only(top: 4, left: 2, right: 2)),
          Text("饰  " + _messageBean.basic.actors[i].roleName,
              style: TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ).intoContainer(width: 80, margin: EdgeInsets.only(right: 4)));
    }
    return list;
  }

  ///拼接电源的类型
  String movieType() {
    StringBuffer type = new StringBuffer();
    for (int i = 0; i < _messageBean.basic.type.length; i++) {
      type.write(_messageBean.basic.type[i]);
      if (i != _messageBean.basic.type.length - 1) {
        type.write("/");
      }
    }
    return type.toString();
  }

  Text subtitleText(String title) {
    return Text(title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14));
  }

  /// 花絮widget
  Widget tidbits() {
    if (_tidbitsBean == null) {
      return Container();
    }

    List<Widget> item = new List();
    for (int i = 0; i < _tidbitsBean.videoList.length; i++) {
      item.add(Stack(
        alignment: Alignment(0, 1),
        children: <Widget>[
          Image.network(
            _tidbitsBean.videoList[i].image,
            fit: BoxFit.cover,
          ),
          Text(
            _tidbitsBean.videoList[i].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(),
          )
        ],
      ).intoContainer(width: 130, margin: EdgeInsets.only(right: 5)));
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: item.toList(),
    ).intoContainer(height: 80, margin: EdgeInsets.only(top: 5));
  }

  List<Widget> shortCommentary() {
    List<Widget> list = new List();
    for (int i = 0; i < _commentaryBean.mini.list.length; i++) {
      MiniItem item = _commentaryBean.mini.list[i];
      list.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
//            Image.network(src)
              CircleAvatar(
                backgroundImage: NetworkImage(item.headImg),
              ).intoContainer(width: 23, height: 23),
              Text.rich(TextSpan(children: [
                TextSpan(text: item.nickname),
                TextSpan(
                    text: " • " + RelativeDateFormat.format(item.commentDate),
                    style: TextStyle(color: Colors.grey))
              ])).intoPadding(padding: EdgeInsets.only(left: 10))
//              Text(item.nickname+" • "+RelativeDateFormat.format(item.commentDate)).intoPadding(padding: EdgeInsets.only(left: 13)),
            ],
          ),
          Text(item.content)
              .intoPadding(padding: EdgeInsets.only(left: 30, top: 10)),
          Row(
            children: <Widget>[
              FlatButton.icon(
                label: Text('0'),
                icon:Icon(Icons.nature),
                shape: StadiumBorder(),
                onPressed: () {
                },

              ),
    FlatButton.icon(
    label: Text('0'),
    icon:ImageIcon( image:Icon(Icons.headset)),
    shape: StadiumBorder(),
    onPressed: () {
    },)
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Color(0xFFF3F3F3),
            margin: EdgeInsets.only(top: 13),
          ),
        ],
      ).intoContainer(margin: EdgeInsets.only(top: 15)));
    }
    return list;
  }
}
