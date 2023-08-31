import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:sizer/sizer.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            miniBackground,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            height: 20.h,
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Account Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "GHC 10,000.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Checking Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 10),
                      child: Text(
                        "875431143137098707",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
