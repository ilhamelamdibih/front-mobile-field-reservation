import 'package:flutter/material.dart';
import 'package:my_project/homepage.dart';
import 'package:my_project/utils/global.colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_project/controllers/reseravtion_controller.dart';

//import 'package:flutter/cupertino.dart';

class AppointScreen extends StatefulWidget {
  final int id;
  final String name;
  final String image;

  final int selectedIndexMonth = -1;
  final int selectedIndexHours = -1;

  final DateTime dateTime = DateTime.parse('2023-05-07T12:00:00Z');
  final String startTime = "8:00 AM";
  final String endTime ="9:00 AM";

   AppointScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.image,

  }) : super(key: key);

  @override
  _AppointScreenState createState() => _AppointScreenState();
}

class _AppointScreenState extends State<AppointScreen> {
  late int selectedIndexMonth = -1;
  late int selectedIndexHours = -1;
  late DateTime dateTime;
  late String startTime;
  late String endTime;

  static ReservationController reservationController = Get.put(ReservationController());

 

  @override
  void initState() {
    super.initState();
    selectedIndexMonth = widget.selectedIndexMonth;
    selectedIndexHours = widget.selectedIndexHours;
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> next30Days =
        List.generate(30, (index) => DateTime.now().add(Duration(days: index)));

    return Material(
        color: Color.fromARGB(255, 255, 255, 253), //0xFFD9E4EE
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      GlobalColors.mainColor.withOpacity(0.9),
                      GlobalColors.mainColor.withOpacity(0),
                      GlobalColors.mainColor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.offAll(HomePage());
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_back,
                                    color: GlobalColors.mainColor, size: 28),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F8FF),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: GlobalColors.mainColor,
                                size: 28,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Player",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "100 MAD",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Area",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "150 m²",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: GlobalColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: GlobalColors.mainColor,
                        size: 28,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Marrakech",
                        style: TextStyle(
                            fontSize: 17,
                            color: GlobalColors
                                .textColor //Colors.black.withOpacity(0.6),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "URBAIN FIVE est un COMPLEXE SPORTIF dédié au sport.propose une impressionnante gamme d’activités pour toute la famille.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: GlobalColors
                            .textColor //Colors.black.withOpacity(0.6),
                        ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Book Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: GlobalColors
                          .textColor, // Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: next30Days.length,
                      itemBuilder: (context, index) {
                        DateTime currentDate = next30Days[index];
                        String formattedMonth =
                            DateFormat('MMM').format(currentDate);
                        String formattedDay =
                            DateFormat('dd').format(currentDate);
                        String formattedYear =
                            DateFormat('yyyy').format(currentDate);
 // Default value is -1 as no item is selected initially

                        return InkWell(
                          onTap: () {
                            setState(() {
                                selectedIndexMonth = index;
                                dateTime= next30Days[index];
                              });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 25),
                            decoration: BoxDecoration(
                              color: index == selectedIndexMonth
                                  ? GlobalColors.mainColor
                                  : Color(0XFFF2F8FF),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  formattedDay,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: index == selectedIndexMonth
                                          ? Colors.white
                                          : GlobalColors
                                              .textColor //Colors.black.withOpacity(0.6),
                                      ),
                                ),
                                Text(
                                  formattedMonth,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: index == selectedIndexMonth
                                          ? Colors.white
                                          : GlobalColors
                                              .textColor // Colors.black.withOpacity(0.6),

                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Book Time",
                    style: TextStyle(
                      fontSize: 18,
                      color: GlobalColors
                          .textColor, //Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                                selectedIndexHours = index;
                                startTime = "${index + 8}:00 AM";
                                endTime = "${index + 8 + 1}:00 AM";
                              });
                          },child: Container(
                          
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              color: index == selectedIndexHours
                                  ? GlobalColors.mainColor
                                  : Color(0XFFF2F8FF),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ]),
                          child: Center(
                            child: Text(
                              "${index + 8}:00 AM",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: index == selectedIndexHours
                                      ? Colors.white
                                      : GlobalColors
                                          .textColor //Colors.black.withOpacity(0.6),
                                  ),
                            ),
                          ),
                        )
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: GlobalColors.mainColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () /////
                          {
                            // String formatteddate =
                            // DateFormat('yyyy-MM-dd').format(dateTime);
                            // print(
                            //   'date : ' + formatteddate
                            //   +
                            //   ' startTime : ' + startTime
                            //   +
                            //   ' endTime : ' + endTime
                            //   +
                            //   ' terrain : ' + widget.id.toString()
                            // );
                                
                          reservationController.ReservationFull(dateTime,startTime,endTime,widget.id);
                      },
                      /////,
                      ///
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Book Appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
