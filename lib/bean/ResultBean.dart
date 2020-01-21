
import 'package:flutter_app/bean/BaseBean.dart';

class ResultBean<T extends BaseBean > {
    List<T> data;
    int errorCode;
    String errorMsg;

    ResultBean({this.data, this.errorCode, this.errorMsg});

    factory ResultBean.fromJson(Map<String, dynamic> json) {
        return ResultBean(
            data: json['data'] != null ? (json['data'] as List).map((i) =>i.fromJson(i)).toList() : null,
            errorCode: json['errorCode'], 
            errorMsg: json['errorMsg'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['errorCode'] = this.errorCode;
        data['errorMsg'] = this.errorMsg;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}