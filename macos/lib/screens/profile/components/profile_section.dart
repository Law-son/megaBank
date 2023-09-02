import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:megabank/constants.dart';
import 'package:sizer/sizer.dart';

//! User Profile section for profile screen

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  late String userID = '';
  late String userTitle = '';
  late String gender = '';

  @override
  void initState() {
    super.initState();
    loadCustomerData();
  }

  // Load customer details from json data
  Future<void> loadCustomerData() async {
    final jsonString = await rootBundle.loadString('assets/customer_data.json');
    final jsonData = json.decode(jsonString);

    final customerStaticDataList = jsonData['customerStaticData'] as List;
    if (customerStaticDataList.isNotEmpty) {
      final customerStaticData = customerStaticDataList[0];
      final String customerID = customerStaticData['customerID'];
      final String title = customerStaticData['title'];
      final String userGender = customerStaticData['gender'];

      setState(() {
        userID = customerID;
        userTitle = title;
        if (userGender == 'M') {
          gender = "Male";
        } else {
          gender = "Female";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      color: lightPink,
      child: Row(children: [
        Container(
          height: 20.h,
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.transparent,
          child: Image.asset(
            profileImg,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 20.h,
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w, top: 2.h),
                          child: Text(
                            'FIRST NAME',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 7.5.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.w, top: 0),
                          child: Text(
                            'JOHN',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h, right: 9.w),
                          child: Text(
                            'OTHER NAMES',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 7.5.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0, right: 12.w),
                          child: Text(
                            'JIMOH',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 1.5.w, top: 2.5.h),
                          child: Text(
                            'GENDER',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 7.5.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.2.w, top: 0),
                          child: Text(
                            gender,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.5.h, right: 19.5.w),
                          child: Text(
                            'TITLE',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 7.5.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0, right: 19.w),
                          child: Text(
                            userTitle,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.3.w, top: 2.5.h),
                          child: Text(
                            'ID',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 7.5.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.3.w, top: 0),
                          child: Text(
                            userID,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
