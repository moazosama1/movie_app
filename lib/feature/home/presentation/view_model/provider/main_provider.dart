import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;
  int initialIndexHomeTap = 0;
  int initialIndexBrowsTap = 0;
  int initialIndexWatchListTap = 0;
  bool isLoading = false;
  bool addItem = false;
  customControlHomePage(value) {
    currentIndex = value;
    initialIndexHomeTap = 0;
    initialIndexWatchListTap = 0;
    notifyListeners();
  }

  customControlWatchListTap(value) {
    initialIndexWatchListTap = value;
    notifyListeners();
  }

  customControlHomeTap(value) {
    initialIndexHomeTap = value;
    currentIndex = 0;
    notifyListeners();
  }

  customControlBrowseTap(value) {
    initialIndexBrowsTap = value;
    notifyListeners();
  }

  customIsLoading() {
    isLoading = true;
    notifyListeners();
  }

  customIsAddItemLoading() {
    addItem = true;
    notifyListeners();
  }
}
