import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Helpers {
  // Format Date to a readable string
  static String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  // Validate Email Address
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[^@]+@[^@]+\.[^@]+$',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }

  // Show Snackbar
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Handle API Error
  static String handleApiError(dynamic error) {
    if (error is String) {
      return error;
    } else if (error is Exception) {
      return 'An unexpected error occurred';
    }
    return 'Unknown error';
  }

  // Check Internet Connectivity
  static Future<bool> checkInternetConnectivity() async {
    // Here you can use packages like connectivity_plus to check for internet connectivity
    // Example with connectivity_plus:
    // final connectivityResult = await (Connectivity().checkConnectivity());
    // return connectivityResult != ConnectivityResult.none;

    // Placeholder implementation for demo purposes
    return true; // Assume always connected
  }
}
