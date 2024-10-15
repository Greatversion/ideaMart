import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar(BuildContext context, String message, {Duration duration = const Duration(seconds: 2)}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration,
      backgroundColor: Colors.black, // You can customize the background color
      behavior: SnackBarBehavior.floating, // Optional, to make it float above content
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Optional, to add rounded corners
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Handle undo action if needed
        },
      ),
    );

    // Show the snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
