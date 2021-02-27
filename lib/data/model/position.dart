class Position {
  Position({
    this.latitude,
    this.longitude,
  });

  double latitude;
  double longitude;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        longitude: json["longitude"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
