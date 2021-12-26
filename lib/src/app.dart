import 'package:flutter/material.dart';

import 'presentation/pages/cart_page.dart';
import 'presentation/pages/detalle_page.dart';
import 'presentation/pages/home_page.dart';

class App extends StatelessWidget {
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