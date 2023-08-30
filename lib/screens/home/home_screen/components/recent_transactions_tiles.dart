import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:sizer/sizer.dart';

class RecentTransactionsTiles extends StatelessWidget {
  const RecentTransactionsTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: double.infinity,
      color: lightGrey,
      margin: EdgeInsets.only(bottom: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Recent Transactions",
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "See All",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
