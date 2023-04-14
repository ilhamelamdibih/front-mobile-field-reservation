class Field{
  final String name;
  final String images;
  final double rating;
  final String totalTime;


  Field({required this.name,required this.images,required this.rating,required this.totalTime});

  factory Field.fromJson(dynamic json){
    return Field(
      name:json['Fieldname'] as String,
      images:json['terrain_photo'] as String,
      rating :4.5,
      totalTime :'50'
    );
  }

  static List<Field> fieldsFromSanpshot(List snapshot){
    return snapshot.map((data){
      return Field.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
