import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:sizer/sizer.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 20.h,
              color: lightPink,
              child: Row(
                children: [
                  Container(
                    height: 20.h,
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.transparent,
                    child: Image.asset(profileImg,
                    fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 20.h,
                    width: MediaQuery.of(context).size.width/2,
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
                                    child: Text('FIRST NAME',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 7.5.sp,
                                        fontWeight: FontWeight.w400
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0.w, top: 0),
                                    child: Text('JOHN',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400
                                      ),
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
                                    padding: EdgeInsets.only(top: 2.h, right: 9.5.w),
                                    child: Text('OTHER NAMES',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 7.5.sp,
                                        fontWeight: FontWeight.w400
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0, right: 12.w),
                                    child: Text('JIMOH',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400
                                      ),
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
                                    padding: EdgeInsets.only(left: 3.w, top: 2.5.h),
                                    child: Text('GENDER',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 7.5.sp,
                                        fontWeight: FontWeight.w400
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3.2.w, top: 0),
                                    child: Text('MALE',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400
                                      ),
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
                                    child: Text('TITLE',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 7.5.sp,
                                        fontWeight: FontWeight.w400
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0, right: 19.w),
                                    child: Text('MR',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400
                                      ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,//todo: Remember to use CrossAxisAlignment Throughout
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3.3.w, top: 2.5.h),
                                    child: Text('ID',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 7.5.sp,
                                        fontWeight: FontWeight.w400
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3.3.w, top: 0),
                                    child: Text('299292',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400
                                      ),
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