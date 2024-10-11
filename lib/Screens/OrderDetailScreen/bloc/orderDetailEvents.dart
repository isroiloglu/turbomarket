import 'package:equatable/equatable.dart';

import '../../../Models/OrderDetailModel/order_communication_msg_request.dart';
import '../../../Models/OrderReorderModel/Request/reorder_request.dart';



abstract class OrderDetailsBaseEvents extends Equatable{
  const OrderDetailsBaseEvents();
  @override
  List<Object?> get props =>[];

}

class OrderDetailsDataEvent extends OrderDetailsBaseEvents{
  const OrderDetailsDataEvent(this.orderId);

  final String orderId;

}

class ReorderEvent extends OrderDetailsBaseEvents{
  ReorderEvent(this.request);
  ReorderRequest request;

}


class OrderDiscussionMsgEvent extends OrderDetailsBaseEvents{
  const OrderDiscussionMsgEvent(this.id,this.isLatest);
  final String id;
  final bool isLatest;
}

class OrderSendDiscussionMsgEvent extends OrderDetailsBaseEvents{
  OrderSendDiscussionMsgEvent(this.msgRequest,this.isLatest);
  OrderCommunicationMSGRequest msgRequest;
  final bool isLatest;
}