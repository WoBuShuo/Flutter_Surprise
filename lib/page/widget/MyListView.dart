import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  ScrollController scrollController;

  List<Widget> listChild;

  Function loadMoreListener;

  ListState listState;

  MyListView(this.listChild, {this.scrollController,this.loadMoreListener}){
    listState=ListState(listChild,scrollController:scrollController,loadMoreListener:loadMoreListener);
  }

  @override
  State<StatefulWidget> createState() {
    return listState;
  }
}

class ListState extends State{

  ScrollController scrollController;

  List<Widget> listChild;

  Function loadMoreListener;

  LoadState _state = LoadState.complete;


  ListState(this.listChild, {this.scrollController,this.loadMoreListener}){
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_state == LoadState.complete) {
          loadMoreListener();
          _state = LoadState.loading;
        }
      }
    });
    if (listChild != null && listChild.length > 0) {
      listChild.add(LoadMoreView());
    }
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      controller: scrollController,
      children: listChild.toList(),
    );
  }

  void addData(List<Widget> data) {
    setState(() {
      if (listChild != null && listChild.length > 0) {
        listChild.removeAt(listChild.length - 1);
      }
      listChild.addAll(data);
      listChild.add(LoadMoreView());
    });
  }

  void loadComplete() {
    _state = LoadState.complete;
  }

  void loadEnd() {
    setState(() {
      _state = LoadState.end;
      if (listChild != null && listChild.length > 0) {
        listChild.removeAt(listChild.length - 1);
        listChild.add(LoadEndView());
      }
    });
  }

}


enum LoadState { loading, complete, end }

// 加载更多的布局
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

//最后一页显示的布局
class LoadEndView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
        child: Center(
          child: Text('没有更多数据'),
        ) ,
    );
  }
}

