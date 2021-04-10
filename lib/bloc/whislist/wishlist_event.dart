part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class AddItemWhislist extends WishlistEvent {
  final int numero;
  AddItemWhislist(this.numero);
}

class RemoveItemWhisList extends WishlistEvent {}
