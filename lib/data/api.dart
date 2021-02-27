import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:splash_gram/data/response_unsplash.dart';

class Api {
  static const String PATH = 'assets/json/unsplash.json';

  static Future<ResponseUnsplash> getData() async {
    return ResponseUnsplash.fromJson(
        await rootBundle.loadString(PATH).then((jsonStr) => jsonDecode(jsonStr)));
  }
}
