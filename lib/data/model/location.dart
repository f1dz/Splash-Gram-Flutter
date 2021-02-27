import 'position.dart';

class Location {
  Location({
    this.title,
    this.name,
    this.city,
    this.country,
    this.position,
  });

  String title;
  String name;
  String city;
  String country;
  Position position;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json["title"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        position: Position.fromJson(json["position"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "name": name,
        "city": city,
        "country": country,
        "position": position.toJson(),
      };
}
