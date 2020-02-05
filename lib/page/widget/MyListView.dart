import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  ScrollController scrollController;

  List<Widget> listChild;

  State _state = State.complete;

  MyListView(this.listChild, {this.scrollController, loadMoreListener()}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_state == State.complete) {
          loadMoreListener();
          _state = State.loading;
        }
      }
    });
    if (listChild != null && listChild.length > 0) {
      listChild.add(LoadMoreView());
    }
  }

  void addData(List<Widget> data) {
    listChild.removeAt(listChild.length - 1);
    listChild.addAll(data);
    listChild.add(LoadMoreView());
  }

  void loadComplete() {
    _state = State.complete;
  }

  void loadEnd() {
    _state = State.end;
    if (listChild != null && listChild.length > 0) {
      listChild.removeAt(listChild.length - 1);
      listChild.add(LoadEndView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: listChild,
    );
  }
}

enum State { loading, complete, end }

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

class LoadEndView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
//      child: Padding(
//        padding: EdgeInsets.only(top: 10,bottom: 10),
        child: Center(
          child: Text('没有更多数据'),
        ) ,
//      )
    );
  }
}

