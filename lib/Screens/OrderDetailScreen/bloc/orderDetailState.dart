
import 'package:equatable/equatable.dart';

import '../../../Models/OrderDetailModel/order_communication_model.dart';
import '../../../Models/OrderDetailModel/order_details_model.dart';
import '../../../Models/OrderDetailModel/order_discussion_msg_model.dart';
import '../../../Models/OrderReorderModel/Response/reorder_response.dart';


abstract class OrderDetailBaseState extends Equatable {
  const OrderDetailBaseState();

  @override
  List<Object> get props => [];
}

class OrderDetailsStateInitial extends OrderDetailBaseState {}

class OrderDetailsStateSuccess extends OrderDetailBaseState {
  OrderDetailsStateSuccess(this.orderDetailModel);
  OrderDetailsModel orderDetailModel;
}

class OrderDetailsStateError extends OrderDetailBaseState {
  OrderDetailsStateError(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

/*
* Rerorder State
* */

class ReorderStateSuccess extends OrderDetailBaseState {
  ReorderStateSuccess(this.reorderResponse);
  ReorderResponse? reorderResponse;
}

/*
*
* Order Message state
* */

class OrderDiscussionMsgStateSuccess extends OrderDetailBaseState {
  OrderDiscussionMsgStateSuccess(this.msgResponse);
  OrderCommunicationModel msgResponse;
}

class OrderSendDiscussionMsgStateSuccess extends OrderDetailBaseState {
  OrderSendDiscussionMsgStateSuccess(this.msgResponse);
  OrderDiscussionMSGModel msgResponse;
}

class OrderDetailsEmptyState extends OrderDetailBaseState{

}