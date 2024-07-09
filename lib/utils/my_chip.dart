// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_with_apis/provider/shop_provider.dart';

// ignore: must_be_immutable
class MyChip extends StatefulWidget {
  int selectedIndex;
  MyChip({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  void initState() {
    super.initState();
  }

  List<String> categories = [
    'Mens clothing',
    'Womens Clothing',
    'Jewellery',
    'Electronics',
  ];

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                shopProvider.setIndex = index;
              },
              child: Chip(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                backgroundColor: shopProvider.selectedIndex == index
                    ? Colors.black
                    : Colors.white,
                label: Text(
                  category,
                  style: TextStyle(
                    color: shopProvider.selectedIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
