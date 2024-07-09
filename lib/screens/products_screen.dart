// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_with_apis/model/item_model.dart';
import 'package:shopping_app_with_apis/provider/shop_provider.dart';
import 'package:shopping_app_with_apis/screens/filtered_product_screen.dart';
import 'package:shopping_app_with_apis/utils/myproduct.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  List<Item> filteredlist;

  ProductPage({
    Key? key,
    required this.filteredlist,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, value, child) {
        final filtereditems = widget.filteredlist;

        return GridView.builder(
            shrinkWrap: true,
            itemCount: filtereditems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.77, crossAxisCount: 2),
            itemBuilder: (context, index) {
              final item = filtereditems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FilteredProductScreen(item: item);
                  }));
                },
                child: Myproduct(
                  img: item.imgurl.toString(),
                  title: item.title.toString(),
                  price: item.price,
                ),
              );
            });
      },
    );
  }
}
