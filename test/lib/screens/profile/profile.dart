import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/screens/profile/components/profile_section.dart';
import 'package:sizer/sizer.dart';

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
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Icon(Icons.chevron_left,
                color: primaryWhite,
                size: 20.sp,),
              ),
              Text('Back',
              style: TextStyle(
                color: primaryWhite,
                fontSize: 13.5.sp
              ),
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
      body: Container(
        color: lightGrey,
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: const Column(
          children: [
            ProfileSection()
          ],
        ),
      ),
    );
  }
}