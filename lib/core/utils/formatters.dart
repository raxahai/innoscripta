import 'package:intl/intl.dart';

class DateFormats {
  static const String defaultFormat = 'EEEE dd MMM yyyy';
  static String getDateTimeFromTimeStamp(String timestamp, format) {
    String format = "EEEE dd MMM yyyy";
    int timestampInt = int.parse(timestamp);
    var dateToTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timestampInt * 1000);
    return DateFormat(format).format(dateToTimeStamp);
  }

  static String formatDate(DateTime date, String format) {
    var formatter = DateFormat(format);
    return formatter.format(date);
  }
}
