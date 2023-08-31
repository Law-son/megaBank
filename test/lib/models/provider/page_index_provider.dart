import 'package:flutter/material.dart';

class PageIndex with ChangeNotifier {
  bool _homeSelected = true;
  bool _transactionSelected = false;
  bool _firstLoad = true;
  bool _loadingValid = true;
  int _pageIndex = 0;

  bool get homeSelected => _homeSelected;
  bool get transactionSelected => _transactionSelected;
  bool get firstLoad => _firstLoad;
  bool get loadingValid => _loadingValid;
  int get pageIndex => _pageIndex;

  void setFirstLoadTrue() {
    _firstLoad = true;
    notifyListeners();
  }

  void setFirstLoadFalse() {
    _firstLoad = false;
    notifyListeners();
  }

  void stopLoading() {
    _loadingValid = false;
  }

  void selectHome() {
    _homeSelected = true;
    _transactionSelected = false;
    _pageIndex = 0;
    notifyListeners();
  }

  void selectTransaction() {
    _homeSelected = false;
    _transactionSelected = true;
    _pageIndex = 1;
    notifyListeners();
  }
}
