extension IntUtils on int {
  String get weekdayToAbbreviatedString {
    switch (this) {
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
        return "Su";
    }
  }
}
