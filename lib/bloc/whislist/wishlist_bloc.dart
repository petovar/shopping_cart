import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
