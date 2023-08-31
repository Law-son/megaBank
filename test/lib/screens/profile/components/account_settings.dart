import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/routes/app_route_constants.dart';
import 'package:sizer/sizer.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 6.h,
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Account Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.changePasswordRouteName);
          },
          child: Container(
            height: 7.h,
            decoration: const BoxDecoration(
                color: primaryWhite,
                border: Border(
                  bottom: BorderSide(
                      width: 0.5, color: Color.fromARGB(255, 182, 182, 182)),
                )),
            child: Row(
              children: [
                Image.asset(
                  lockIcon,
                  width: 16.w,
                  height: 16.h,
                ),
                Text(
                  'Change Account Password',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.initialRouteName);
          },
          child: Container(
            height: 7.h,
            decoration: const BoxDecoration(
                color: primaryWhite,
                border: Border(
                  bottom: BorderSide(
                      width: 0.5, color: Color.fromARGB(255, 182, 182, 182)),
                )),
            child: Row(
              children: [
                Image.asset(
                  logoutIcon,
                  width: 16.w,
                  height: 16.h,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
