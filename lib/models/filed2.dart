class Field2{
  final String name;
  final String images;
  final double rating;
  final String totalTime;


  Field2({required this.name,required this.images,required this.rating,required this.totalTime});

  factory Field2.fromJson(dynamic json){
    return Field2(
      name:json['Fieldname'] as String,
      images:json['terrain_photo'] as String,
      rating :4.5,
      totalTime :'50'
    );
  }

  static List<Field2> fields2FromSanpshot(List snapshot){
    return snapshot.map((data){
      return Field2.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
