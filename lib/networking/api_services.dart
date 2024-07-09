import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_with_apis/model/item_model.dart';

class ApiServices {
  Future<List<Item>> getData() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        final data = body.map((e) {
          return Item.fromJson(e);
        }).toList();

        // List<Item> data = [];

        // for (var (index, item) in body.indexed) {

        //   data.add(Item.fromJson(item));
        // }
        return data;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    return [];
  }
}
