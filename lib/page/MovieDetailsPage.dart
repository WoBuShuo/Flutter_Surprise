import 'package:widget_chain/widget_chain.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MovieDetailsState();
  }
}

class MovieDetailsState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('看看'),),
      body: ListView(
        children: <Widget>[
          headItem(),
        ],
      ),
    );
  }

  Padding headItem(){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.network("http://bj.people.com.cn//NMediaFile/2020/0313/LOCAL202003131750545452283166310.jpg",height: 150,width:110 ,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('叶问',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                      Text('动作/历史/剧情').intoContainer(margin: EdgeInsets.only(top: 10)),
                      Text('甄子丹过招美军',style: TextStyle(color: Colors.black54,
                          fontSize: 20,fontWeight: FontWeight.bold),).intoContainer(margin: EdgeInsets.only(top: 10))
                    ],
                  ).intoContainer(margin: EdgeInsets.all(10))
                      .intoExpanded() ,
            ],
          ),
          Row(
            children: <Widget>[
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: '时光评分',style: TextStyle(color:Colors.cyan )),
                  TextSpan(text: '7.7',style: TextStyle(color:Colors.cyan ,fontWeight: FontWeight.bold,fontSize: 30))
                ]
              )),

//              ActionChip(
//                label: Text(''),
//              ).intoContainer(height: 30).intoExpanded(),
              FlatButton.icon(label: Text('俊俊'),icon: Icon(Icons.print),
                color:Colors.grey ,
                shape: StadiumBorder(),
                onPressed: (){

              },).intoContainer(height: 30,padding:EdgeInsets.only(left: 20)).intoExpanded(),
        FlatButton.icon(label: Text('俊俊'),icon: Icon(Icons.print),
                color:Colors.grey ,
                shape: StadiumBorder(),
                onPressed: (){

              },).intoContainer(height: 30,padding:EdgeInsets.only(left: 20) ).intoExpanded(),

            ],
          ).intoPadding(padding: EdgeInsets.only(top: 13))
        ],
      ) ,
    );

  }


}


