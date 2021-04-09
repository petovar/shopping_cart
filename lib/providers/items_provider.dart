import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart/models/list_items.dart';

class ItemsProvider {
  // final url = 'https://infomath-b5ab3.firebaseio.com/.json';
// https://shoppingcart-f64c3-default-rtdb.firebaseio.com/.json
  final url = 'https://shoppingcart-f64c3-default-rtdb.firebaseio.com/.json';

  Future<List<Item>> requestItems() async {
    var resp = await http.get(url);

    print(resp);

    Map<String, dynamic> data = jsonDecode(resp.body);
    final items = ListItems.fromJson(data);
    return items.items;
  }
}
