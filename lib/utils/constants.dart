import 'package:flutter/material.dart';

class AppConstants {
  // API Base URL
  static const String baseUrl = 'http://localhost:3000';

  // Endpoints
  static const String loginEndpoint = '/login';
  static const String dashboardEndpoint = '/dashboard';

  // Shared Preferences Keys
  static const String authTokenKey = "myjwttoken12#";

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.green;
  static const Color backgroundColor = Colors.white;
  static const Color accentColor = Colors.orange;

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  // Spacing
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;

  // Durations
  static const Duration animationDuration = Duration(milliseconds: 300);
}
