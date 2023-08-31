import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/models/customer_data.dart';
import 'package:megabank/models/provider/page_index_provider.dart';
import 'package:megabank/routes/app_route_constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool showGreetings = false;
  bool showAppBarContent = false;

  @override
  void initState() {
    super.initState();

    // After 2 seconds, show Greetings
    Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return; // Check if the widget is still mounted
      setState(() {
        showGreetings = true;
      });

      // After another 2 seconds, replace Greetings with AppBarContent
      Timer(const Duration(seconds: 3), () {
        if (!mounted) return; // Check if the widget is still mounted
        setState(() {
          showAppBarContent = true;
        });
      });
    });

    // Load customer static data from JSON
    loadCustomerStaticData();
  }

  Future<void> loadCustomerStaticData() async {
    final jsonString = await rootBundle.loadString(customerData);
    final jsonData = json.decode(jsonString);

    final customerStaticDataList = jsonData['customerStaticData'] as List;
    final customerStaticData =
        CustomerStaticData.fromJson(customerStaticDataList.first);

    setState(() {
      customerTitle = customerStaticData.title;
      customerName = customerStaticData.customerName;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool firstLoad = context.watch<PageIndex>().firstLoad;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 6.5.h),
      height: 10.h,
      color: primaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (firstLoad && !showGreetings && !showAppBarContent)
            Container(), // Blank for 2 seconds
          if (firstLoad && showGreetings && !showAppBarContent)
            const Greetings(), // Show Greetings for 2 seconds
          if (firstLoad && showAppBarContent)
            const AppBarContent(), // Replace with AppBarContent
          if (!firstLoad) const AppBarContent(),
        ],
      ),
    );
  }
}

final DateTime currentTime = DateTime.now();

String _getGreeting() {
  if (currentTime.hour >= 0 && currentTime.hour < 12) {
    return "Good Morning";
  } else if (currentTime.hour >= 12 && currentTime.hour < 16) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
}

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    bool myPasswordChangedText = context.watch<PageIndex>().passwordChangedText;

    return Center(
      child: Text(
        myPasswordChangedText ? "Password Changed Successfully" : _getGreeting(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

String customerTitle = "";
String customerName = "";

class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 5.w),
          padding: EdgeInsets.all(2.sp),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: (){
              GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.profileRouteName);
            },
            child: Row(
              children: [
                SizedBox(
                  child: Image.asset(appBarProfileImg),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 10),
                      child: Text(
                        _getGreeting(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, bottom: 10),
                      child: Text(
                        "$customerTitle $customerName",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 5.w),
          height: 18.h,
          width: 23.w,
          child: Image.asset(logoImg),
        )
      ],
    );
  }
}
