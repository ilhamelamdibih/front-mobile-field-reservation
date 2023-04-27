class Autentification {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Autentification(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Autentification.fromJson(dynamic json) {
    return Autentification(
        name: json['Fieldname'] as String,
        images: json['terrain_photo'] as String,
        rating: 4.5,
        totalTime: '50');
  }

  static List<Autentification> authentifiationFromSanpshot(List snapshot) {
    return snapshot.map((data) {
      return Autentification.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
