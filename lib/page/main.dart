import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/SearchPage.dart';
import 'HomePage.dart';

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'oeschinen lake campground',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41')
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    Widget bottomSction = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps.Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: "波波奶茶",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: new ListView(
          children: <Widget>[
            Image.asset(
              'assets/top_bg.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            bottomSction,
            textSection
          ],
        ),
      ),
    );
  }
}

void main() {
//  runApp(new TabbedAppBarSample());
  runApp(new BottomWidget());
}

class BottomWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomState();
  }
}

class BottomState extends State<BottomWidget> {
//  final pages = [PagerApp(), HomePage("发现"), HomePage("我的")];

  List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: new Icon(Icons.home),
        title: new Text("首页")),
    BottomNavigationBarItem(
        backgroundColor: Colors.deepOrange,
        icon: new Icon(Icons.add_to_queue),
        title: new Text("发现")),
    BottomNavigationBarItem(
        backgroundColor: Colors.green,
        icon: new Icon(Icons.account_circle),
        title: new Text("我的"))
  ];

  int currentIndex = 0;
  var _body;
  void _pageChange(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  void _initData() {
    _body = new IndexedStack(
      children: <Widget>[PagerApp(), HomePage("发现"), HomePage("我的")],
      index: currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return MaterialApp(
      home: Scaffold(
          appBar:AppBar(
            title: Text('bottom'),
            actions: <Widget>[
              MainIcon()
            ],
          ),
          body: _body,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            items: _bottomItems,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _pageChange(index);
            },
          )),
    );
  }

}

class MainIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  IconButton(icon: Icon(Icons.search),onPressed:(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=> SearchRoute()) );
    },);
  }
}



//class MainScaffold extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar:AppBar(
//          title: Text('bottom'),
//          actions: <Widget>[
//            IconButton(icon: Icon(Icons.search),onPressed:(){
//              Navigator.push(context,MaterialPageRoute(builder: (context)=> SearchRoute()) );
//            },)
//          ],
//        ),
//        body: _body,
//        bottomNavigationBar: BottomNavigationBar(
//          currentIndex: currentIndex,
//          items: _bottomItems,
//          type: BottomNavigationBarType.fixed,
//          onTap: (index) {
//            _pageChange(index);
//          },
//        ));
//  }
//
//}





class HomePage extends StatelessWidget {
  String title;

  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
