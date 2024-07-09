import 'package:flutter/material.dart';
import 'package:shopping_app_with_apis/provider/shop_provider.dart';

import 'package:shopping_app_with_apis/screens/products_screen.dart';

import 'package:shopping_app_with_apis/utils/horizontal_products.dart';
import 'package:shopping_app_with_apis/utils/my_chip.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ShopProvider>(context, listen: false).items;
    List<Widget> screens = [
      ProductPage(
        filteredlist: products
            .where((content) => content.category == "men's clothing")
            .toList(),
      ),
      ProductPage(
        filteredlist: products
            .where((content) => content.category == "women's clothing")
            .toList(),
      ),
      ProductPage(
        filteredlist: products
            .where((content) => content.category == "jewelery")
            .toList(),
      ),
      ProductPage(
        filteredlist: products
            .where((content) => content.category == "electronics")
            .toList(),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('SHOP'),
        ),
        body: Consumer<ShopProvider>(
          builder: (context, value, child) {
            return SafeArea(
              child: Column(children: [
                const SizedBox(
                  height: 120,
                  child: HorizontailProducts(),
                ),
                SizedBox(
                    height: 70,
                    child: MyChip(
                      selectedIndex: value.selectedIndex,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: screens[value.selectedIndex],
                ),
              ]),
            );
          },
        ));
  }
}
