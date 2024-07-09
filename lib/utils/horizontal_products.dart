import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_with_apis/provider/shop_provider.dart';

class HorizontailProducts extends StatefulWidget {
  const HorizontailProducts({super.key});

  @override
  State<HorizontailProducts> createState() => _HorizontailProductsState();
}

class _HorizontailProductsState extends State<HorizontailProducts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, value, child) {
        return CarouselSlider(
          items: value.items.map((e) {
            return Image.network(
              e.imgurl,
              height: 100,
              width: double.infinity,
            );
          }).toList(),
          options: CarouselOptions(
              autoPlay: true, aspectRatio: 2, enlargeCenterPage: true),
        );
      },
    );
  }
}



//  FutureBuilder(
//       future: ApiServices().getData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final items = snapshot.data;
//           return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: items!.length,
//               itemBuilder: (context, index) {
//                 final item = items[index];
//                 return Container(
//                   width: 180,
//                   margin: const EdgeInsets.only(bottom: 10),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       fit: BoxFit.contain,
//                       image: NetworkImage(item.imgurl),
//                     ),
//                   ),
//                 );
//               });
//         } else if (snapshot.hasError) {
//           return Text(snapshot.error.toString());
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );