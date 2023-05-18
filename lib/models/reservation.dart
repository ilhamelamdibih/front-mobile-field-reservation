class Reservation{
  final int id;
  final String nameField;
  final String complexeName;
  final String from;
  final String to;
  final String date;
  final String approved;



  Reservation({required this.id,required this.nameField,required this.complexeName,required this.from,required this.to,required this.date,required this.approved});
  factory Reservation.fromJson(dynamic json){
    return Reservation(
      id:json['id'] as int,
      nameField:json['nameField'] as String,
      complexeName :json['complexeName'] as String,
      from :json['from'] as String,
      to :json['to'] as String,
      date:json['date'] as String,
      approved :json['approved'] as String,
    );
  }

  static List<Reservation> ReservationsFromSanpshot(List snapshot){
    return snapshot.map((data){
      return Reservation.fromJson(data);
    }).toList();
  }
  

  @override
  String toString(){
    return 'Reservation {id: $id, nameField: $nameField, complexeName: $complexeName, approved: $approved}';
  }
}
