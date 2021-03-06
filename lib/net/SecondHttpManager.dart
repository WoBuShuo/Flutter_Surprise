import 'package:dio/dio.dart';
import 'package:flutter_app/bean/Banner.dart';
import 'package:flutter_app/bean/HotBean.dart';
import 'package:flutter_app/bean/MovieBean.dart';
import 'package:flutter_app/bean/MovieCommentaryBean.dart';
import 'package:flutter_app/bean/MovieMessageBean.dart';
import 'package:flutter_app/bean/MoviePlayCommentBean.dart';
import 'package:flutter_app/bean/PlayUrlBean.dart';
import 'package:flutter_app/bean/RecommendBean.dart';
import 'package:flutter_app/bean/SearchBean.dart';
import 'package:flutter_app/bean/TidbitsBean.dart';

class SecondHttpManager {
  static SecondHttpManager _httpManager;

  static SecondHttpManager getInstance() {
    if (_httpManager == null) {
      _httpManager = SecondHttpManager();
    }
    return _httpManager;
  }

  Dio dio;

  SecondHttpManager() {
    dio = Dio();
    dio.options.baseUrl = "https://ticket-api-m.mtime.cn/";
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 8000;
  }



  void processResponse(String url,
      {Map<String, dynamic> params,
        String method,
        Function onSuccess,
        Function onFailed}) async {
    Response response;
    //默认是post请求
    if (method==null || method == "post") {
      if (params != null && params.isNotEmpty) {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.get(url);
      }
    } else {
      if (params != null && params.isNotEmpty) {
        response = await dio.post(url, data: params);
      } else {
        response = await dio.post(url);
      }
    }

    if (response.statusCode == 200) {
      var data = response.data;
      String code = data["code"].toString();
      String msg = data["msg"];
      if (code == "1") {
        //请求响应成功
        onSuccess(data);
        return
          ;
      }
      throw Exception(msg);
    }
    throw Exception("server error");
  }

  void recommendMovie({Function onSuccess, Function onFailed}) {
    processResponse("top/movies.api?locationId=366",
        onSuccess: (data) {
          var dataList = data["data"];
          MovieBean bean=MovieBean.fromJson(dataList);
          onSuccess(bean);
        }, onFailed: () {

        });
  }


  void movieMessage(String id,{Function onSuccess, Function onFailed}){
    processResponse("movie/detail.api?locationId=366&movieId="+id,
        onSuccess: (data) {
          var dataList = data["data"];
          MovieMessageBean bean=MovieMessageBean.fromJson(dataList);
          onSuccess(bean);
        }, onFailed: () {

        });
  }

  void movieTidbits(String id,{Function onSuccess, Function onFailed}){
    processResponse("movie/category/video.api?type=-1&pageIndex=1&movieId="+id,
        onSuccess: (data) {
          var dataList = data["data"];
          TidbitsBean bean=TidbitsBean.fromJson(dataList);
          onSuccess(bean);
        }, onFailed: () {

        });
  }
  void movieCommentary(String id,{Function onSuccess, Function onFailed}){
    processResponse("movie/hotComment201905.api?movieId="+id,
        onSuccess: (data) {
          var dataList = data["data"];
          MovieCommentaryBean bean=MovieCommentaryBean.fromJson(dataList);
          onSuccess(bean);
        }, onFailed: () {

        });
  }

  void getMovieUrl(String id,{Function onSuccess, Function onFailed}){
      dio.options.baseUrl="https://shortvideo.mtime.cn/";

      processResponse("play/getPlayUrl?videoId="+id+"&scheme=http&source=1",
          onSuccess: (data) {
            var dataList = data["data"];
            PlayUrlBean bean=PlayUrlBean.fromJson(dataList);
            onSuccess(bean);

            dio.options.baseUrl = "https://ticket-api-m.mtime.cn/";
          }, onFailed: () {
            dio.options.baseUrl = "https://ticket-api-m.mtime.cn/";
          });

  }
  void moviePlayComment(String id,{Function onSuccess, Function onFailed}){
    dio.options.baseUrl="https://content-api-m.mtime.cn/";
    processResponse("subject/review/list.api?relatedObjType=41&top=5&relatedObjId="+id,
        onSuccess: (data) {
          var dataList = data["data"];
          MoviePlayCommentBean bean=MoviePlayCommentBean.fromJson(dataList);
          onSuccess(bean);
        }, onFailed: () {

        });
  }

}
