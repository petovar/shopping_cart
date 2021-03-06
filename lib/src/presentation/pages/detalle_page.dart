import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/core/utiles/messages.dart';

import '../../data/models/item.dart';
import '../bloc/listaDeseos/listadeseos_bloc.dart';

class DetallePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // print('entra build detail screen');
    final Item _clothe = ModalRoute.of(context).settings.arguments;
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _image(_clothe, _size),
              _title(_clothe.name, _clothe.price),
              _content(),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _btnAdd(_size, context, _clothe),
          ),
        ],
      ),
    );
  }

  Widget _image(Item clothe, Size size) {
    return Hero(
      tag: clothe.id,
      child: FadeInImage(
        width: double.infinity,
        height: size.height * 0.6,
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/images/pucharse.png'),
        image: NetworkImage(clothe.urlImage),
      ),
    );
  }

  Widget _title(String title, int price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            '\$ ${price.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
      child: Text('Detalles acerca del producto...'),
    );
  }

  Widget _btnAdd(Size size, BuildContext context, Item producto) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.black,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.all(16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
      ),
    );

    return Container(
      margin: EdgeInsets.zero,
      width: size.width * 0.70,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          BlocProvider.of<ListadeseosBloc>(context).add(AddItem(producto));
          Messages.info(context, 'Art??culo a??adido al carrito');
          // _showSnackbar(context);
        },
        child: Text(
          'A??adir al carrito',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // _showSnackbar(BuildContext context) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.grey.shade400,
  //           content: Text('Art??culo a??adido al carrito'),
  //           duration: Duration(milliseconds: 1000),
  //         ),
  //       )
  //       .closed
  //       .then(
  //         (value) => Future.delayed(
  //           const Duration(milliseconds: 100),
  //           () => Navigator.of(context).pop(),
  //         ),
  //       );
  // }
}
