class MovieBean {
    HotPlayMovies hotPlayMovies;
    Mobilemoviecoming mobilemoviecoming;
    MovieBean({this.hotPlayMovies, this.mobilemoviecoming});

    factory MovieBean.fromJson(Map<String, dynamic> json) {
        return MovieBean(
            hotPlayMovies: json['hotPlayMovies'] != null ? HotPlayMovies.fromJson(json['hotPlayMovies']) : null,
            mobilemoviecoming: json['mobilemoviecoming'] != null ? Mobilemoviecoming.fromJson(json['mobilemoviecoming']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.hotPlayMovies != null) {
            data['hotPlayMovies'] = this.hotPlayMovies.toJson();
        }
        if (this.mobilemoviecoming != null) {
            data['mobilemoviecoming'] = this.mobilemoviecoming.toJson();
        }
        return data;
    }
}

class HotPlayMovies {
    int count;
    List<Movy> movies;
    int totalCinemaCount;
    int totalComingMovie;
    int totalHotMovie;

    HotPlayMovies({this.count, this.movies, this.totalCinemaCount, this.totalComingMovie, this.totalHotMovie});

    factory HotPlayMovies.fromJson(Map<String, dynamic> json) {
        return HotPlayMovies(
            count: json['count'],
            movies: json['movies'] != null ? (json['movies'] as List).map((i) => Movy.fromJson(i)).toList() : null,
            totalCinemaCount: json['totalCinemaCount'],
            totalComingMovie: json['totalComingMovie'],
            totalHotMovie: json['totalHotMovie'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['totalCinemaCount'] = this.totalCinemaCount;
        data['totalComingMovie'] = this.totalComingMovie;
        data['totalHotMovie'] = this.totalHotMovie;
        if (this.movies != null) {
            data['movies'] = this.movies.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Movy {
    String actorName1;
    String actorName2;
    String btnText;
    String commonSpecial;
    String directorName;
    String img;
    bool is3D;
    bool isDMAX;
    bool isFilter;
    bool isHot;
    bool isIMAX;
    bool isIMAX3D;
    bool isNew;
    int length;
    String movieId;
    NearestShowtime nearestShowtime;
    bool preferentialFlag;
    int rDay;
    int rMonth;
    int rYear;
    String ratingFinal;
    String titleCn;
    String titleEn;
    String type;
    int wantedCount;

    Movy({this.actorName1, this.actorName2, this.btnText, this.commonSpecial, this.directorName, this.img, this.is3D, this.isDMAX, this.isFilter, this.isHot, this.isIMAX, this.isIMAX3D, this.isNew, this.length, this.movieId, this.nearestShowtime, this.preferentialFlag, this.rDay, this.rMonth, this.rYear, this.ratingFinal, this.titleCn, this.titleEn, this.type, this.wantedCount});

    factory Movy.fromJson(Map<String, dynamic> json) {
        return Movy(
            actorName1: json['actorName1'],
            actorName2: json['actorName2'],
            btnText: json['btnText'],
            commonSpecial: json['commonSpecial'],
            directorName: json['directorName'],
            img: json['img'],
            is3D: json['is3D'],
            isDMAX: json['isDMAX'],
            isFilter: json['isFilter'],
            isHot: json['isHot'],
            isIMAX: json['isIMAX'],
            isIMAX3D: json['isIMAX3D'],
            isNew: json['isNew'],
            length: json['length'],
            movieId: json['movieId'].toString(),
            nearestShowtime: json['nearestShowtime'] != null ? NearestShowtime.fromJson(json['nearestShowtime']) : null,
            preferentialFlag: json['preferentialFlag'],
            rDay: json['rDay'],
            rMonth: json['rMonth'],
            rYear: json['rYear'],
            ratingFinal: json['ratingFinal'].toString(),
            titleCn: json['titleCn'],
            titleEn: json['titleEn'],
            type: json['type'],
            wantedCount: json['wantedCount'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['actorName1'] = this.actorName1;
        data['actorName2'] = this.actorName2;
        data['btnText'] = this.btnText;
        data['commonSpecial'] = this.commonSpecial;
        data['directorName'] = this.directorName;
        data['img'] = this.img;
        data['is3D'] = this.is3D;
        data['isDMAX'] = this.isDMAX;
        data['isFilter'] = this.isFilter;
        data['isHot'] = this.isHot;
        data['isIMAX'] = this.isIMAX;
        data['isIMAX3D'] = this.isIMAX3D;
        data['isNew'] = this.isNew;
        data['length'] = this.length;
        data['movieId'] = this.movieId;
        data['preferentialFlag'] = this.preferentialFlag;
        data['rDay'] = this.rDay;
        data['rMonth'] = this.rMonth;
        data['rYear'] = this.rYear;
        data['ratingFinal'] = this.ratingFinal;
        data['titleCn'] = this.titleCn;
        data['titleEn'] = this.titleEn;
        data['type'] = this.type;
        data['wantedCount'] = this.wantedCount;
        if (this.nearestShowtime != null) {
            data['nearestShowtime'] = this.nearestShowtime.toJson();
        }
        return data;
    }
}

class NearestShowtime {
    bool isTicket;
    int nearestCinemaCount;
    int nearestShowDay;
    int nearestShowtimeCount;

    NearestShowtime({this.isTicket, this.nearestCinemaCount, this.nearestShowDay, this.nearestShowtimeCount});

    factory NearestShowtime.fromJson(Map<String, dynamic> json) {
        return NearestShowtime(
            isTicket: json['isTicket'],
            nearestCinemaCount: json['nearestCinemaCount'],
            nearestShowDay: json['nearestShowDay'],
            nearestShowtimeCount: json['nearestShowtimeCount'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['isTicket'] = this.isTicket;
        data['nearestCinemaCount'] = this.nearestCinemaCount;
        data['nearestShowDay'] = this.nearestShowDay;
        data['nearestShowtimeCount'] = this.nearestShowtimeCount;
        return data;
    }
}


class Mobilemoviecoming {
    List<Moviecoming> moviecomings;

    Mobilemoviecoming({this.moviecomings});

    factory Mobilemoviecoming.fromJson(Map<String, dynamic> json) {
        return Mobilemoviecoming(
            moviecomings: json['moviecomings'] != null ? (json['moviecomings'] as List).map((i) => Moviecoming.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.moviecomings != null) {
            data['moviecomings'] = this.moviecomings.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Moviecoming {
    String actors;
    String image;
    bool isFilter;
    bool isTicket;
    bool isVideo;
    bool isWantSee;
    int movieId;
    int rDay;
    int rMonth;
    int rYear;
    String releaseDate;
    String title;
    String type;
    int wantedCount;

    Moviecoming({this.actors, this.image, this.isFilter, this.isTicket, this.isVideo, this.isWantSee, this.movieId, this.rDay, this.rMonth, this.rYear, this.releaseDate, this.title, this.type, this.wantedCount});

    factory Moviecoming.fromJson(Map<String, dynamic> json) {
        return Moviecoming(
            actors: json['actors'],
            image: json['image'],
            isFilter: json['isFilter'],
            isTicket: json['isTicket'],
            isVideo: json['isVideo'],
            isWantSee: json['isWantSee'],
            movieId: json['movieId'],
            rDay: json['rDay'],
            rMonth: json['rMonth'],
            rYear: json['rYear'],
            releaseDate: json['releaseDate'],
            title: json['title'],
            type: json['type'],
            wantedCount: json['wantedCount'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['actors'] = this.actors;
        data['image'] = this.image;
        data['isFilter'] = this.isFilter;
        data['isTicket'] = this.isTicket;
        data['isVideo'] = this.isVideo;
        data['isWantSee'] = this.isWantSee;
        data['movieId'] = this.movieId;
        data['rDay'] = this.rDay;
        data['rMonth'] = this.rMonth;
        data['rYear'] = this.rYear;
        data['releaseDate'] = this.releaseDate;
        data['title'] = this.title;
        data['type'] = this.type;
        data['wantedCount'] = this.wantedCount;
        return data;
    }
}