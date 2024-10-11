import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/widgetSpace.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderDetailScreen/widgets/mainWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderDetailScreen/widgets/productListItem.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../CustomWidgets/CommonButton.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/dialogHelper.dart';
import '../../Helper/loader.dart';
import '../../Helper/storageHelper.dart';
import '../../Models/OrderDetailModel/order_details_model.dart';
import '../../Models/OrderReorderModel/Request/reorder_request.dart';
import 'bloc/orderDetailBloc.dart';
import 'bloc/orderDetailEvents.dart';
import 'bloc/orderDetailState.dart';

class OrderDetailScreen extends StatefulWidget {
  String? orderId;

  OrderDetailScreen({this.orderId, Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen>
    with SingleTickerProviderStateMixin {
  var Tag = "_OrderDetailScreenState";
  bool isLoading = true;
  OrderDetailsModel? orderDetailModel;
  OrderDetailsBloc? orderDetailsBloc;
  bool isReorderClick = false;
  bool setMessageButton = false;
  bool result = false;

  @override
  void initState() {
    orderDetailsBloc = context.read<OrderDetailsBloc>(); //219,174
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      orderDetailsBloc?.add(OrderDetailsDataEvent(widget.orderId ?? ""));
    } else {
      // ignore: use_build_context_synchronously
      DialogHelper.showExceptionDialog(
          GenericMethods.getStringValue(
              context, AppStringConstant.networkConnectionError),
          context,
          onConfirm: () => fetchData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MobikulTheme.lightGreyTest,

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize),
          child: commonAppBar(context, false, "", true),
        ),
        body: SafeArea(child: buildMain(context, const BoxConstraints())));
  }

  buildMain(BuildContext context, BoxConstraints constraints) {
    return BlocBuilder<OrderDetailsBloc, OrderDetailBaseState>(
        builder: (context, currentState) {
      if (currentState is OrderDetailsStateInitial) {
        if(isReorderClick==true){
          isLoading = false;
        }else{
          isLoading = true;
        }
      } else if (currentState is OrderDetailsStateSuccess) {
        if (!isReorderClick) isLoading = false;
        orderDetailModel = currentState.orderDetailModel;
      } else if (currentState is ReorderStateSuccess) {
        print(" ReorderStateSuccess$isLoading");
        isLoading = false;
        isReorderClick = false;
        if (currentState.reorderResponse?.added != null &&
            currentState.reorderResponse?.error == false &&
            currentState.reorderResponse?.added == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // redirect to cart page
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AlertMessage.showError(
                currentState.reorderResponse?.message ?? '', context);
          });
        }
      } else if (currentState is OrderDetailsStateError) {
        print(" OrderDetailsStateError$isLoading");
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message ?? '', context);
        });
      }

      orderDetailsBloc?.emit(OrderDetailsEmptyState());
      return buildOrderDetailUi();
    });
  }

  Widget buildOrderDetailUi() {
    return Stack(
        children: [
          isLoading?Container():Padding(
            padding: const EdgeInsets.all(AppSizes.extraPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${GenericMethods.getStringValue(context, AppStringConstant.order)} #${orderDetailModel?.orderId ?? ""}",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w100, color: AppColors.lightGray)),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.normalPadding),
                  child: Text(
                      GenericMethods.getStringValue(
                          context, AppStringConstant.yourOrderDetail),
                      style: Theme.of(context).textTheme.labelSmall),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: AppSizes.size25),
                        child: Text(
                            GenericMethods.getStringValue(
                                context, AppStringConstant.productInfo),
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppSizes.size35),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: (orderDetailModel?.products?.length) ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return productListItem(
                                  orderItems: orderDetailModel?.products![index],
                                  context: context);
                            }),
                      ),
                      widgetSpace(),
                      Text(
                        "${GenericMethods.getStringValue(context, AppStringConstant.paymentMethod)}:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      mainWidget(context,orderDetailModel),
                    ],
                  ),
                )),
                // commonButton(
                //     context, () {
                //
                //       setState(() {
                //         isReorderClick = true;
                //       });
                //       //219,174
                //       orderDetailsBloc?.add(
                //         ReorderEvent(
                //           ReorderRequest(
                //               orderId: orderDetailModel?.orderId,
                //               userId: orderDetailModel?.userId),
                //         ),
                //       );
                //
                //     },
                //     GenericMethods.getStringValue(
                //         context, AppStringConstant.reorder),
                //     textColor: AppColors.white,
                //     height: AppSizes.width / 8)
              ],
            ),
          ),
          Visibility(visible:isLoading||isReorderClick,child: const Center(child: Loader()))
        ],
      );

  }
}
