import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/MoviePlayCommentBean.dart';
import 'package:flutter_app/bean/PlayUrlBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';
import 'package:flutter_app/util/RelativeDateFormat.dart';
import 'package:video_player/video_player.dart';
import 'package:widget_chain/widget_chain.dart';
class VideoPage extends StatefulWidget {
  String _videoUrl;
  String _title;

  VideoPage(this._videoUrl,this._title);

  @override
  State<StatefulWidget> createState() {
    return VideoState(_videoUrl,_title);
  }
}

class VideoState extends State<VideoPage> {
  VideoPlayerController _controller;
  String _videoUrl;
  String _title;
  MoviePlayCommentBean _commentBean;


  VideoState(this._videoUrl,this._title);

  List<Widget> _listViewItemList=List();

  @override
  void initState() {
    super.initState();
    SecondHttpManager.getInstance().getMovieUrl(_videoUrl, onSuccess: (data) {
      PlayUrlBean bean=data as PlayUrlBean;
      _controller = VideoPlayerController.network(bean.playUrlAndSizeList[0].url)
        ..initialize().then((_) {
          setState(() {});
        });
      _listViewItemList.add(Container(
        height: 250,
        child: _controller.value.initialized
            ? AspectRatio(aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),) : Container(),
      ));
    });

    SecondHttpManager.getInstance().moviePlayComment(_videoUrl,onSuccess: (data){
      _commentBean=data as MoviePlayCommentBean;
      print("返回数据："+_commentBean.totalCount.toString());

      setState(() {
        List<Widget> list= shortCommentary();
        for(int i=0;i<list.length;i++){
          _listViewItemList.add(list[i]);
        }
      });

    });

  }


//  void addListData(){
//
//    _listViewItemList.add(Container(
//      height: 250,
//      child: _controller.value.initialized
//          ? AspectRatio(aspectRatio: _controller.value.aspectRatio,
//        child: VideoPlayer(_controller),) : Container(),
//    ));
//
//  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: ListView(
        children:_listViewItemList.toList() ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if(_controller!=null){
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            }


          });
        },
        child:
            Icon(_controller==null?Icons.pause:_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }


  ///短评
  List<Widget> shortCommentary() {
    List<Widget> list = new List();
    for (int i = 0; i < _commentBean.list.length; i++) {
      CommentItem item = _commentBean.list[i];
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
                    text: " • " + RelativeDateFormat.format(item.enterTime),
                    style: TextStyle(color: Colors.grey))
              ])).intoPadding(padding: EdgeInsets.only(left: 10))
//              Text(item.nickname+" • "+RelativeDateFormat.format(item.commentDate)).intoPadding(padding: EdgeInsets.only(left: 13)),
            ],
          ),
          Text(item.content)
              .intoPadding(padding: EdgeInsets.only(left: 30, top: 10)),
          Row(
            children: <Widget>[
              Image.asset("image/common_icon_reply.png", width: 13, height: 13),
              Text(item.replyCount.toString())
                  .intoContainer(margin: EdgeInsets.only(left: 10, right: 15)),
//              Image.asset(
//                "image/common_icon_thumb_up.png",
//                width: 13,
//                height: 13,
//              ),
//              Text(item.praiseCount.toString())
//                  .intoContainer(margin: EdgeInsets.only(left: 10)),
            ],
          ).intoPadding(padding: EdgeInsets.only(left: 30, top: 10)),
          Divider(
            color: Color(0xFFF3F3F3),
          )
        ],
      ).intoContainer(margin: EdgeInsets.only(top: 15)));
    }
    return list;
  }



  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
