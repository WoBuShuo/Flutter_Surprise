class MovieDetailsBean {
    Basic basic;
    BoxOffice boxOffice;
    String playState;
    List<Playlist> playlist;

    MovieDetailsBean({this.basic, this.boxOffice, this.playState, this.playlist});

    factory MovieDetailsBean.fromJson(Map<String, dynamic> json) {
        return MovieDetailsBean(
            basic: json['basic'] != null ? Basic.fromJson(json['basic']) : null,
            boxOffice: json['boxOffice'] != null ? BoxOffice.fromJson(json['boxOffice']) : null,
            playState: json['playState'],
            playlist: json['playlist'] != null ? (json['playlist'] as List).map((i) => Playlist.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['playState'] = this.playState;
        if (this.basic != null) {
            data['basic'] = this.basic.toJson();
        }
        if (this.boxOffice != null) {
            data['boxOffice'] = this.boxOffice.toJson();
        }
        if (this.playlist != null) {
            data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Playlist {
    bool isOpenByBrowser;
    String payRule;
    String picUrl;
    String playSourceName;
    String playUrl;
    String playUrlH5;
    String playUrlPC;
    String sourceId;

    Playlist({this.isOpenByBrowser, this.payRule, this.picUrl, this.playSourceName, this.playUrl, this.playUrlH5, this.playUrlPC, this.sourceId});

    factory Playlist.fromJson(Map<String, dynamic> json) {
        return Playlist(
            isOpenByBrowser: json['isOpenByBrowser'],
            payRule: json['payRule'],
            picUrl: json['picUrl'],
            playSourceName: json['playSourceName'],
            playUrl: json['playUrl'],
            playUrlH5: json['playUrlH5'],
            playUrlPC: json['playUrlPC'],
            sourceId: json['sourceId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['isOpenByBrowser'] = this.isOpenByBrowser;
        data['payRule'] = this.payRule;
        data['picUrl'] = this.picUrl;
        data['playSourceName'] = this.playSourceName;
        data['playUrl'] = this.playUrl;
        data['playUrlH5'] = this.playUrlH5;
        data['playUrlPC'] = this.playUrlPC;
        data['sourceId'] = this.sourceId;
        return data;
    }
}

class BoxOffice {
    int movieId;
    int ranking;
    int todayBox;
    String todayBoxDes;
    String todayBoxDesUnit;
    int totalBox;
    String totalBoxDes;
    String totalBoxUnit;

    BoxOffice({this.movieId, this.ranking, this.todayBox, this.todayBoxDes, this.todayBoxDesUnit, this.totalBox, this.totalBoxDes, this.totalBoxUnit});

    factory BoxOffice.fromJson(Map<String, dynamic> json) {
        return BoxOffice(
            movieId: json['movieId'],
            ranking: json['ranking'],
            todayBox: json['todayBox'],
            todayBoxDes: json['todayBoxDes'],
            todayBoxDesUnit: json['todayBoxDesUnit'],
            totalBox: json['totalBox'],
            totalBoxDes: json['totalBoxDes'],
            totalBoxUnit: json['totalBoxUnit'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['movieId'] = this.movieId;
        data['ranking'] = this.ranking;
        data['todayBox'] = this.todayBox;
        data['todayBoxDes'] = this.todayBoxDes;
        data['todayBoxDesUnit'] = this.todayBoxDesUnit;
        data['totalBox'] = this.totalBox;
        data['totalBoxDes'] = this.totalBoxDes;
        data['totalBoxUnit'] = this.totalBoxUnit;
        return data;
    }
}

class Basic {
    List<Actor> actors;
    Actor director;
    int attitude;
    String bigImage;
    String broadcastDes;
    String commentSpecial;
    String eggDesc;
    String episodeCnt;
    int hasSeenCount;
    String hasSeenCountShow;
    int hotRanking;
    String img;
    bool is3D;
    bool isDMAX;
    bool isEggHunt;
    int isFavorite;
    bool isFilter;
    bool isIMAX;
    bool isIMAX3D;
    bool isTicket;
    String message;
    String mins;
    int movieId;
    int movieStatus;
    String name;
    String nameEn;
    int overallRating;
    int personCount;
    int ratingCount;
    String ratingCountShow;
    String releaseArea;
    String releaseDate;
    bool sensitiveStatus;
    int showCinemaCount;
    int showDay;
    int showtimeCount;
    StageImg stageImg;
    String story;
    String summary;
    int totalNominateAward;
    int totalWinAward;
    List<String> type;
    String url;
    String userComment;
    int userCommentId;
    String userImg;
    String userName;
    int userRating;
    Video video;
    int wantToSeeCount;
    String wantToSeeCountShow;
    String wantToSeeNumberShow;
    String year;


    Basic({this.actors, this.director,this.attitude, this.bigImage, this.broadcastDes, this.commentSpecial, this.eggDesc, this.episodeCnt, this.hasSeenCount, this.hasSeenCountShow, this.hotRanking, this.img, this.is3D, this.isDMAX, this.isEggHunt, this.isFavorite, this.isFilter, this.isIMAX, this.isIMAX3D, this.isTicket, this.message, this.mins, this.movieId, this.movieStatus, this.name, this.nameEn, this.overallRating, this.personCount, this.ratingCount, this.ratingCountShow, this.releaseArea, this.releaseDate, this.sensitiveStatus, this.showCinemaCount, this.showDay, this.showtimeCount, this.stageImg, this.story, this.summary, this.totalNominateAward, this.totalWinAward, this.type, this.url, this.userComment, this.userCommentId, this.userImg, this.userName, this.userRating, this.video, this.wantToSeeCount, this.wantToSeeCountShow, this.wantToSeeNumberShow, this.year});

    factory Basic.fromJson(Map<String, dynamic> json) {
        return Basic(
            actors: json['actors'] != null ? (json['actors'] as List).map((i) => Actor.fromJson(i)).toList() : null,
            director:json['director'],
            attitude: json['attitude'],
            bigImage: json['bigImage'],
            broadcastDes: json['broadcastDes'],
            commentSpecial: json['commentSpecial'],
            eggDesc: json['eggDesc'],
            episodeCnt: json['episodeCnt'],
            hasSeenCount: json['hasSeenCount'],
            hasSeenCountShow: json['hasSeenCountShow'],
            hotRanking: json['hotRanking'],
            img: json['img'],
            is3D: json['is3D'],
            isDMAX: json['isDMAX'],
            isEggHunt: json['isEggHunt'],
            isFavorite: json['isFavorite'],
            isFilter: json['isFilter'],
            isIMAX: json['isIMAX'],
            isIMAX3D: json['isIMAX3D'],
            isTicket: json['isTicket'],
            message: json['message'],
            mins: json['mins'],
            movieId: json['movieId'],
            movieStatus: json['movieStatus'],
            name: json['name'],
            nameEn: json['nameEn'],
            overallRating: json['overallRating'],
            personCount: json['personCount'],
            ratingCount: json['ratingCount'],
            ratingCountShow: json['ratingCountShow'],
            releaseArea: json['releaseArea'],
            releaseDate: json['releaseDate'],
            sensitiveStatus: json['sensitiveStatus'],
            showCinemaCount: json['showCinemaCount'],
            showDay: json['showDay'],
            showtimeCount: json['showtimeCount'],
            stageImg: json['stageImg'] != null ? StageImg.fromJson(json['stageImg']) : null,
            story: json['story'],
            summary: json['summary'],
            totalNominateAward: json['totalNominateAward'],
            totalWinAward: json['totalWinAward'],
            type: json['type'] != null ? new List<String>.from(json['type']) : null,
            url: json['url'],
            userComment: json['userComment'],
            userCommentId: json['userCommentId'],
            userImg: json['userImg'],
            userName: json['userName'],
            userRating: json['userRating'],
            video: json['video'] != null ? Video.fromJson(json['video']) : null,
            wantToSeeCount: json['wantToSeeCount'],
            wantToSeeCountShow: json['wantToSeeCountShow'],
            wantToSeeNumberShow: json['wantToSeeNumberShow'],
            year: json['year'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['attitude'] = this.attitude;
        data['director']=this.director;
        data['bigImage'] = this.bigImage;
        data['broadcastDes'] = this.broadcastDes;
        data['commentSpecial'] = this.commentSpecial;
        data['eggDesc'] = this.eggDesc;
        data['episodeCnt'] = this.episodeCnt;
        data['hasSeenCount'] = this.hasSeenCount;
        data['hasSeenCountShow'] = this.hasSeenCountShow;
        data['hotRanking'] = this.hotRanking;
        data['img'] = this.img;
        data['is3D'] = this.is3D;
        data['isDMAX'] = this.isDMAX;
        data['isEggHunt'] = this.isEggHunt;
        data['isFavorite'] = this.isFavorite;
        data['isFilter'] = this.isFilter;
        data['isIMAX'] = this.isIMAX;
        data['isIMAX3D'] = this.isIMAX3D;
        data['isTicket'] = this.isTicket;
        data['message'] = this.message;
        data['mins'] = this.mins;
        data['movieId'] = this.movieId;
        data['movieStatus'] = this.movieStatus;
        data['name'] = this.name;
        data['nameEn'] = this.nameEn;
        data['overallRating'] = this.overallRating;
        data['personCount'] = this.personCount;
        data['ratingCount'] = this.ratingCount;
        data['ratingCountShow'] = this.ratingCountShow;
        data['releaseArea'] = this.releaseArea;
        data['releaseDate'] = this.releaseDate;
        data['sensitiveStatus'] = this.sensitiveStatus;
        data['showCinemaCount'] = this.showCinemaCount;
        data['showDay'] = this.showDay;
        data['showtimeCount'] = this.showtimeCount;
        data['story'] = this.story;
        data['summary'] = this.summary;
        data['totalNominateAward'] = this.totalNominateAward;
        data['totalWinAward'] = this.totalWinAward;
        data['url'] = this.url;
        data['userComment'] = this.userComment;
        data['userCommentId'] = this.userCommentId;
        data['userImg'] = this.userImg;
        data['userName'] = this.userName;
        data['userRating'] = this.userRating;
        data['wantToSeeCount'] = this.wantToSeeCount;
        data['wantToSeeCountShow'] = this.wantToSeeCountShow;
        data['wantToSeeNumberShow'] = this.wantToSeeNumberShow;
        data['year'] = this.year;
        if (this.actors != null) {
            data['actors'] = this.actors.map((v) => v.toJson()).toList();
        }
        if (this.stageImg != null) {
            data['stageImg'] = this.stageImg.toJson();
        }
        if (this.type != null) {
            data['type'] = this.type;
        }
        if (this.video != null) {
            data['video'] = this.video.toJson();
        }
        return data;
    }
}

class Video {
    int count;
    String hightUrl;
    String img;
    String title;
    String url;
    int videoId;
    int videoSourceType;

    Video({this.count, this.hightUrl, this.img, this.title, this.url, this.videoId, this.videoSourceType});

    factory Video.fromJson(Map<String, dynamic> json) {
        return Video(
            count: json['count'],
            hightUrl: json['hightUrl'],
            img: json['img'],
            title: json['title'],
            url: json['url'],
            videoId: json['videoId'],
            videoSourceType: json['videoSourceType'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['hightUrl'] = this.hightUrl;
        data['img'] = this.img;
        data['title'] = this.title;
        data['url'] = this.url;
        data['videoId'] = this.videoId;
        data['videoSourceType'] = this.videoSourceType;
        return data;
    }
}

class StageImg {
    int count;
    List<X> list;

    StageImg({this.count, this.list});

    factory StageImg.fromJson(Map<String, dynamic> json) {
        return StageImg(
            count: json['count'],
            list: json['list'] != null ? (json['list'] as List).map((i) => X.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        if (this.list != null) {
            data['list'] = this.list.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class X {
    int imgId;
    String imgUrl;

    X({this.imgId, this.imgUrl});

    factory X.fromJson(Map<String, dynamic> json) {
        return X(
            imgId: json['imgId'],
            imgUrl: json['imgUrl'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['imgId'] = this.imgId;
        data['imgUrl'] = this.imgUrl;
        return data;
    }
}

class Actor {
    int actorId;
    String img;
    String name;
    String nameEn;
    String roleImg;
    String roleName;

    Actor({this.actorId, this.img, this.name, this.nameEn, this.roleImg, this.roleName});

    factory Actor.fromJson(Map<String, dynamic> json) {
        return Actor(
            actorId: json['actorId'],
            img: json['img'],
            name: json['name'],
            nameEn: json['nameEn'],
            roleImg: json['roleImg'],
            roleName: json['roleName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['actorId'] = this.actorId;
        data['img'] = this.img;
        data['name'] = this.name;
        data['nameEn'] = this.nameEn;
        data['roleImg'] = this.roleImg;
        data['roleName'] = this.roleName;
        return data;
    }
}