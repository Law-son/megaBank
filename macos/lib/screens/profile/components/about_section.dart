import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:sizer/sizer.dart';

//! About section for Profile screen

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 6.h,
          color: lightGrey,
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'About',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          height: 7.h,
          decoration: const BoxDecoration(
              color: primaryWhite,
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 182, 182, 182)),
              )),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Terms And Conditions',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 7.h,
          decoration: const BoxDecoration(
              color: primaryWhite,
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 182, 182, 182)),
              )),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}