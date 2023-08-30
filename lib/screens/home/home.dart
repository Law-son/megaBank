import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/models/provider/page_index_provider.dart';
import 'package:megabank/screens/home/home_screen/home_screen.dart';
import 'package:megabank/screens/home/transaction_screen/transactions_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const TransactionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    pageIndex = context.watch<PageIndex>().pageIndex;
    bool homeSelected = context.watch<PageIndex>().homeSelected;
    bool transactionSelected = context.watch<PageIndex>().transactionSelected;

    return Scaffold(
      backgroundColor: primaryColor,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 10.h,
        decoration: BoxDecoration(
          color: homeSelected ? primaryColor : primaryWhite,
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.read<PageIndex>().setFirstLoadFalse();
                context.read<PageIndex>().selectHome();
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 10.h,
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.2),
                      child: Image.asset(
                        homeSelected ? homeIconSelected : homeIcon,
                        width: 7.w,
                        height: 7.h,
                      ),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: homeSelected ? primaryYellow : primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<PageIndex>().setFirstLoadFalse();
                context.read<PageIndex>().selectTransaction();
              },
              child: ClipPath(
                clipper: RightTabClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 10.h,
                  color: transactionSelected ? primaryColor : primaryWhite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.2),
                        child: Image.asset(
                          transactionSelected
                              ? transactionsIconSelected
                              : transactionsIcon,
                          width: 7.w,
                          height: 7.h,
                        ),
                      ),
                      Text(
                        'Transactions',
                        style: TextStyle(
                          color: transactionSelected
                              ? primaryYellow
                              : primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RightTabClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.1, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
