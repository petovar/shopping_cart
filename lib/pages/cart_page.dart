import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Productos seleccionados',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: Container(
          child: Center(
        child: Text('Listado de productos en el carrito'),
      )),
    );
  }
}
