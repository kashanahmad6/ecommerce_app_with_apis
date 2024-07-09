// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_with_apis/model/cart_model.dart';

import 'package:shopping_app_with_apis/model/item_model.dart';
import 'package:shopping_app_with_apis/provider/cart_provider.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  Item item;
  ProductDetails({
    super.key,
    required this.item,
  });

  final ValueNotifier<int> quantity = ValueNotifier<int>(1);

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    item.imgurl,
                    height: 300,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    item.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' \$ ${item.price.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(item.description),
                ],
              ),
              ValueListenableBuilder(
                  valueListenable: quantity,
                  builder: (BuildContext context, int value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Quantity:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.grey.shade400),
                            elevation: const WidgetStatePropertyAll(10),
                          ),
                          onPressed: () {
                            incrementQuantity();
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          value.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                quantity.value > 1
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade200),
                            elevation: const WidgetStatePropertyAll(10),
                          ),
                          onPressed: () {
                            decrementQuantity();
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                      ],
                    );
                  }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text(
                              'Are you sure?Do youn want to add to cart'),
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    cartprovider.addToCart(Cart(
                                        item: item, quanity: quantity.value));
                                    Navigator.pop(context);

                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return CartScreen(
                                    //     cart: Cart(
                                    //         item: item, quanity: quantity.value),
                                    //   );
                                    // }));
                                  },
                                  child: const Text('yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('no'),
                                ),
                              ],
                            )
                          ],
                        );
                      });
                },
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
