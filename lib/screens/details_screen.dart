import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                  child: BookInfo(size: size,)
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .42 - 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ChapterCard(
                        name: "Urbain A1",
                        filedNumber: 1,
                        adresse: "Marrakech - Bouaakaz",
                        press: () {},
                      ),
                      ChapterCard(
                        name: "Urbain A2",
                        filedNumber: 2,
                        adresse: "Marrakech - SYBA",
                        press: () {},
                      ),
                      ChapterCard(
                        name: "Urbain A3",
                        filedNumber: 3,
                        adresse: "Marrakech - Mhamid",
                        press: () {},
                      ),
                      ChapterCard(
                        name: "Urbain A4",
                        filedNumber: 4,
                        adresse: "Marrakech - Guiléz",
                        press: () {},
                      ),
                      SizedBox(height: 10),
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

class ChapterCard extends StatelessWidget {
   const ChapterCard({
     super.key,
     required this.name,
     required this.adresse,
     required this.filedNumber,
     required this.press,
   });
   final String name;
   final String adresse;
   final int filedNumber;
   final VoidCallback press;
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
                  text: "Filed $filedNumber : $name \n",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF393939),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:"Adresse : $adresse",
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
            ),
            onPressed: press,
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
