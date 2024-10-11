import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderListScreen/widgets/orderListItem.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/loader.dart';
import '../../Models/OrderListModel/order.dart';
import '../../Models/OrderListModel/order_model.dart';
import 'bloc/orderListBloc.dart';
import 'bloc/orderListEvents.dart';
import 'bloc/orderListStates.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  bool isLoading = true;
  bool isReorder = false;
  OrderListBloc? orderListBloc;
  var scrollController = ScrollController();
  int page = 1;
  int total = 0;
  int totalItems = 0;
  List<Order>? orderItems = [];
  OrderModel? ordersListModel;

  @override
  void initState() {
    orderListBloc = context.read<OrderListBloc>();
    orderListBloc?.add(OrderListFetchDataEvent(page));
    scrollController.addListener(pagination);
    super.initState();
  }

  void pagination() {
    if ((scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) &&
        total < totalItems) {
      setState(() {
        isLoading = true;
        page += 1;
        orderListBloc?.add(OrderListFetchDataEvent(page));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize),
          child: commonAppBar(context, false, "",true),
        ),
        body: checkStateAndCallMethodToBuildOrderList(context));
  }

  checkStateAndCallMethodToBuildOrderList(BuildContext context) {
    return BlocBuilder<OrderListBloc, OrderListBaseState>(
        builder: (context, currentState) {
          if (currentState is OrderListInitialState) {
            isLoading = true;
            if (isReorder) {
              isLoading = false;
            }
          } else if (currentState is OrderListFetchStateSuccess) {
            ordersListModel = currentState.orderListModel;
            orderItems = [];
            orderItems?.addAll(ordersListModel?.orders ?? []);
            total += ordersListModel?.orders?.length ?? 0;
            totalItems = int.parse(ordersListModel?.params?.totalItems ?? "0");
            orderListBloc?.emit(OrderListCommonState());
            isLoading = false;
          } else if (currentState is ReorderStateSuccess) {
            isLoading = false;
            isReorder = false;
            if (currentState.reorderResponse?.added != null &&
                currentState.reorderResponse?.error == false &&
                currentState.reorderResponse?.added == true) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                AlertMessage.showSuccess(
                    currentState.reorderResponse?.message ?? '', context);
              });
            } else {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                AlertMessage.showError(
                    currentState.reorderResponse?.message ?? '', context);
              });
            }
          } else if (currentState is ReorderStateFailure) {
            isLoading = false;
            isReorder = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message ?? '', context);
            });
          } else if (currentState is OrderListFetchStateFailure) {
            isLoading = false;
            isReorder = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message ?? '', context);
            });
          }
          return buildOrderListView(context);
        });
  }

  buildOrderListView(BuildContext buildContext) {
    if (isLoading) {
      return const Center(child: Loader());
    } else if (ordersListModel == null ||
        (ordersListModel?.orders?.isEmpty ?? false)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSizes.extraPadding,
            ),
            Text(
              GenericMethods.getStringValue(context, AppStringConstant.noOrder),
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1,
            ),
          ],
        ),
      );
    } else {
      return RefreshIndicator(
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 1), () {
              orderListBloc?.add(OrderListFetchDataEvent(page));
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.sidePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(GenericMethods.getStringValue(
                    context, AppStringConstant.orders), style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w100,color: AppColors.lightGray)),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.normalPadding),
                  child: Text(GenericMethods.getStringValue(
                      context, AppStringConstant.allYourCompletedOrders),
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSizes.sidePadding),
                    child: Stack(children: [

                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: (orderItems?.length) ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return orderListItem(
                                orderItems: orderItems![index], context: buildContext);
                          }),


                      Visibility(
                        visible: isReorder,
                        child: const Loader(),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ));
    }
  }
}
