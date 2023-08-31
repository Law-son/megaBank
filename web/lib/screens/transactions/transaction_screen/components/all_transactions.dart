import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/models/customer_data.dart';
import 'package:megabank/screens/home/home_screen/components/custom_list_tile.dart';
import 'package:megabank/screens/home/home_screen/components/modal_bottom_sheet.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  late List<CustomerTransactionData> transactions = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCustomerTransactions();
  }

  Future<void> loadCustomerTransactions() async {
    final jsonString = await rootBundle.loadString(customerData);
    final jsonData = json.decode(jsonString);

    final transactionList = jsonData['customerTransactionData'] as List;
    transactions = transactionList
        .map((transaction) => CustomerTransactionData.fromJson(transaction))
        .toList();

    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return GestureDetector(
            onTap: (){
              showMyBottomSheet(context, transaction.transactionAmount, transaction.transactionDate, transaction.transactionDirection, transaction.transactionNarration);
            },
            child: CustomListTile(
              amount: transaction.transactionAmount,
              transactionDirection: transaction.transactionDirection,
              transactionNarration: transaction.transactionNarration,
              date: transaction.transactionDate,
            ),
          );
        },
      ),
    );
  }
}