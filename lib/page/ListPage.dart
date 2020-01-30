import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/SearchBean.dart';
import 'package:flutter_app/net/HttpManager.dart';
import 'package:flutter_app/page/HomePage.dart';

class ListPage extends StatefulWidget{

  String searchkey;

  ListPage(this.searchkey);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListState(searchkey);
  }

}
class ListState extends State<ListPage>{

  String searchkey;

  ListState(this.searchkey);

  List<Widget> dataList=new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchResult();
  }

  void getSearchResult() async{
    SearchBean data=await HttpManager.getInstance().searchList(searchkey);

    setState(() {

      for(int i=0; i<data.datas.length;i++){
        dataList.add(ListItem(data.datas[i].title,data.datas[i].link,data.datas[i].shareUser,data.datas[i].link));
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('搜索'),automaticallyImplyLeading: true,),
        body:ListView(
          children:dataList.toList(),
        ) ,
    );
  }

}



