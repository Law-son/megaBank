import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key, required this.amount});
  final int amount;

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Function to show the modal bottom sheet
void showMyBottomSheet(BuildContext context, int amount, String date,
    String transactionDirection, String transactionNaration) {
      String tranDirection = transactionDirection == 'C' ? "Credit" : "Debit";

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height / 0.3,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Text(
                "Transaction Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 3.h),
                  child: Text(
                    "Balance Before Transaction",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 3.h),
                  child: Text(
                    "GHC 0.00",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 1.h),
                  child: Text(
                    "Balance After Transaction",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 1.h),
                  child: Text(
                    "GHC ${NumberFormat('#,##0.00').format(amount)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 1.h),
                  child: Text(
                    "Transaction Date",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 1.h),
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 1.h),
                  child: Text(
                    "Transaction Direction",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 1.h),
                  child: Text(
                    tranDirection,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 1.h),
                  child: Text(
                    "Transaction Naration",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 1.h),
                  child: Text(
                    transactionNaration,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.3,
            ),
          ],
        ),
      );
    },
  );
}
