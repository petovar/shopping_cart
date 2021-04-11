import 'dart:async';

import 'package:shopping_cart/bloc/whislist/repositorio_bloc.dart';

class WishlistBase {}

class AddProducto extends WishlistBase {}

class RemProducto extends WishlistBase {}

class ClearProductos extends WishlistBase {}

class WishlistBloc {
  //
  RepositorioBloc _repositorio = RepositorioBloc();
  //
  StreamController<WishlistBase> _entrada = StreamController();
  StreamController<int> _salida = StreamController<int>();
  //
  // Stream<int> get counterStream => _salida.stream;
  Stream<int> get counterStream => _salida.stream;

  StreamSink<WishlistBase> get sendEvent => _entrada.sink;
  //
  WishlistBloc() {
    _salida.add(_repositorio.get());
    _entrada.stream.listen(_onEvent);
  }
  //
  dispose() {
    _entrada.close();
    _salida.close();
  }

  void _onEvent(WishlistBase event) {
    if (event is AddProducto) {
      _repositorio.incrementar();
    } else {
      if (event is RemProducto) {
        if (_repositorio.get() != 0) {
          _repositorio.disminuir();
        }
      } else {
        _repositorio.clear();
      }
    }
    //print(_repositorio.get());
    _salida.add(_repositorio.get());
  }
}
