import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PromotionsModel/promotionResponse.dart';

abstract class PromotionScreenState extends Equatable{

}


class PromotionScreenInitialState extends PromotionScreenState{
  @override
  List<Object?> get props => [];
}

class PromotionScreenSuccessState extends PromotionScreenState{
  PromotionResponse? response;
  PromotionScreenSuccessState(this.response);

  @override
  List<Object?> get props => [];
}

class PromotionScreenErrorState extends PromotionScreenState{
  PromotionScreenErrorState(this._message);
  String? _message;
  String? get message => _message;
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class MyPointsScreenEmptyState extends PromotionScreenState{
  @override
  // implement props
  List<Object?> get props => [];

}