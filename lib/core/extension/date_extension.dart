import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TimeStampFormat { parse_12, parse_24 }

extension DateUtils on DateTime {
  String get monthToFullString {
    switch (month) {
      case DateTime.january:
        return "January";
      case DateTime.february:
        return "February ";
      case DateTime.march:
        return "March ";
      case DateTime.april:
        return "April ";
      case DateTime.may:
        return "May ";
      case DateTime.june:
        return "June ";
      case DateTime.july:
        return "July ";
      case DateTime.august:
        return "August ";
      case DateTime.september:
        return "September";
      case DateTime.october:
        return "October ";
      case DateTime.november:
        return "November ";
      case DateTime.december:
        return "December ";
      default:
        return "Error";
    }
  }

  String get weekdayToFullString {
    switch (weekday) {
      case DateTime.monday:
        return "Monday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.friday:
        return "Friday";
      case DateTime.saturday:
        return "Saturday";
      case DateTime.sunday:
        return "Sunday";
      default:
        return "Error";
    }
  }

  String get weekdayToAbbreviatedString {
    switch (weekday) {
      case DateTime.monday:
        return "Mo";
      case DateTime.tuesday:
        return "Tu";
      case DateTime.wednesday:
        return "We";
      case DateTime.thursday:
        return "Th";
      case DateTime.friday:
        return "Fr";
      case DateTime.saturday:
        return "Sa";
      case DateTime.sunday:
        return "Su";
      default:
        return "Err";
    }
  }

  int get totalMinutes => hour * 60 + minute;

  TimeOfDay get timeOfDay => TimeOfDay(hour: hour, minute: minute);

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) =>
      DateTime(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
        microsecond ?? this.microsecond,
      );

  String dateToStringWithFormat({String format = 'y-M-d'}) {
    return DateFormat(format).format(this);
  }

  DateTime stringToDateWithFormat({
    required String format,
    required String dateString,
  }) =>
      DateFormat(format).parse(dateString);

  String getTimeInFormat(TimeStampFormat format) => DateFormat('h:mm${format == TimeStampFormat.parse_12 ? " a" : ""}').format(this).toUpperCase();

  bool compareWithoutTime(DateTime date) => day == date.day && month == date.month && year == date.year;

  bool compareTime(DateTime date) => hour == date.hour && minute == date.minute && second == date.second;
}
