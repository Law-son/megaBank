import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/screens/profile/components/about_section.dart';
import 'package:megabank/screens/profile/components/account_settings.dart';
import 'package:megabank/screens/profile/components/profile_section.dart';
import 'package:sizer/sizer.dart';

//! Profile screen class

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 25.w,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Icon(
                  Icons.chevron_left,
                  color: primaryWhite,
                  size: 20.sp,
                ),
              ),
              Text(
                'Back',
                style: TextStyle(color: primaryWhite, fontSize: 13.5.sp),
              )
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5.w),
            height: 18.h,
            width: 23.w,
            child: Image.asset(logoImg),
          )
        ],
      ),
      backgroundColor: primaryColor,
      body: Stack(children: [
        Container(
          color: primaryWhite,
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          child: const Column(
            children: [ProfileSection(), AccountSettings(), AboutSection()],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
          height: 7.h,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: primaryWhite,
              border: Border(
                top: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 182, 182, 182)),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'App Version',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),)
      ]),
    );
  }
}
