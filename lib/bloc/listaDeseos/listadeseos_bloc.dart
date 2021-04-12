import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart/models/item.dart';

part 'listadeseos_event.dart';
part 'listadeseos_state.dart';

List<Item> _listado = [];

class ListadeseosBloc extends Bloc<ListadeseosEvent, ListadeseosState> {
  ListadeseosBloc() : super(ListadeseosState());

  @override
  Stream<ListadeseosState> mapEventToState(
    ListadeseosEvent event,
  ) async* {
    if (event is AddItem) {
      _listado.add(event.item);

      yield ListadeseosState(
        count: state.count + 1,
        listado: _listado,
      );
    } else if (event is ClearLista) {
      _listado.clear();
      yield ListadeseosState(
        count: 0,
        listado: _listado,
      );
    } else if (event is DelItem) {
      _listado.remove(event.item);
      yield ListadeseosState(
        count: state.count - 1,
        listado: _listado,
      );     
    }
  }
}
