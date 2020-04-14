class RelativeDateFormat {
  static int ONE_MINUTE = 60000;
  static int ONE_HOUR = 3600000;
  static int ONE_DAY = 86400000;
  static int ONE_WEEK = 604800000;

  static String ONE_SECOND_AGO = "秒前";
  static String ONE_MINUTE_AGO = "分钟前";
  static String ONE_HOUR_AGO = "小时前";
  static String ONE_DAY_AGO = "天前";
  static String ONE_MONTH_AGO = "月前";
  static String ONE_YEAR_AGO = "年前";

  static String format(int time) {
    int now = new DateTime.now().millisecondsSinceEpoch;
    int delta = now - time * 1000;

    if (delta < 1 * ONE_MINUTE) {
      int seconds = toSeconds(delta);
      return (seconds <= 0 ? "1" : seconds).toString() + ONE_SECOND_AGO;
    }
    if (delta < 45 * ONE_MINUTE) {
      int minutes = toMinutes(delta);
      return (minutes <= 0 ? 1 : minutes).toString() + ONE_MINUTE_AGO;
    }
    if (delta < 24 * ONE_HOUR) {
      int hours = toHours(delta);
      return (hours <= 0 ? 1 : hours).toString() + ONE_HOUR_AGO;
    }
    if (delta < 48 * ONE_HOUR) {
      return "昨天";
    }
    if (delta < 30 * ONE_DAY) {
      int days = toDays(delta);
      return (days <= 0 ? 1 : days).toString() + ONE_DAY_AGO;
    }
    //超过一个月就返回当时的日期
    String a= DateTime.fromMillisecondsSinceEpoch(time*1000).toString();
//    print(a.substring(0,a.lastIndexOf(" ")));
    return a.substring(0,a.lastIndexOf(" "));
  }

  static int toSeconds(int date) {
    return date ~/ 1000;
  }

  static int toMinutes(int date) {
    return toSeconds(date) ~/ 60;
  }

  static int toHours(int date) {
    return toMinutes(date) ~/ 60;
  }

  static int toDays(int date) {
    return toHours(date) ~/ 24;
  }

  static int toMonths(int date) {
    return toDays(date) ~/ 30;
  }

  static int toYears(int date) {
    return toMonths(date) ~/ 365;
  }

  ///格式化毫秒级时间戳
  static String formatMillisecond(int time) {
    int now = new DateTime.now().millisecondsSinceEpoch;
    int delta = now - time;

    if (delta < 1 * ONE_MINUTE) {
      int seconds = toSeconds(delta);
      return (seconds <= 0 ? "1" : seconds).toString() + ONE_SECOND_AGO;
    }
    if (delta < 45 * ONE_MINUTE) {
      int minutes = toMinutes(delta);
      return (minutes <= 0 ? 1 : minutes).toString() + ONE_MINUTE_AGO;
    }
    if (delta < 24 * ONE_HOUR) {
      int hours = toHours(delta);
      return (hours <= 0 ? 1 : hours).toString() + ONE_HOUR_AGO;
    }
    if (delta < 48 * ONE_HOUR) {
      return "昨天";
    }
    if (delta < 30 * ONE_DAY) {
      int days = toDays(delta);
      return (days <= 0 ? 1 : days).toString() + ONE_DAY_AGO;
    }
    //超过一个月就返回当时的日期
    String a= DateTime.fromMillisecondsSinceEpoch(time).toString();
//    print(a.substring(0,a.lastIndexOf(" ")));
    return a.substring(0,a.lastIndexOf(" "));
  }


}
