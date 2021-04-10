class RepositorioBloc {
  int _count = 0;

  static RepositorioBloc _instancia = RepositorioBloc._internal();

  RepositorioBloc._internal();

  factory RepositorioBloc() {
    return _instancia;
  }

  int get() {
    return _count;
  }

  void incrementar() {
    _count++;
  }

  void disminuir() {
    if (_count != 0) {
      _count--;
    }
  }

  void clear() {
    _count = 0;
  }
}
