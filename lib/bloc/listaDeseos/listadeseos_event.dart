part of 'listadeseos_bloc.dart';

@immutable
abstract class ListadeseosEvent {}

class AddItem extends ListadeseosEvent {
  final Item item;
  AddItem(this.item);
}

class DelItem extends ListadeseosEvent {
  final Item item;
  DelItem(this.item);
}

class ClearLista extends ListadeseosEvent {}
