
class MoviePlayCommentBean {
    List<CommentItem> list;
    int totalCount;

    MoviePlayCommentBean({this.list, this.totalCount});

    factory MoviePlayCommentBean.fromJson(Map<String, dynamic> json) {
        return MoviePlayCommentBean(
            list: json['list'] != null ? (json['list'] as List).map((i) => CommentItem.fromJson(i)).toList() : null,
            totalCount: json['totalCount'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['totalCount'] = this.totalCount;
        if (this.list != null) {
            data['list'] = this.list.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class CommentItem {
    int commentId;
    String content;
    int enterTime;
    String headImg;
    String nickname;
    int replyCount;
    int userId;
    int vid;

    CommentItem({this.commentId, this.content, this.enterTime, this.headImg, this.nickname, this.replyCount, this.userId, this.vid});

    factory CommentItem.fromJson(Map<String, dynamic> json) {
        return CommentItem(
            commentId: json['commentId'],
            content: json['content'],
            enterTime: json['enterTime'],
            headImg: json['headImg'],
            nickname: json['nickname'],
            replyCount: json['replyCount'],
            userId: json['userId'],
            vid: json['vid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['commentId'] = this.commentId;
        data['content'] = this.content;
        data['enterTime'] = this.enterTime;
        data['headImg'] = this.headImg;
        data['nickname'] = this.nickname;
        data['replyCount'] = this.replyCount;
        data['userId'] = this.userId;
        data['vid'] = this.vid;
        return data;
    }
}