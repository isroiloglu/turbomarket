
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/OrderListModel/order_model.dart';
import 'orderListEvents.dart';
import 'orderListRepository.dart';
import 'orderListStates.dart';


class OrderListBloc extends Bloc<OrderListBaseEvent, OrderListBaseState> {
  OrderListRepositoryImp? repository;
  BuildContext? context;
  var tag="OrderListBloc";

  OrderListBloc({this.repository}) : super(OrderListInitialState()) {
    on<OrderListBaseEvent>(mapEventToState);
  }


  void mapEventToState(OrderListBaseEvent event,
      Emitter<OrderListBaseState> emit) async {
    if (event is OrderListFetchDataEvent) {
      try {
        OrderModel orderListModel = await repository!.getCustomerOrders(event.page);
        if (orderListModel != null) {
          emit(OrderListFetchStateSuccess(orderListModel));
        } else {
          emit(OrderListFetchStateFailure(''));
        }
      }
      catch (error, stk) {
        print(stk);
        emit(OrderListFetchStateFailure(error.toString()));
      }}

    //ReOrder event
    if(event is ReorderEvent){
      try {

        var model = await repository?.reorder(event.request);
        if (model != null) {
          // print(tag+"Successfully create reorder"+ "${reorderResponse.response?.message}");
          emit( ReorderStateSuccess(model));
        } else {
          // print(tag+"Api failure while  creating reorder");
          emit(ReorderStateFailure(''));
        }

      } catch (error, _ ) {
        emit(OrderListFetchStateFailure(error.toString()));
      }}
  }
}
