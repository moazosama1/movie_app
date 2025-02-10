import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;
  int initialIndexHomeTap = 0;
  int initialIndexBrowsTap = 0;
  customControlHomePage(value) {
    currentIndex = value;
    initialIndexHomeTap = 0;
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
}
