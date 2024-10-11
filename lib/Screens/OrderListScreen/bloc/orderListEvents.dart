

// ignore_for_file: file_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../Models/OrderReorderModel/Request/reorder_request.dart';

abstract class OrderListBaseEvent extends Equatable{
  List<Object> get props => [];
}


/*
*
* Event to fetch the order list
* */
class OrderListFetchDataEvent extends OrderListBaseEvent{
  int page;
  OrderListFetchDataEvent(this.page);

}

/*
*
* Reorder Event
* */
class ReorderEvent extends OrderListBaseEvent{
  ReorderEvent(this.request);
  ReorderRequest request;

}