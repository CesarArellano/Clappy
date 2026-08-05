import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String weekdayDayLabel(String localeName) {
    final label = DateFormat("EEEE d", localeName).format(this);
    return label[0].toUpperCase() + label.substring(1);
  }
}
