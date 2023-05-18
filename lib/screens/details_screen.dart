import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/ProfileScreen.dart';
import 'package:my_project/models/reservation.api.dart';
import 'package:my_project/models/reservation.dart';

import '../utils/global.colors.dart';
import '../view/home.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}




class _DetailsScreenState extends State<DetailsScreen> {


  late List<Reservation> _reservations;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getReservations();
  }

  Future<void> getReservations() async {
    _reservations = (await ReservationApi.getReservation()).cast<Reservation>();
    
    setState(() {
      _isLoading = false;
    });
    print(_reservations.length);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
         appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Reservations",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: GlobalColors.mainColor,
      ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: GlobalColors.mainColor,
              foregroundColor: Colors.white,
              elevation: 0,
              // shape: BeveledRectangleBorder(
              //     // borderRadius: BorderRadius.circular(20.0),
              //     // side: BorderSide(color: Colors.blue, width: 2.0, style: BorderStyle.solid)
              //     ),
              // mini: true,
            ),
          bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: GlobalColors.mainColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
               child: GestureDetector(
                      onTap: () {
                        // Code to execute when the widget is tapped
                        Get.off(HomePage());
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
              child: GestureDetector(
                      onTap: () {
                        // Code to execute when the widget is tapped
                        Get.off(DetailsScreen());
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.white,
                          ),
                          Text(
                            "Reservations",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )

            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  Text(
                    "Fav",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                      onTap: () {
                        // Code to execute when the widget is tapped
                        Get.off(ProfileScreen());
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.supervisor_account_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "User",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: size.height * .10, left: size.width * .1, right: size.width * .02),
                  height: size.height * .48,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: BookInfo(size: size,),
                ),
               Padding(
                  padding: EdgeInsets.only(top: size.height * .42 - 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox(
                              height: 500, // Set the height here
                              child: ListView.builder(
                                itemCount: _reservations.length,
                                itemBuilder: (context, index) {
                                  return ReservationCard(
                                    id: _reservations[index].id,
                                    nameField: _reservations[index].nameField,
                                    complexeName: _reservations[index].complexeName,
                                    from: _reservations[index].from,
                                    to: _reservations[index].to,
                                    date: _reservations[index].date,
                                    approved: _reservations[index].approved,
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),

               
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final int id;
  final String nameField;
  final String complexeName;
  final String from;
  final String to;
  final String date;
  final String approved;
  const ReservationCard({super.key, 
    required this.id,required this.nameField,
    required this.complexeName,
    required this.from,required this.to,
    required this.date,
    required this.approved
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Terrain : $nameField - Complexe $complexeName \n",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF393939),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:"From : $from - To : $to",
                  style: TextStyle(color: Color(0xFF8F8F8F)),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ), onPressed: () {  },
          )
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  
  const BookInfo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: this.size.height * .1),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    "Your Reservation",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: Image.asset(
                "assets/images/b-1.png",
                height: double.infinity,
                alignment: Alignment.topRight,
                fit: BoxFit.fitWidth,
              ),
          )),
        ],
      ),
    );
  }
}



_getNavBar(context) {
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: NavBarClipper(),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  GlobalColors.mainColor,
                  Colors.teal.shade900,
                ])),
          ),
        ),
      ),
      Positioned(
        bottom: 45,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNavItem(Icons.home , false),
            SizedBox(width: 1),
            _buildNavItem(Icons.book , true),
            SizedBox(width: 1),
            _buildNavItem(Icons.supervisor_account_outlined, false),
          ],
        ),
      ),
      Positioned(
        bottom: 10,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Add your desired action here
                Get.off(HomePage());
              },
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Text('My reservations',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500)),
            SizedBox(
              width: 1,
            ),
            Text('Profile',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500)),
          ],
        ),
      )
    ],
  );
}

_buildNavItem(IconData icon, bool active) {
  return CircleAvatar(
    radius: 30,
    backgroundColor: GlobalColors.mainColor,
    child: CircleAvatar(
      radius: 25,
      backgroundColor:
          active ? Colors.white.withOpacity(0.9) : Colors.transparent,
      child: Icon(
        icon,
        color: active ? GlobalColors.mainColor : Colors.white.withOpacity(0.9),
      ),
    ),
  );
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

