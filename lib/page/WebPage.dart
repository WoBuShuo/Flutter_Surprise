import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage  extends StatelessWidget{
  String title;
  String url;
  WebPage(this.title,this.url);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text(title),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }




}