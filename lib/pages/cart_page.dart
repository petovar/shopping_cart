import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Productos seleccionados',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _listadoWish(),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _btnAdd(_size, context),
          ),
        ],
      ),
    );
  }

  Widget _listadoWish() {
    return Container(
      child: Center(
        child: Text('La lista Wish'),
      ),
    );
  }

  Widget _btnAdd(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: size.width * 0.70,
      child: RaisedButton(
        color: Colors.black,
        textColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Proceder ...',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
        ),
        onPressed: () {
          // TODO: Limpiar wish list - Realizar la compra
          _showSnackbar(context);
        },
      ),
    );
  }

  _showSnackbar(BuildContext context) {
    _scaffoldKey.currentState
        .showSnackBar(
          SnackBar(
            backgroundColor: Colors.grey.shade400,
            content: Text('Compra realizada con éxito !!!'),
            duration: Duration(milliseconds: 1000),
          ),
        )
        .closed
        .then((value) => Navigator.of(context).pop());
  }
}
