

class MovieCommentaryBean {
    int commentTotalCount;
    String commentTotalCountShow;
    Mini mini;
    Plus plus;

    MovieCommentaryBean({this.commentTotalCount, this.commentTotalCountShow, this.mini, this.plus});

    factory MovieCommentaryBean.fromJson(Map<String, dynamic> json) {
        return MovieCommentaryBean(
            commentTotalCount: json['commentTotalCount'], 
            commentTotalCountShow: json['commentTotalCountShow'], 
            mini: json['mini'] != null ? Mini.fromJson(json['mini']) : null, 
            plus: json['plus'] != null ? Plus.fromJson(json['plus']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['commentTotalCount'] = this.commentTotalCount;
        data['commentTotalCountShow'] = this.commentTotalCountShow;
        if (this.mini != null) {
            data['mini'] = this.mini.toJson();
        }
        if (this.plus != null) {
            data['plus'] = this.plus.toJson();
        }
        return data;
    }
}
class Plus {
    bool clientPublish;
    List<PlusItem> list;
    int total;

    Plus({this.clientPublish, this.list, this.total});

    factory Plus.fromJson(Map<String, dynamic> json) {
        return Plus(
            clientPublish: json['clientPublish'],
            list: json['list'] != null ? (json['list'] as List).map((i) => PlusItem.fromJson(i)).toList() : null,
            total: json['total'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['clientPublish'] = this.clientPublish;
        data['total'] = this.total;
        if (this.list != null) {
            data['list'] = this.list.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Mini {
    List<MiniItem> list;
    int total;

    Mini({this.list, this.total});

    factory Mini.fromJson(Map<String, dynamic> json) {
        return Mini(
            list: json['list'] != null ? (json['list'] as List).map((i) => MiniItem.fromJson(i)).toList() : null,
            total: json['total'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['total'] = this.total;
        if (this.list != null) {
            data['list'] = this.list.map((v) => v.toJson()).toList();
        }
        return data;
    }
}


class MiniItem {
    int commentDate;
    int commentId;
    String content;
    String headImg;
    String img;
    bool isHot;
    bool isPraise;
    String locationName;
    String nickname;
    int praiseCount;
    String rating;
    int replyCount;

    MiniItem({this.commentDate, this.commentId, this.content, this.headImg, this.img, this.isHot, this.isPraise, this.locationName, this.nickname, this.praiseCount, this.rating, this.replyCount});

    factory MiniItem.fromJson(Map<String, dynamic> json) {
        return MiniItem(
            commentDate: json['commentDate'],
            commentId: json['commentId'],
            content: json['content'],
            headImg: json['headImg'],
            img: json['img'],
            isHot: json['isHot'],
            isPraise: json['isPraise'],
            locationName: json['locationName'],
            nickname: json['nickname'],
            praiseCount: json['praiseCount'],
            rating: json['rating'].toString(),
            replyCount: json['replyCount'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['commentDate'] = this.commentDate;
        data['commentId'] = this.commentId;
        data['content'] = this.content;
        data['headImg'] = this.headImg;
        data['img'] = this.img;
        data['isHot'] = this.isHot;
        data['isPraise'] = this.isPraise;
        data['locationName'] = this.locationName;
        data['nickname'] = this.nickname;
        data['praiseCount'] = this.praiseCount;
        data['rating'] = this.rating;
        data['replyCount'] = this.replyCount;
        return data;
    }
}

class PlusItem {
    int commentDate;
    int commentId;
    String content;
    String headImg;
    bool isWantSee;
    String locationName;
    String nickname;
    String rating;
    int replyCount;
    String title;
    int userId;

    PlusItem({this.commentDate, this.commentId, this.content, this.headImg, this.isWantSee, this.locationName, this.nickname, this.rating, this.replyCount, this.title, this.userId});

    factory PlusItem.fromJson(Map<String, dynamic> json) {
        return PlusItem(
            commentDate: json['commentDate'],
            commentId: json['commentId'],
            content: json['content'],
            headImg: json['headImg'],
            isWantSee: json['isWantSee'],
            locationName: json['locationName'],
            nickname: json['nickname'],
            rating: json['rating'].toString(),
            replyCount: json['replyCount'],
            title: json['title'],
            userId: json['userId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['commentDate'] = this.commentDate;
        data['commentId'] = this.commentId;
        data['content'] = this.content;
        data['headImg'] = this.headImg;
        data['isWantSee'] = this.isWantSee;
        data['locationName'] = this.locationName;
        data['nickname'] = this.nickname;
        data['rating'] = this.rating;
        data['replyCount'] = this.replyCount;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}