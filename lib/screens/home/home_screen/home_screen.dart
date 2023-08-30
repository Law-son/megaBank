import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/screens/home/home_screen/components/account_balance.dart';
import 'package:megabank/screens/home/home_screen/components/custom_app_bar.dart';
import 'package:megabank/screens/home/home_screen/components/loading_widget.dart';
import 'package:megabank/screens/home/home_screen/components/transaction_tiles.dart';

import 'components/recent_transactions_tiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true; // Track if loading is still ongoing

  @override
  void initState() {
    super.initState();
    _showLoadingFor10Seconds();
  }

  Future<void> _showLoadingFor10Seconds() async {
    await Future.delayed(const Duration(milliseconds: 11000));
    setState(() {
      isLoading = false; // Loading is done, switch to TransactionTiles
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        color: primaryWhite,
        child: Center(
          child: Column(
            children: [
              const CustomAppBar(),
              const AccountBalance(),
              const RecentTransactionsTiles(),
              if (isLoading) // Show LoadingWidget while isLoading is true
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
