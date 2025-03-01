import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int initialIndex = 0;

  void updateIndex(int index) {
    initialIndex = index;
    notifyListeners();
  }

  void nextPage() {
    if (initialIndex < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLastPage() {
    pageController.jumpToPage(3);
  }

  bool get isLastScreen => initialIndex == 3;
}
