import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/CommonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/alertMessage.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/request/add_to_cart_request.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenStates.dart';

import '../../../Config/theme.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../bloc/productScreenEvent.dart';

class AddToCartBottomBar extends StatefulWidget {
  final ProductDetailModel? productResponse;
  final ProductScreenBloc? productScreenBloc;
  final AddToCartRequest addToCartRequest;
  final bool? optionsRequired;
  final int quantity;

  const AddToCartBottomBar(
      {Key? key,
      this.productResponse,
      this.productScreenBloc,
      required this.addToCartRequest,
      this.optionsRequired,
      required this.quantity})
      : super(key: key);

  @override
  _AddToCartBottomBarState createState() => _AddToCartBottomBarState();
}

class _AddToCartBottomBarState extends State<AddToCartBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, -10),
                blurRadius: 10.0)
          ]),
      height: AppSizes.width / 3.4,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${GenericMethods.getStringValue(context, AppStringConstant.minOrderQtyMsg)} ${widget.productResponse?.minQty ?? 0}",
              style: AppTheme.lightTheme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey.shade400),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if ((widget.quantity >
                            int.parse(widget.productResponse?.minQty ?? "1"))) {
                          widget.productScreenBloc?.add(QuantityDecreaseEvent(
                              widget.quantity -
                                  (((widget.productResponse?.qtyStep ?? '1')
                                              .isEmpty ||
                                          (widget.productResponse?.qtyStep ??
                                                  '1') ==
                                              "0")
                                      ? 1
                                      : int.parse(
                                          (widget.productResponse?.qtyStep ??
                                              "1")))));
                          widget.productScreenBloc
                              ?.emit(ProductScreenInitial());
                        }
                      },
                      child: Container(
                        width: 42.0,
                        height: 42.0,
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: MobikulTheme.lightGreyTest,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: MobikulTheme.lightGreyTestA,
                            )),
                        child: const Icon(Icons.remove, color: AppColors.black,size: 18,),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 62.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          "${widget.quantity}",
                          style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(fontSize: 12),

                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.productScreenBloc?.add(QuantityIncreaseEvent(widget
                                .quantity +
                            (((widget.productResponse?.qtyStep ?? '1')
                                        .isEmpty ||
                                    (widget.productResponse?.qtyStep ?? '1') ==
                                        "0")
                                ? 1
                                : int.parse(
                                    (widget.productResponse?.qtyStep ?? "1"))

                            //         int.parse(((widget.productResponse?.qtyStep ?? "1") != '') ? (widget.productResponse?.qtyStep ?? "1") : "1") != 0
                            // ? int.parse((widget.productResponse?.qtyStep ?? "1") != ''
                            //     ? (widget.productResponse?.qtyStep ?? "1")
                            //     : "1")
                            // : 1)

                            )));
                        widget.productScreenBloc?.emit(ProductScreenInitial());
                      },
                      child: Container(
                        width: 42.0,
                        height: 42.0,
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: MobikulTheme.lightGreyTest,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: MobikulTheme.lightGreyTestA,
                            )),
                        child: const Icon(Icons.add, color: AppColors.black,size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: AppSizes.mediumPadding,
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.optionsRequired == true) {
                      widget.productScreenBloc
                          ?.add(AddToCartEvent(widget.addToCartRequest));
                      widget.productScreenBloc?.emit(ProductScreenInitial());
                    } else {
                      AlertMessage.showError(
                          GenericMethods.getStringValue(
                              context, AppStringConstant.notAllowToCart),
                          context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MobikulTheme.clientPrimaryColorA,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.extraPadding,
                      horizontal: 8
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset(
                            'assets/Images/bag.png',
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          GenericMethods.getStringValue(
                            context,
                            AppStringConstant.addToCart,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'SF-Pro-Display',
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
