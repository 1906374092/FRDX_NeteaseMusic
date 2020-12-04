class Tools {
  static bool buttonTapLock = false;

  static String getNumberLabel(int number) {
    if (number ~/ 10000 < 10) {
      return number.toString();
    } else if (number ~/ 10000 > 10 && number ~/ 10000 < 10000) {
      return "${number ~/ 10000}万";
    } else {
      return "${number ~/ 100000000}亿";
    }
  }

  static int getTimeInterval({int dayoffset = 0}) {
    DateTime now = DateTime.now();
    DateTime base = DateTime(now.year, now.month, now.day + dayoffset);
    return base.millisecondsSinceEpoch;
  }

  static String getDateString(int interval) {
    DateTime resultDate = DateTime.fromMillisecondsSinceEpoch(interval);
    DateTime now = DateTime.now();
    if (resultDate.year == now.year &&
        resultDate.month == now.month &&
        resultDate.day == now.day) {
      return "今天";
    } else if (resultDate.year == now.year &&
        resultDate.month == now.month &&
        resultDate.day == now.day + 1) {
      return "明天";
    } else if (resultDate.year == now.year &&
        resultDate.month == now.month &&
        resultDate.day == now.day + 2) {
      return "后天";
    } else {
      return "${resultDate.month}月${resultDate.day}日";
    }
  }

  static setButtonLock(Function handler, {millseconds = 800}) {
    if (!Tools.buttonTapLock) {
      Tools.buttonTapLock = true;
      handler();
      Future.delayed(Duration(milliseconds: millseconds), () {
        Tools.buttonTapLock = false;
      });
    }
  }

  ///00:00.000
  static Duration timeStringToDuration(String timeString) {
    String minute = timeString.split(":")[0];
    String second = timeString.split(":")[1].split(".")[0];
    String millSecond = timeString.split(":")[1].split(".")[1];
    int total = int.parse(minute) * 60 * 1000 +
        int.parse(second) * 1000 +
        int.parse(millSecond);
    return Duration(milliseconds: total);
  }
}
