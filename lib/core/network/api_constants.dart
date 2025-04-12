import 'package:flutter/foundation.dart';

class ApiConstants {
  static const String baseUrl =
      kDebugMode ? "https://kite.kagi.com" : "https://kite.kagi.com";

  static String newsCategoryUrl = "$baseUrl/kite.json";
  static String articleUrl(category) => "$baseUrl/$category";
}
