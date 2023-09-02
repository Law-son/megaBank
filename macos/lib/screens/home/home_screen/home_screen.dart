import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/models/provider/page_index_provider.dart';
import 'package:megabank/screens/home/home_screen/components/account_balance.dart';
import 'package:megabank/screens/home/home_screen/components/loading_widget.dart';
import 'package:megabank/screens/home/home_screen/components/transaction_tiles.dart';
import 'package:provider/provider.dart';

import 'components/recent_transactions_tiles.dart';

//! Home screen class

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true; // Track if loading is still ongoing
  bool _isMounted = true; // Track if the widget is mounted

  @override
  void initState() {
    super.initState();
    _showLoadingFor10Seconds();
  }

  @override
  void dispose() {
    _isMounted = false; // Mark the widget as disposed
    super.dispose();
  }

  //displays loading animation for 10 seconds
  Future<void> _showLoadingFor10Seconds() async {
    await Future.delayed(const Duration(milliseconds: 11000));
    if (_isMounted) {
      setState(() {
        isLoading = false; // Loading is done, switch to TransactionTiles
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool loadingValid = context.watch<PageIndex>().loadingValid;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        color: primaryWhite,
        child: Center(
          child: Column(
            children: [
              const AccountBalance(),
              const RecentTransactionsTiles(),
              if (isLoading && loadingValid) // Show LoadingWidget while isLoading is true
                const Expanded(child: LoadingWidget())
              else
                const TransactionTiles(), // Show TransactionTiles when isLoading is false
            ],
          ),
        ),
      ),
    );
  }
}
