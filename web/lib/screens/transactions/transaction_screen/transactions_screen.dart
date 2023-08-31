import 'package:flutter/material.dart';
import 'package:flutter_tabbar_page/flutter_tabbar_page.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/screens/home/home_screen/components/custom_app_bar.dart';
import 'package:megabank/screens/transactions/transaction_screen/components/all_transactions.dart';
import 'package:megabank/screens/transactions/transaction_screen/components/credit_transactions.dart';
import 'package:megabank/screens/transactions/transaction_screen/components/debit_transactions.dart';
import 'package:sizer/sizer.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<PageTabItemModel> lstPages = <PageTabItemModel>[];
  final TabPageController _controller = TabPageController();

  @override
  void initState() {
    super.initState();
    lstPages.add(PageTabItemModel(
        title: "All", page: const AllTransactions()));
    lstPages.add(PageTabItemModel(
        title: "Debit", page: const DebitTransactions()));
    lstPages.add(PageTabItemModel(
        title: "Credit", page: const CreditTransactions()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        color: primaryWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(),
            Container(
              alignment: Alignment.centerLeft,
              color: lightGrey,
              padding: EdgeInsets.only(left: 20, top: 3.h),
              child: Text(
                'Transactions',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TabBarPage(
              controller: _controller,
              pages: lstPages,
              isSwipable: true,
              tabBackgroundColor: lightGrey,
              tabitemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _controller.onTabTap(index);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / lstPages.length,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Center(
                          child: Text(
                            lstPages[index].title ?? "",
                            style: TextStyle(
                                fontWeight: _controller.currentIndex == index
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                color: _controller.currentIndex == index
                                    ? primaryColor
                                    : primaryColor,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: _controller.currentIndex == index
                                ? primaryColor
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
