import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart/models/producto_model.dart';

class ProductosProvider {
  final url = 'https://shoppingcart-f64c3-default-rtdb.firebaseio.com/.json';

  Future<List<Producto>> cargarProductos() async {
    var resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    // print(decodeData);

    if (decodeData == 404) {
      //decodeData contiene el valor de 400 'not found'
      //Esto ocurre cuando el servidor API esta caido, en cuyo caso deberia mostar
      //algun tipo de alerta que indique que no se pudo establecer conexion
      //con el servidor de datos
      //_mostrarAlerta(context, 'No se pudo establecer conexión con el servidor');
      return [];
    } else {
      //
      final productos = new Productos.fromJsonList(decodeData);

      // print('prod]uctos.items');

      return productos.items;

      //
    }
  }
}
