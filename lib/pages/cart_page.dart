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
          // TODO: Insertar in wish list
          //bloc.sendEvent;
          _showSnackbar(context);
        },
        child: Text(
          'Proceder...',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            backgroundColor: Colors.grey.shade400,
            content: Text('Compra realizada con éxito !!!'),
            duration: Duration(milliseconds: 1000),
          ),
        )
        .closed
        .then(
          (value) => Future.delayed(
            const Duration(milliseconds: 100),
            () => Navigator.of(context).pop(),
          ),
        );
  }
}
