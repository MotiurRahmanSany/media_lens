import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF42A5F5);

  // Accent Colors
  static const Color accent = Color(0xFFFF6F00);
  static const Color accentLight = Color(0xFFFF8F00);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color cardBackground = Colors.white;
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA726);
  static const Color info = Color(0xFF29B6F6);

  // Category Colors
  static const Map<String, Color> categoryColors = {
    'general': Color(0xFF9E9E9E),
    'business': Color(0xFF2196F3),
    'entertainment': Color(0xFFE91E63),
    'health': Color(0xFF4CAF50),
    'science': Color(0xFF9C27B0),
    'sports': Color(0xFFFF5722),
    'technology': Color(0xFF00BCD4),
  };
}
