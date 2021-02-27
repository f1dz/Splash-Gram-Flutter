class Exif {
  Exif({
    this.make,
    this.model,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });

  String make;
  String model;
  String exposureTime;
  String aperture;
  String focalLength;
  int iso;

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
        make: json["make"],
        model: json["data.model"],
        exposureTime: json["exposure_time"],
        aperture: json["aperture"],
        focalLength: json["focal_length"],
        iso: json["iso"],
      );

  Map<String, dynamic> toJson() => {
        "make": make,
        "data.model": model,
        "exposure_time": exposureTime,
        "aperture": aperture,
        "focal_length": focalLength,
        "iso": iso,
      };
}
