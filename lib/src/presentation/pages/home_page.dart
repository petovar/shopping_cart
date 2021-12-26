import 'package:flutter/material.dart';
import 'package:shopping_cart/src/data/models/item.dart';
import 'package:shopping_cart/src/data/providers/items_provider.dart';

import '../widgets/carrito.dart';

class HomePage extends StatelessWidget {
  final ItemsProvider _itemsProvider = ItemsProvider();

  @override
  Widget build(BuildContext context) {
    // final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        backgroundColor: Colors.black,
        title: Text(
          'Tienda en línea',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: [
          Carrito(),
        ],
      ),
      body: _catalogoProductos(context),
    );
  }

  Widget _catalogoProductos(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              SizedBox(height: 10),
              _tituloSeccion('Catálogo de artículos'),
              SizedBox(height: 10),
            ],
          ),
        ),
        FutureBuilder<List<Item>>(
          future: _itemsProvider.requestItems(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final data = snapshot.data;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _item(data[index], context),
                    childCount: data.length,
                  ),
                );
                break;
              case ConnectionState.waiting:
                return SliverList(
                  delegate: SliverChildListDelegate(
                      [Center(child: CircularProgressIndicator())]),
                );
                break;
              default:
                return SliverList(
                  delegate: SliverChildListDelegate(
                      [Center(child: CircularProgressIndicator())]),
                );
            }
          },
        ),
      ],
    );
  }

  Padding _tituloSeccion(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _item(Item clothe, BuildContext context) {
    return Card(
      elevation: 16,
      margin: EdgeInsets.all(8),
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('detalle', arguments: clothe);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Hero(
                  tag: clothe.id,
                  child: FadeInImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/pucharse.png'),
                    image: NetworkImage(clothe.urlImage),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                clothe.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$ ${clothe.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
