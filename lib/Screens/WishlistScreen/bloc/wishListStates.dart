import 'package:equatable/equatable.dart';

import '../../../Models/WishlistModel/wishlist_model.dart';
import '../../../Models/baseResponse/base_response.dart';


abstract class WishlistState extends Equatable{
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistInitialState extends WishlistState{

}

class WishlistScreenSuccessState extends WishlistState{
  WishlistModel? wishlistModel;

  WishlistScreenSuccessState(this.wishlistModel);

  @override
  List<Object> get props => [];
}



class WishlistActionState extends WishlistState{

}

class RemoveItemSuccessState extends WishlistState{
  BaseResponse? baseModel;

  RemoveItemSuccessState(this.baseModel);

  @override
  List<Object> get props => [];
}

class RemoveCompleteWishlistSuccess extends WishlistState{
  BaseResponse? baseModel;

  RemoveCompleteWishlistSuccess(this.baseModel);

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class WishlistScreenError extends WishlistState {
  WishlistScreenError(this._message);

  String? _message;

  // ignore: unnecessary_getters_setters
  String? get message => _message;

  // ignore: unnecessary_getters_setters
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class WishlistEmptyState extends WishlistState{

}