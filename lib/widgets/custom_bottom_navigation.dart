import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/feed_screen.dart';
import '../screens/homepage.dart';
import '../screens/notifications.dart';
import '../screens/settings_page.dart';
import '../utils/Colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  int current_tab = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        current_tab == 1
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CustomBottomNavigationBar(),
                ),
              )
            : current_tab == 2
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CustomBottomNavigationBar(),
                    ),
                  )
                : current_tab == 3
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CustomBottomNavigationBar(),
                        ),
                      )
                    : showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm Exit"),
                            content:
                                const Text("Are you sure you want to exit?"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("YES"),
                                onPressed: () {
                                  exit(0);
                                },
                              ),
                              TextButton(
                                child: const Text("NO"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
        return true;
      },
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 5,
          child: Container(
            height: MediaQuery.of(context).size.height / 12,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomeScreen();
                        current_tab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        current_tab == 0
                            ? SvgPicture.asset("assets/images/icon1.svg")
                            : SvgPicture.asset("assets/images/icon2.svg"),
                        Text(
                          "Overview",
                          style: TextStyle(
                            fontSize: 12,
                            color: current_tab == 0
                                ? AppColors.material
                                : AppColors.textcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const FeedScreen();
                        current_tab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        current_tab == 1
                            //!Need to change the icon
                            ? SvgPicture.asset("assets/images/icon6.svg")
                            : SvgPicture.asset("assets/images/icon4.svg"),
                        Text(
                          "Feed",
                          style: TextStyle(
                            fontSize: 12,
                            color: current_tab == 1
                                ? AppColors.material
                                : AppColors.textcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const NoticeScreen();
                        current_tab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        current_tab == 2
                            ? Icon(Icons.notifications_active,
                                color: AppColors.material)
                            : Icon(Icons.notifications_active_outlined,
                                color: AppColors.material),
                        Text(
                          "Notices",
                          style: TextStyle(
                            fontSize: 12,
                            color: current_tab == 2
                                ? AppColors.material
                                : AppColors.textcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const SettingsPage();
                        current_tab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        current_tab == 3
                            ? SvgPicture.asset("assets/images/icon8.svg")
                            : SvgPicture.asset("assets/images/icon7.svg"),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 12,
                            color: current_tab == 3
                                ? AppColors.material
                                : AppColors.textcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
