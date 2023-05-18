import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_project/ProfileScreen.dart';
import 'package:my_project/models/field.api.dart';
import 'package:my_project/models/field.dart';
import 'package:my_project/screens/details_screen.dart';
import 'package:my_project/utils/global.colors.dart';
import 'package:my_project/view/widgets/field_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Field> _fields;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getFields();
  }

  Future<void> getFields() async {
    _fields = await FieldApi.getField();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Field List",
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
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _fields.length,
                itemBuilder: (context, index) {
                  return FieldCard(
                      id : _fields[index].id,
                      title: _fields[index].name,
                      cookTime: _fields[index].totalTime,
                      rating: _fields[index].rating.toString(),
                      thumbnailUrl: _fields[index].images);
                },
              ));
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
            _buildNavItem(Icons.home , true),
            SizedBox(width: 1),
            _buildNavItem(Icons.book , false),
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
              Text(
              'Home',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 1,
            ),
            GestureDetector(
              onTap: () {
                // Add your desired action here
                Get.off(DetailsScreen());
              },
              child: Text(
                'My reservations',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
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

