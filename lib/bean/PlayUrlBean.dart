

class PlayUrlBean {
    List<PlayUrlAndSize> playUrlAndSizeList;

    PlayUrlBean({this.playUrlAndSizeList});

    factory PlayUrlBean.fromJson(Map<String, dynamic> json) {
        return PlayUrlBean(
            playUrlAndSizeList: json['playUrlAndSizeList'] != null ? (json['playUrlAndSizeList'] as List).map((i) => PlayUrlAndSize.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.playUrlAndSizeList != null) {
            data['playUrlAndSizeList'] = this.playUrlAndSizeList.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class PlayUrlAndSize {
    int fileSize;
    String name;
    String url;

    PlayUrlAndSize({this.fileSize, this.name, this.url});

    factory PlayUrlAndSize.fromJson(Map<String, dynamic> json) {
        return PlayUrlAndSize(
            fileSize: json['fileSize'],
            name: json['name'],
            url: json['url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['fileSize'] = this.fileSize;
        data['name'] = this.name;
        data['url'] = this.url;
        return data;
    }
}
