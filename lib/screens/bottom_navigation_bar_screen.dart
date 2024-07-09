import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_with_apis/provider/bottom_navigation_bar_provider.dart';
import 'package:shopping_app_with_apis/screens/cart_screen.dart';
import 'package:shopping_app_with_apis/screens/shopping_screen.dart';

class BottomNaviagationScreen extends StatefulWidget {
  const BottomNaviagationScreen({super.key});

  @override
  State<BottomNaviagationScreen> createState() =>
      _BottomNaviagationScreenState();
}

class _BottomNaviagationScreenState extends State<BottomNaviagationScreen> {
  List<Widget> screens = [
    const ShoppingScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: screens[bottomProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            bottomProvider.setIndex = index;
          },
          currentIndex: bottomProvider.selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Cart'),
          ]),
    );
  }
}
