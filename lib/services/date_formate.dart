import 'package:intl/intl.dart';

String formatDateTime(String dateTimeString) {
  // Parse the string into a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Get the current date
  DateTime now = DateTime.now();

  // Check if the date is today
  String day;
  if (dateTime.day == now.day && dateTime.month == now.month && dateTime.year == now.year) {
    day = 'Today';
  } else {
    // If not today, format it as the weekday
    day = DateFormat('EEEE').format(dateTime);
  }

  // Format the time in 12-hour format with AM/PM
  String time = DateFormat('h:mm a').format(dateTime);

  // Combine the day and time
  return '$day, $time';
}
