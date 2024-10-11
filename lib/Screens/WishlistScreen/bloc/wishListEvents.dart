import 'package:equatable/equatable.dart';

abstract class WishlistEvent extends Equatable{
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class WishlistDataFetchEvent extends WishlistEvent{

}



class RemoveItemEvent extends WishlistEvent{
  final String itemId;


  const RemoveItemEvent(this.itemId);

  @override
  List<Object> get props => [];
}

class RemoveCompleteWishlistEvent extends WishlistEvent{


  const RemoveCompleteWishlistEvent();

  @override
  List<Object> get props => [];
}