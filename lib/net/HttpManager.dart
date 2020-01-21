import 'package:dio/dio.dart';
import 'package:flutter_app/bean/Banner.dart';
import 'package:flutter_app/bean/RecommendBean.dart';

class HttpManager {
  static HttpManager _httpManager;

  static HttpManager getInstance() {
    if (_httpManager == null) {
      _httpManager = HttpManager();
    }
    return _httpManager;
  }

  Dio dio;

  HttpManager() {
    dio = Dio();
    dio.options.baseUrl = "https://www.wanandroid.com/";
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 8000;
  }

  static Future<Map<String, dynamic>> get(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance().dio.get(path, queryParameters: map);
    return processResponse(response);
  }

  static Future<Map<String, String>> post(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance().dio.post(path,
        data: map,
        options: Options(
            contentType: "application/x-www-form-urlencoded",
            headers: {"Content-Type": "application/x-www-form-urlencoded"}));
    return processResponse(response);
  }

  static Future<Map<String, dynamic>> processResponse(Response response) async {
    if (response.statusCode == 200) {
      var data = response.data;
      int code = data["errorCode"];
      String msg = data["errorMsg"];
      if (code == 0) {
        //请求响应成功
        return data;
      }
      throw Exception(msg);
    }
    throw Exception("server error");
  }

  static Future<List<Banner>> articleList() async {
    var data = await HttpManager.get("banner/json", {"page": "1"});
    List dataList = data["data"];
    return dataList.map((json) => Banner.fromJson(json)).toList();

//    List<dynamic> dataList=data["data"] ;
//    return dataList.map((json){
//      return Banner.fromJson(json);
//    }).toList();
  }

   Future<RecommendBean> recommendList() async {
    var data = await HttpManager.get("article/list/0/json", {"page": "0"});
    var dataList = data["data"];




    return  RecommendBean.fromJson(dataList);
  }


}
