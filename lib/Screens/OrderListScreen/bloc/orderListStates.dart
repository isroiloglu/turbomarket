
import 'package:equatable/equatable.dart';

import '../../../Models/OrderListModel/order_model.dart';
import '../../../Models/OrderReorderModel/Response/reorder_response.dart';


abstract class OrderListBaseState extends Equatable {

  @override
  List<Object?> get props => [];

}
class OrderListInitialState extends OrderListBaseState {
}

class OrderListCommonState extends OrderListBaseState {
}
class OrderListFetchStateSuccess extends OrderListBaseState {

  OrderListFetchStateSuccess(this.orderListModel);

  OrderModel? orderListModel;

}
class OrderListFetchStateFailure extends OrderListBaseState {

  OrderListFetchStateFailure(this._message);
  String? _message;

  String? get message => _message;
  set message(String? message) {
    _message = message;
  }


}


/*
* Rerorder State
* */

class ReorderStateSuccess extends OrderListBaseState {
  ReorderStateSuccess(this.reorderResponse);
  ReorderResponse? reorderResponse;
}

class ReorderStateFailure extends OrderListBaseState {

  ReorderStateFailure(this._message);
  String? _message;

  String? get message => _message;
  set message(String? message) {
    _message = message;
  }


}