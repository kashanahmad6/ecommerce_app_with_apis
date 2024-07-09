import 'package:flutter/material.dart';
import 'package:shopping_app_with_apis/model/item_model.dart';
import 'package:shopping_app_with_apis/networking/api_services.dart';

class ShopProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  List<Item> _items = [];

  List<Item> get items => _items;

  int get selectedIndex => _selectedIndex;

  Future<void> getItems() async {
    final data = await ApiServices().getData();

    _items = data;
  }

  set setIndex(int newindex) {
    _selectedIndex = newindex;
    notifyListeners();
  }
}
