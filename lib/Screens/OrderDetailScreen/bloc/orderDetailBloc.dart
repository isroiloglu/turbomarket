import 'package:flutter_bloc/flutter_bloc.dart';

import 'orderDetailEvents.dart';
import 'orderDetailRepository.dart';
import 'orderDetailState.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsBaseEvents, OrderDetailBaseState> {
  OrderDetailBaseRepository? repository;
  var tag = "OrderDetailBloc ";

  OrderDetailsBloc({this.repository}) : super(OrderDetailsStateInitial()) {
    on<OrderDetailsBaseEvents>(mapToData);
  }

  void mapToData(
      OrderDetailsBaseEvents events, Emitter<OrderDetailBaseState> emit) async {
    if (events is OrderDetailsDataEvent) {
      try {
        var orderDetailModel = await repository?.getOrderDetails(
          events.orderId,
        );
        if (orderDetailModel != null) {
          emit(OrderDetailsStateSuccess(orderDetailModel));
        } else {
          print("${tag}Api failure while getting Order detail data");
          emit(OrderDetailsStateError(''));
        }
      } catch (error, stacktrace) {
        print(stacktrace.toString());
        emit(OrderDetailsStateError(error.toString()));
      }
    }
    if (events is ReorderEvent) {
      try {
        var reorderResponse = await repository?.reorder(events.request);
        if (reorderResponse != null) {
          // print(tag+"Successfully create reorder"+ "${reorderResponse.response?.message}");
          emit(ReorderStateSuccess(reorderResponse));
        } else {
          print("${tag}Api failure while  creating reorder");
          emit(OrderDetailsStateError(''));
        }
      } catch (exception) {
        print("${tag}exception while creating reorder$exception");
        emit(OrderDetailsStateError(''));
      }
    }
    /*
    * Message Event
    * */
    if (events is OrderDiscussionMsgEvent) {
      var messageResponse;
      try {
        if (events.isLatest) {
          messageResponse = await repository?.orderDiscussionLatest(
            events.id,
          );
        } else {
          messageResponse = await repository?.orderDiscussion(
            events.id,
          );
        }
        if (messageResponse != null) {
          // print(tag+"Successfully send message"+ "${messageResponse.response?.message}");
          emit(OrderDiscussionMsgStateSuccess(messageResponse));
        } else {
          print(tag + "Api failure while send message");
          emit(OrderDetailsStateError(''));
        }
      } catch (exception) {
        print(tag + "exception while send message" + exception.toString());
        emit(OrderDetailsStateError(''));
      }
    }

    if (events is OrderSendDiscussionMsgEvent) {
      try {
        var messageResponse;
        if (events.isLatest) {
          messageResponse = await repository?.sendOrderMsgLatest(
            events.msgRequest,
          );
        } else {
          messageResponse = await repository?.sendOrderMsg(
            events.msgRequest,
          );
        }
        if (messageResponse != null) {
          // print(tag+"Successfully send message"+ "${messageResponse.response?.message}");
          emit(OrderSendDiscussionMsgStateSuccess(messageResponse));
        } else {
          print(tag + "Api failure while send message");
          emit(OrderDetailsStateError(''));
        }
      } catch (exception) {
        print(tag + "exception while send message" + exception.toString());
        emit(OrderDetailsStateError(''));
      }
    }
  }
}