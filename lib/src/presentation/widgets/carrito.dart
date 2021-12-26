import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/listaDeseos/listadeseos_bloc.dart';

class Carrito extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListadeseosBloc, ListadeseosState>(
      builder: (context, state) {
        return Container(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: state.count == 0
                  ? Colors.white
                  : Colors.yellow[900],
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('cart', arguments: Null);
                },
              ),
              Text(
                '${state.count}',
                style: TextStyle(
                fontSize: 12.0,
                color: state.count == 0 
                  ? Colors.black
                  : Colors.white
                ),
              )],
          ),
        );
      },
    );
  }
}