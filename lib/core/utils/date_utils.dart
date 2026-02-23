class DateUtilsHelper {

  static String formatDate(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
  }

  static bool isSameMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
          date.month == now.month;
  }
}