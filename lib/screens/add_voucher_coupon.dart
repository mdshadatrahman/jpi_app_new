import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../utils/Colors.dart';

class AddVoucherCoupon extends StatefulWidget {
  const AddVoucherCoupon({Key? key}) : super(key: key);

  @override
  State<AddVoucherCoupon> createState() => _AddVoucherCouponState();
}

class _AddVoucherCouponState extends State<AddVoucherCoupon>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAF9F9),
        appBar: NewGradientAppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Voucher/Coupons',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            Icon(
              Icons.search,
              color: AppColors.white,
              size: 35,
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80',
              ),
            ),
            SizedBox(width: width / 15)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff318AC4),
              Color(0xff4CA37C),
            ],
          ),
        ),
        // body: Column(
        //   children: [
        //     //Points, Stamps
        //     SizedBox(height: height * 0.03),
        //     Padding(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: width / 15,
        //       ),
        //       child: Stack(
        //         children: [
        //           GestureDetector(
        //             onTap: () {
        //               Get.off(
        //                 () => UploadedVoucher(),
        //                 transition: Transition.noTransition,
        //               );
        //             },
        //             child: Container(
        //               width: width * 1,
        //               height: height * 0.09,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(12),
        //                 color: Colors.white,
        //                 boxShadow: [
        //                   BoxShadow(
        //                     color: Color.fromARGB(255, 213, 214, 218),
        //                     spreadRadius: 0,
        //                     blurRadius: 10,
        //                     offset: Offset(5, 5),
        //                   ),
        //                 ],
        //               ),
        //               child: Padding(
        //                 padding: EdgeInsets.symmetric(horizontal: width / 15),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Column(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       children: [
        //                         Text(
        //                           'Receive points',
        //                           style: TextStyle(
        //                             fontSize: 18,
        //                             fontWeight: FontWeight.w500,
        //                             color: Color(0xffE37A29),
        //                           ),
        //                         ),
        //                         Text(
        //                           'from uploads',
        //                           style: TextStyle(
        //                             fontSize: 18,
        //                             fontWeight: FontWeight.w500,
        //                             color: Color(0xffE37A29),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     Text(
        //                       'Uploaded\nvouchers',
        //                       style: TextStyle(
        //                         fontSize: 18,
        //                         fontWeight: FontWeight.w500,
        //                         color: Color(0xff1E130B),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),

        //           //Half bar
        //           Padding(
        //             padding: EdgeInsets.only(top: height * 0.075),
        //             child: Container(
        //               height: height * 0.015,
        //               width: width * 0.45,
        //               decoration: BoxDecoration(
        //                 color: Color(0xff3756CF),
        //                 borderRadius: BorderRadius.only(
        //                   bottomLeft: Radius.circular(50),
        //                   topRight: Radius.circular(50),
        //                   bottomRight: Radius.circular(50),
        //                   topLeft: Radius.circular(6),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),

        //     //Upload container

        //     SizedBox(
        //       height: height * 0.09,
        //     ),
        //     Container(
        //       child: Stack(
        //         children: [
        //           Center(
        //             child: SvgPicture.asset(
        //               'assets/images/rectangle.svg',
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsets.symmetric(vertical: width * 0.2),
        //             child: Column(
        //               children: [
        //                 Center(
        //                   child: Icon(
        //                     Icons.file_upload_outlined,
        //                     size: 50,
        //                   ),
        //                 ),
        //                 Text(
        //                   'upload from your gallery',
        //                   style: TextStyle(
        //                       fontSize: 18, fontWeight: FontWeight.w400),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),

        body: Column(
          children: [
            //Body
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width / 15,
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 10.0,
                    color: Color(0xff3756CF),
                  ),
                ),
                tabs: [
                  SizedBox(
                    height: height * 0.08,
                    width: width * 0.4,
                    child: const Center(
                      child: Text(
                        'Receive points\nfrom uploads',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffE37A29),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.4,
                    child: const Center(
                      child: Text(
                        'Uploaded\nvouchers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff1E130B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.09,
            ),
            //Tabbar view
            SizedBox(
              height: height * 0.6,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () {
                        // Get.to(() =>const UploadingCouponPage());
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/rectangle.svg',
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: width * 0.2),
                            child: Column(
                              children: const [
                                Center(
                                  child: Icon(
                                    Icons.file_upload_outlined,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  'upload from your gallery',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Uploded voucher
                  const Center(
                    child: Text('Uploaded Voucher'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
