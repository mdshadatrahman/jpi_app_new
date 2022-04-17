import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:jpi_app/screens/points_page.dart';
import 'package:jpi_app/screens/profile.dart';
import 'package:jpi_app/screens/restaurant_llist_page.dart';
import 'package:jpi_app/screens/tasks_page.dart';

import '../utils/Colors.dart';
import '../utils/drawer.dart';
import '../widgets/custom_bottom_navigation.dart';
import 'buy_coupon.dart';
import 'details.dart';
import 'get_points.dart';
import 'history_page_pointsstamps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var selected = false;

  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<String> collegeGallery = [
      'assets/jpi1.jpeg',
      'assets/jpi2.jpg',
      'assets/jpi3.jpeg',
      'assets/jpi4.jpeg',
      'assets/jpi5.jpg',
      'assets/jpi6.jpeg',
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomBottomNavigationBar(),
          ),
        );
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(height: height, width: width),
          key: _key,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    //Top Background
                    Stack(
                      children: [
                        Container(
                          height: height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff318AC4),
                                Color(0xff4CA37C),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: height / 6),
                          child: ClipPath(
                            clipper: WaveClipperOne(
                              flip: true,
                              reverse: true,
                            ),
                            child: Container(
                              height: height / 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0x4200FF66),
                                    Color(0x15254864),
                                    // Colors.red,
                                    // Colors.green,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width / 15,
                        right: width / 15,
                        top: height / 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: height * 0.05),

                              Container(
                                height: width * 0.2,
                                width: width * 0.2,
                                child: Image.asset('assets/jpi_logo.png'),
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                'Jashore Polytechnic Institute',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     _key.currentState!.openDrawer();
                              //   },
                              //   child: Icon(
                              //     Icons.sort,
                              //     color: Colors.white,
                              //     size: 36,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Three Boxes
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: height / 3.75,
                        ),
                        child: Stack(
                          children: [
                            //Box1
                            GestureDetector(
                              onTap: () {
                                Get.to(() => TasksPage());
                              },
                              child: Container(
                                height: height * 0.115,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Color(0xffF7931A),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: height * 0.05,
                                      width: height * 0.05,
                                      margin: EdgeInsets.only(
                                        bottom: 10,
                                        right: width * 0.025,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xff3A260D).withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(width * 0.02),
                                        child: Icon(
                                          Icons.computer,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        // bottom: 10,
                                        right: width * 0.025,
                                      ),
                                      child: Text(
                                        'Depts',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Box 2
                            GestureDetector(
                              onTap: () {
                                Get.to(() => PointsPage());
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.22,
                                ),
                                child: Container(
                                  height: height * 0.115,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    color: Color(0xff1F65AB),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height * 0.05,
                                        width: height * 0.05,
                                        margin: EdgeInsets.only(
                                          bottom: 10,
                                          right: width * 0.025,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: Icon(
                                            Icons.book_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          // bottom: 10,
                                          right: width * 0.025,
                                        ),
                                        child: Text(
                                          'Libraries',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //Box3
                            GestureDetector(
                              onTap: () {
                                Get.to(() => HistoryPage());
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.44,
                                ),
                                child: Container(
                                  height: height * 0.115,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    color: Color(0xff462DAB),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height * 0.05,
                                        width: height * 0.05,
                                        margin: EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: Icon(
                                            Icons.sports_cricket_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Extracurricular',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.05),
                Container(
                  padding: EdgeInsets.only(
                    left: width / 15,
                    right: width / 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => get_points());
                            },
                            child: Container(
                              width: width * 0.4,
                              height: height * 0.12,
                              decoration: BoxDecoration(
                                color: Color(0xffE5E8EE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home_work_outlined,
                                    size: 30,
                                    color: Color.fromARGB(255, 185, 81, 40),
                                  ),
                                  Text(
                                    'Internal Results',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 185, 81, 40),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: width * 0.3,
                            color: Color(0xffF7931A),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => buy_coupons(),
                              );
                            },
                            child: Container(
                              width: width * 0.4,
                              height: height * 0.12,
                              decoration: BoxDecoration(
                                color: Color(0xffE5E8EE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.public,
                                    size: 30,
                                    color: Color.fromARGB(255, 185, 81, 40),
                                  ),
                                  Text(
                                    'Board Results',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 185, 81, 40),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: width * 0.3,
                            color: Color(0xffEE85FF),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.035),
                //Our offers
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 15,
                  ),
                  child: Text(
                    'Our Institute',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackH1,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                //Discount field
                GestureDetector(
                  onTap: () {
                    Get.to(() => details());
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: AlwaysScrollableScrollPhysics(),
                        height: 200,
                        autoPlay: true,
                        reverse: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        height: height / 5,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(collegeGallery[itemIndex]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.035),
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 15,
                  ),
                  child: Text(
                    'All Departments',
                    style: TextStyle(
                      color: AppColors.blackH1,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: width / 15, bottom: width / 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ), // shadow direction: bottom right
                                )
                              ],
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 247, 164, 145),
                                  Color(0xffF5F5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width * 0.15,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffE5EDFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/civil.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Civil',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 241, 92, 75),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 15),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ), // shadow direction: bottom right
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 218, 231, 164),
                                  Color(0xffF5F5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width * 0.15,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffE5EDFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/computer.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Computer',
                                    style: TextStyle(
                                      color: Color(0xff80A100),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 15),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ), // shadow direction: bottom right
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 245, 230, 190),
                                  Color(0xffF5F5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width * 0.15,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffE5EDFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/electrical.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Electrical',
                                    style: TextStyle(
                                      color: Color(0xffF7CA49),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 15),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 255, 186, 181),
                                  Color(0xffF5F5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width * 0.15,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffE5EDFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/electronics.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Electronics',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 247, 73, 73),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 15),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ), // shadow direction: bottom right
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 190, 216, 245),
                                  Color(0xffF5F5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width * 0.15,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffE5EDFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/mechanical.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Mechanical',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 73, 120, 247),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 15),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ), // shadow direction: bottom right
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 245, 190, 231),
                                  Color(0xffF5F5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width * 0.15,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffE5EDFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/power.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Power',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 247, 73, 224),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 15),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ), // shadow direction: bottom right
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 190, 234, 245),
                                  Color(0xffF5F5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width * 0.15,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffE5EDFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/telecom.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Telecom',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 73, 178, 247),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NearbyMerchantsTile extends StatelessWidget {
  const NearbyMerchantsTile({
    Key? key,
    required this.width,
    required this.height,
    required this.imageUrl,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => details());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width / 15,
          vertical: height * 0.015,
        ),
        child: Stack(
          children: [
            Container(
              height: height * 0.15,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.03),
              child: Container(
                height: height * 0.025,
                width: width * 0.6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff2C3659),
                      Color(0xff33A4BB),
                      Color(0xffEE786B),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '3% Happi Points | Upto 20 points',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
