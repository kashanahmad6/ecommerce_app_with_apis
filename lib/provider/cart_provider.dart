import 'package:flutter/material.dart';
import 'package:shopping_app_with_apis/model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartItems = [];
  List<Cart> get cartItems => _cartItems;

  addToCart(Cart cartitem) {
    for (var item in _cartItems) {
      if (item.item.id == cartitem.item.id) {
        item.quanity += 1;
        notifyListeners();
        return;
      }
    }
    _cartItems.add(cartitem);
    notifyListeners();
  }

  removeFromCart(Cart cartitem) {
    _cartItems.remove(cartitem);
    notifyListeners();
  }
}
