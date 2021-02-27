import 'package:splash_gram/data/model/unsplash.dart';

class ResponseUnsplash {
  ResponseUnsplash({this.success, this.data});

  bool success;
  List<Unsplash> data;

  factory ResponseUnsplash.fromJson(Map<String, dynamic> json) => ResponseUnsplash(
      success: json['success'], data: List<Unsplash>.from(json['data'].map((x) => Unsplash.fromJson(x))));
}
