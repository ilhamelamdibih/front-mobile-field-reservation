class ApiEndPoints {
  //http://restapi.adequateshop.com/api/
  static final baseUrl ='https://kritirankk.pythonanywhere.com/';
  static _AuthEndPoints authEndPoints= _AuthEndPoints();
   static _ReservationEndPoints reservationEndPoints= _ReservationEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'api/register';
  final String loginEmail = 'api/login';
}

class _ReservationEndPoints {
  final String reservation = 'entity/reservation-create/';
}