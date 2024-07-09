// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_with_apis/model/cart_model.dart';
import 'package:shopping_app_with_apis/provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  final Cart? cart;
  const CartScreen({
    Key? key,
    this.cart,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          Icon(
            Icons.shopping_bag,
            color: Colors.grey.shade600,
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<CartProvider>(
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  final cartitems = value.cartItems[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                    decoration: BoxDecoration(
                        border: Border.all(), color: Colors.grey.shade200),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: Image.network(cartitems.item.imgurl),
                      ),
                      title: Text(cartitems.item.title),
                      subtitle: Text('Quantity : ${cartitems.quanity}'),
                      trailing: IconButton(
                        onPressed: () {
                          value.removeFromCart(cartitems);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
