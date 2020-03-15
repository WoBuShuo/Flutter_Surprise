import 'package:dio/dio.dart';
import 'package:flutter_app/bean/Banner.dart';
import 'package:flutter_app/bean/HotBean.dart';
import 'package:flutter_app/bean/MovieBean.dart';
import 'package:flutter_app/bean/RecommendBean.dart';
import 'package:flutter_app/bean/SearchBean.dart';

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

  static Future<Map<String, dynamic>> get(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance().dio.get(path, queryParameters: map);
    return processResponse(response);
  }

  static Future post(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance().dio.post(path,
        data: map,
        options: Options(
            contentType: "application/x-www-form-urlencoded",
            headers: {"Content-Type": "application/x-www-form-urlencoded"}));
    return processResponse(response);
  }

  static Future processResponse(Response response) async {
    if (response.statusCode == 200) {
      var data = response.data;
      String code = data["code"];
      String msg = data["msg"];
      if (code == "1") {
        //请求响应成功
        return data;
      }
      throw Exception(msg);
    }
    throw Exception("server error");
  }

  Future<MovieBean> recommendMovie() async {
    var data = await SecondHttpManager.post("top/movies.api?locationId=366", {"k": ""});
    var dataList = data["data"];
    return  MovieBean.fromJson(dataList);
  }

}
