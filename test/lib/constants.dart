import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor themeColor = MaterialColor(
    0xFF022E64, // Set the primary color to #022E64
    <int, Color>{
      50: Color(0xFFE1E9FF), // Adjust shades accordingly
      100: Color(0xFFB0CFFF),
      200: Color(0xFF7E9BFF),
      300: Color(0xFF4C68E8),
      400: Color(0xFF2540C7),
      500: Color(0xFF022E64), // Primary color
      600: Color(0xFF011C48),
      700: Color(0xFF001332),
      800: Color(0xFF000B1C),
      900: Color(0xFF00050A),
    },
  );
}

//customer data
const customerData = "assets/customer_data.json";

//app color definition
const primaryColor = Color.fromRGBO(2, 46, 100, 1);
const primaryYellow = Color.fromRGBO(230, 176, 20, 1);
const lightGrey = Color.fromRGBO(245, 247, 250, 1);
const lightBlue = Color.fromRGBO(244, 251, 253, 1);
const lightPink = Color.fromRGBO(253, 248, 236, 1);
const primaryWhite = Color.fromRGBO(255, 255, 255, 1);

//app image definition
const appBarProfileImg = 'assets/images/appBar_profile_img.png';
const loadingImg = 'assets/images/Loading.png';
const logoImg = 'assets/images/logo.png';
const miniBackground = 'assets/images/mini_background.png';
const profileImg = 'assets/images/profile_img.png';

//app icon definition
const creditIcon = 'assets/icons/credit_icon.png';
const debitIcon = 'assets/icons/debit_icon.png';
const homeIcon = 'assets/icons/home_icon.png';
const homeIconSelected = 'assets/icons/home_icon_selected.png';
const lockIcon = 'assets/icons/lock_icon.png';
const logoutIcon = 'assets/icons/logout_icon.png';
const transactionsIcon = 'assets/icons/transactions_icon.png';
const transactionsIconSelected = 'assets/icons/transactions_icons_selected.png';