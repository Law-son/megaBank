import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:megabank/constants.dart';
import 'package:sizer/sizer.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    Key? key,
    required this.amount,
    required this.transactionDirection,
    required this.transactionNarration,
    required this.date,
  }) : super(key: key);

  final int amount;
  final String transactionDirection;
  final String transactionNarration;
  final String date;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  late Widget transactionIcon;
  late Color iconBgColor;
  late Color textColor;
  late String tranDirection;
  late String tranIcon;

  @override
  void initState() {
    super.initState();
    tranDirection = widget.transactionDirection == 'C' ? "Credit" : "Debit";
    iconBgColor = widget.transactionDirection == 'C' ? lightPink : lightBlue;
    tranIcon = widget.transactionDirection == 'C' ? creditIcon : debitIcon;
    textColor =
        widget.transactionDirection == 'C' ? primaryYellow : primaryColor;
    transactionIcon = widget.transactionDirection == 'C'
        ? Image.asset(
            creditIcon,
            width: 7.w,
            height: 7.h,
          )
        : Image.asset(
            debitIcon,
            width: 7.w,
            height: 7.h,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8.5.h,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 182, 182, 182)),
          )),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 16, 10),
            child: CircleAvatar(
              radius: 18.sp,
              backgroundColor: iconBgColor,
              child: Image.asset(
                tranIcon,
                width: 15.w,
                height: 15.h,
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "GHC ${NumberFormat('#,##0.00').format(widget.amount)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 10.w,
                          height: 2.5.h,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 7, top: 8),
                          decoration: BoxDecoration(
                              color: iconBgColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            tranDirection,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                               TextSpan(
                                  text: '#',
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.w800)),
                              TextSpan(
                                text: widget.transactionNarration,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              )
                            ]))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.5, right: 20),
                  child: Text(
                    widget.date,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
