import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  static Color? getColor(String? color) {
    switch (color) {
      case 'Red':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Yellow':
        return Colors.yellow;
      case 'Orange':
        return Colors.orange;
      case 'Purple':
        return Colors.purple;
      case 'Pink':
        return Colors.pink;
      case 'Brown':
        return Colors.brown;
      case 'Grey':
        return Colors.grey;
      case 'Black':
        return Colors.black;
      case 'White':
        return Colors.white;
      case 'Teal':
        return Colors.teal;
      case 'Cyan':
        return Colors.cyan;
      case 'Amber':
        return Colors.amber;
      case 'Indigo':
        return Colors.indigo;

      default:
        return null;
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length > maxLength) {
      return '${text.substring(0, maxLength)}...';
    } else {
      return text;
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool isArabic(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar';
  }

  static bool isRTL(BuildContext context) {
    return Directionality.of(context) == TextDirection.RTL;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static List<S> removeDuplicates<S>(List<S> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
