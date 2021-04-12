import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/listaDeseos/listadeseos_bloc.dart';
import 'package:shopping_cart/bloc/whislist/wishlist_bloc.dart';

class CartPage extends StatelessWidget {
  final WishlistBloc bloc = WishlistBloc();
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
              Expanded(
                child: _listadoDeseos(),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _btnProceder(_size, context),
          ),
        ],
      ),
    );
  }

  Widget _listadoDeseos() {
    return BlocBuilder<ListadeseosBloc, ListadeseosState>(
      builder: (context, state) {
        //final _listadoBloc = BlocProvider.of<ListadeseosBloc>(context);
        final _listado = state.listado ?? [];
        // print(state.listado[0]);
        return Container(
          child: Center(
            child: Text('${_listado.length}'),
          ),
        );

        // ListView.builder(
        //   itemCount: _listado.length,
        //   itemBuilder: (_, i) {
        //     return Dismissible(
        //       key: Key(_listado[i].id.toString()),
        //       direction: DismissDirection.startToEnd,
        //       onDismissed: (direction) {
        //         // Remove the item from the data source.
        //         _listadoBloc.add(DelItem(_listado[i]));
        //         //items.removeAt(index);
        //       },
        //       child: ListTile(
        //         title: Text('${_listado[i].name}'),
        //       ),
        //     );
        //   },
        // );
      },
    );
  }

  Widget _btnProceder(Size size, BuildContext context) {
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
          BlocProvider.of<ListadeseosBloc>(context).add(ClearLista());
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
