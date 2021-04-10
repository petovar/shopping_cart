import 'dart:async';

class ContadorBase {}

class AddProducto extends ContadorBase {}

class RemProducto extends ContadorBase {}

class ContadorBloc {
  int _count = 0;

  StreamController<ContadorBase> _entrada = StreamController();
  StreamController<int> _salida = StreamController();

  Stream<int> get counterStream => _salida.stream;
  StreamSink<ContadorBase> get sendEvent => _entrada.sink;

  ContadorBloc() {
    _entrada.stream.listen(_onEvent);
  }

  dispose() {
    _entrada.close();
    _salida.close();
  }

  void _onEvent(ContadorBase event) {
    if (event is AddProducto) {
      _count++;
    } else {
      if (_count != 0) {
        _count--;
      }
    }

    _salida.add(_count);
  }
}
