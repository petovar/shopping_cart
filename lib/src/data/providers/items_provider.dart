import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/list_items.dart';

class ItemsProvider {
  // final url = 'https://infomath-b5ab3.firebaseio.com/.json';
// https://shoppingcart-f64c3-default-rtdb.firebaseio.com/.json
  final url = 'https://shoppingcart-f64c3-default-rtdb.firebaseio.com/.json';

  Future<List<Item>> requestItems() async {
    var resp = await http.get(url);
    if (resp.statusCode == 423) {
      print('Ha ocurrido un error');
      return [];
    } else {
      Map<String, dynamic> data = jsonDecode(resp.body);
      print(data);

      final items = ListItems.fromJson(data);
      return items.items;
    }
  }
}
