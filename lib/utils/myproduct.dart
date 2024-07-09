// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Myproduct extends StatelessWidget {
  final String img;
  final String title;
  final num price;

  const Myproduct({
    super.key,
    required this.img,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Card(
              elevation: 5,
              child: Container(
                height: 150,
                width: 130,
                // padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(img),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' \$${price.toString()}',
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
