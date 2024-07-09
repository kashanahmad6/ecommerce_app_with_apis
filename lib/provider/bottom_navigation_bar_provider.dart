import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set setIndex(int newindex) {
    _selectedIndex = newindex;
    notifyListeners();
  }
}
