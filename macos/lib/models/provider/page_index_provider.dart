import 'package:flutter/material.dart';

//!App's state management done with Provider

class PageIndex with ChangeNotifier {
  bool _homeSelected =
      true; //for handling what happens when home button is tapped
  bool _transactionSelected =
      false; //for handling what happens when transaction button is tapped
  bool _firstLoad = true; //handles the load event on the custom app bar
  bool _loadingValid = true; //handles the load event on the home screen
  int _pageIndex =
      0; //handles page index for switching between screens with the bottom nav bar
  bool _passwordChangedText =
      false; //tracks when password is changed to display password changed text

  bool get homeSelected => _homeSelected;
  bool get transactionSelected => _transactionSelected;
  bool get firstLoad => _firstLoad;
  bool get loadingValid => _loadingValid;
  int get pageIndex => _pageIndex;
  bool get passwordChangedText => _passwordChangedText;

  //sets _passwordChangedText to true so that password changed text would be displayed
  void setPasswordChangedText() {
    _passwordChangedText = true;
    notifyListeners();
  }

  //sets _firstLoad to true so that load event on custom app bar would be visible
  void setFirstLoadTrue() {
    _firstLoad = true;
    notifyListeners();
  }

  //sets _firstLoad to false so that load event on custom app bar wont be visible
  void setFirstLoadFalse() {
    _firstLoad = false;
    notifyListeners();
  }

  // sets _loadingValid to false so that load event on home screen wont happen
  void stopLoading() {
    _loadingValid = false;
    notifyListeners();
  }

  //initialises the necessary variables to correctly set the state when the home button is pressed
  void selectHome() {
    _homeSelected = true;
    _transactionSelected = false;
    _pageIndex = 0;
    notifyListeners();
  }

  //initialises the necessary variables to correctly set the state when the transaction button is pressed
  void selectTransaction() {
    _homeSelected = false;
    _transactionSelected = true;
    _pageIndex = 1;
    notifyListeners();
  }
}
