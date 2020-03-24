

class TidbitsBean {
    String movieTitle;
    int pageCount;
    List<Video> videoList;

    TidbitsBean({this.movieTitle, this.pageCount, this.videoList});

    factory TidbitsBean.fromJson(Map<String, dynamic> json) {
        return TidbitsBean(
            movieTitle: json['movieTitle'],
            pageCount: json['pageCount'],
            videoList: json['videoList'] != null ? (json['videoList'] as List).map((i) => Video.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['movieTitle'] = this.movieTitle;
        data['pageCount'] = this.pageCount;
        if (this.videoList != null) {
            data['videoList'] = this.videoList.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Video {
    String commentTotal;
    String image;
    bool isSensitive;
    int length;
    String playCount;
    int pulishTime;
    String recommendID;
    String recommendType;
    String title;
    int type;
    int vId;
    int videoSource;

    Video({this.commentTotal, this.image, this.isSensitive, this.length, this.playCount, this.pulishTime, this.recommendID, this.recommendType, this.title, this.type, this.vId, this.videoSource});

    factory Video.fromJson(Map<String, dynamic> json) {
        return Video(
            commentTotal: json['commentTotal'],
            image: json['image'],
            isSensitive: json['isSensitive'],
            length: json['length'],
            playCount: json['playCount'],
            pulishTime: json['pulishTime'],
            recommendID: json['recommendID'],
            recommendType: json['recommendType'],
            title: json['title'],
            type: json['type'],
            vId: json['vId'],
            videoSource: json['videoSource'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['commentTotal'] = this.commentTotal;
        data['image'] = this.image;
        data['isSensitive'] = this.isSensitive;
        data['length'] = this.length;
        data['playCount'] = this.playCount;
        data['pulishTime'] = this.pulishTime;
        data['recommendID'] = this.recommendID;
        data['recommendType'] = this.recommendType;
        data['title'] = this.title;
        data['type'] = this.type;
        data['vId'] = this.vId;
        data['videoSource'] = this.videoSource;
        return data;
    }
}