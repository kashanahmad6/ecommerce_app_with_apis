import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_with_apis/provider/bottom_navigation_bar_provider.dart';
import 'package:shopping_app_with_apis/screens/cart_screen.dart';
import 'package:shopping_app_with_apis/screens/main_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    const MainScreen(),
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
