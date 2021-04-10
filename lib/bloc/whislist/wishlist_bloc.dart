import 'dart:async';

import 'package:shopping_cart/bloc/whislist/repositorio_bloc.dart';

class WishlistBase {}

class AddProducto extends WishlistBase {}

class RemProducto extends WishlistBase {}

class WishlistBloc {
  //
  RepositorioBloc _repositorio = RepositorioBloc();
  //

  StreamController<WishlistBase> _entrada = StreamController();
  StreamController<int> _salida = StreamController();

  Stream<int> get counterStream => _salida.stream;
  StreamSink<WishlistBase> get sendEvent => _entrada.sink;

  WishlistBloc() {
    _entrada.stream.listen(_onEvent);
  }

  dispose() {
    _entrada.close();
    _salida.close();
  }

  void _onEvent(WishlistBase event) {
    if (event is AddProducto) {
      _repositorio.incrementar();
    } else {
      if (_repositorio.get() != 0) {
        _repositorio.disminuir();
      }
    }
    print(_repositorio.get());
    _salida.add(_repositorio.get());
  }
}
