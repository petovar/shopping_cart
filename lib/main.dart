import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/listaDeseos/listadeseos_bloc.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/pages/detalle_page.dart';
import 'package:shopping_cart/pages/home_page.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListadeseosBloc>(create: (_) => ListadeseosBloc() )
      ], 
      child: MyApp(),
    );
  }
}

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
