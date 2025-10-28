import 'package:intl/intl.dart';
import '../common/constants/app_strings.dart';

class DateFormatter {
  // Format date to readable string
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  // Format datetime to readable string with time
  static String formatDateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy • hh:mm a').format(date);
  }

  // Get time ago format (e.g., "2 hours ago")
  static String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return AppStrings.justNow;
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${AppStrings.minutesAgo}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${AppStrings.hoursAgo}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${AppStrings.daysAgo}';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${AppStrings.weeksAgo}';
    } else {
      final months = (difference.inDays / 30).floor();
      return '$months ${AppStrings.monthsAgo}';
    }
  }

  // Parse ISO 8601 date string
  static DateTime? parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  // Format date for API requests (ISO 8601)
  static String formatForApi(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
