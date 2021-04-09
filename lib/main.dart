import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/pages/detalle_page.dart';
// import 'package:shopping_cart/pages/detalle_page.dart';
import 'package:shopping_cart/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final home = HomePage();
  final cart = CartPage();
  final detalle = DetallePage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShoppingCart',
      home: HomePage(),
      routes: {
        'home': (BuildContext context) => home,
        'cart': (BuildContext context) => cart,
        'detalle': (BuildContext context) => detalle,
      },
    );
  }
}
