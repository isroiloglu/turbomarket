import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/cart_product.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenStates.dart';

import '../../../Constants/routeConstant.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/dialogHelper.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CartModel/Request/remove_cart_item_request.dart';
import '../../../Models/CartModel/Request/update_cart_request.dart';
import '../../../Models/CartModel/cart_model.dart';
import '../../../Models/ProductDetailModels/request/product_data.dart';

class CartLineItem extends StatefulWidget {
  final CartProduct? cartProduct;
  final CartScreenBloc? cartScreenBloc;
  final String quantity;
  final CartModel? cartModel;

  CartLineItem(
      {Key? key,
      required this.cartProduct,
      this.cartScreenBloc,
      required this.quantity,
      this.cartModel})
      : super(key: key);

  @override
  _CartLineItemState createState() => _CartLineItemState();
}

class _CartLineItemState extends State<CartLineItem> {
  Timer? incrementTimer, decrementTimer;

  Map<String, Map<String, dynamic>> updateCartRequest(
      List<CartProduct>? items) {
    int len = items?.length ?? 0;
    Map<String, Map<String, dynamic>> productMap;
    ProductData? productData;
    productMap = HashMap<String, Map<String, dynamic>>();
    Map<String, String> productOption;
    for (int i = 0; i < len; i++) {
      if (items?[i].itemId != null) {
        CartProduct item = items![i];
        productOption = HashMap<String, String>();
        if (item.productOptions != null) {
          int lenOptions = item.productOptions?.length ?? 0;
          for (int j = 0; j < lenOptions; j++) {
            var optionId = item.productOptions?[j].optionId.toString() ?? "";
            productOption[optionId] = item.productOptions?[j].variantId! ?? "";
          }
          productData = ProductData(
              amount: item.qty.toString(),
              productId: item.productId.toString(),
              objectId: item.itemId.toString(),
              productOptions: productOption);
        }
        productMap[item.itemId!.toString()] = productData!.toJson();
      }
    }
    return productMap;
  }

  @override
  void dispose() {
    if (incrementTimer != null) {
      incrementTimer!.cancel();
    }

    if (decrementTimer != null) {
      decrementTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.mediumPadding),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.white,
          // border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, productDetailPage,
                          arguments: widget.cartProduct?.productId ?? '');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ImageView(
                          height: AppSizes.size110,
                          width: AppSizes.size100,
                          url: widget.cartProduct?.imagePath),
                    ),
                  ),
                  const SizedBox(
                    width: AppSizes.mediumPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            constraints:
                                BoxConstraints(maxWidth: AppSizes.width * 0.6),
                            // width: AppSizes.width -
                            //     (2 * AppSizes.size100 +
                            //         4 * AppSizes.mediumPadding),
                            child: Text(
                              widget.cartProduct?.product ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: AppSizes.mediumPadding,
                          // ),
                          // Container(
                          //   height: AppSizes.size30,
                          //   width: AppSizes.size100 - AppSizes.mediumPadding,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: MobikulTheme.clientPrimaryColor),
                          //     borderRadius: BorderRadius.circular(4.0),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(0.0),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(4.0),
                          //           child: GestureDetector(
                          //             onTap: () {
                          //               decrementCartItem(context);
                          //             },
                          //             child: const Icon(
                          //               Icons.remove,
                          //               size: 16.0,
                          //               color: MobikulTheme.clientPrimaryColor,
                          //             ),
                          //           ),
                          //         ),
                          //         Text(
                          //           "${widget.quantity}",
                          //           maxLines: 2,
                          //         ),
                          //         Padding(
                          //             padding: const EdgeInsets.all(4.0),
                          //             child: GestureDetector(
                          //               onTap: () {
                          //                 incrementCartItem(context);
                          //               },
                          //               child: const Icon(
                          //                 Icons.add,
                          //                 size: 16.0,
                          //                 color:
                          //                     MobikulTheme.clientPrimaryColor,
                          //               ),
                          //             ))
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.mediumPadding,
                      ),
                      widget.cartProduct?.priceInPoints != null &&
                              widget.cartProduct?.priceInPoints != 0
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                    "${GenericMethods.getStringValue(context, AppStringConstant.priceInPoints)}: ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                  Text(
                                    "${widget.cartProduct?.priceInPoints.toString() ?? ""} ${GenericMethods.getStringValue(context, ((widget.cartProduct?.priceInPoints ?? 0) > 1) ? AppStringConstant.points : AppStringConstant.point)}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: 'SF-Pro-Display'),
                                  )
                                ])
                          : const SizedBox(),
                      widget.cartProduct?.rewardPoints != null &&
                              widget.cartProduct?.rewardPoints != 0
                          ? const SizedBox(
                              height: AppSizes.normalPadding,
                            )
                          : const SizedBox(),
                      widget.cartProduct?.rewardPoints != null &&
                              widget.cartProduct?.rewardPoints != 0
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                    "${GenericMethods.getStringValue(context, AppStringConstant.rewardPoints)}: ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                  Text(
                                    widget.cartProduct?.rewardPoints
                                            .toString() ??
                                        "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                ])
                          : const SizedBox(),
                      const SizedBox(
                        height: AppSizes.normalPadding,
                      ),
                      // if (widget.cartProduct?. ?? false)
                      // Row(
                      //   children: [
                      //     Text(
                      //       'widget.cartProduct?.formatListPrice' ?? '',
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .bodySmall
                      //           ?.copyWith(
                      //               decoration: TextDecoration.lineThrough,
                      //               color:
                      //                   AppColors.productName.withOpacity(0.8)),
                      //     ),
                      //     const SizedBox(width: AppSizes.normalPadding),
                      //     Container(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 5, vertical: 3),
                      //       decoration: BoxDecoration(
                      //           color: AppColors.productDiscount,
                      //           borderRadius: BorderRadius.circular(4)),
                      //       child: Text(
                      //         // '${widget.cartProduct?.discount}%' ?? '',
                      //         '10%',
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .bodySmall
                      //             ?.copyWith(
                      //                 fontFamily: 'Montserrat',
                      //                 color: AppColors.white,
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 11),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            widget.cartProduct?.formatDisplayPrice,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'SF-Pro-Display'),
                          ),
                          const SizedBox(
                            width: AppSizes.extraPadding,
                          ),
                          Container(
                            height: AppSizes.size30,
                            width: AppSizes.size100 - AppSizes.mediumPadding,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.darkGray),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        decrementCartItem(context);
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        size: 16.0,
                                        color: AppColors.darkGray,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget.quantity,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          incrementCartItem(context);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          size: 16.0,
                                          color: AppColors.darkGray,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   height: AppSizes.normalPadding,
                      // ),
                      // RichText(
                      //     text: TextSpan(children: [
                      //   TextSpan(
                      //       text:
                      //           "${GenericMethods.getStringValue(context, AppStringConstant.cost)} ",
                      //       style: AppTheme.lightTheme.textTheme.bodyMedium
                      //           ?.copyWith(color: Colors.grey.shade500)),
                      //   TextSpan(
                      //       text: (widget.cartProduct?.formatSubtotal ?? 0.00)
                      //           .toString(),
                      //       style: AppTheme.lightTheme.textTheme.bodyMedium)
                      // ]))
                    ],
                  ),
                ]),
              ],
            ),
            // const Divider(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       DialogHelper.confirmationDialog(
            //           GenericMethods.getStringValue(
            //               context, AppStringConstant.removeItemsFromCart),
            //           context, onConfirm: () {
            //         removeItem(context);
            //       });
            //     },
            //     child: Text(
            //         GenericMethods.getStringValue(
            //             context, AppStringConstant.removeItem),
            //         style: AppTheme.lightTheme.textTheme.bodyLarge
            //             ?.copyWith(color: MobikulTheme.clientPrimaryColor)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> removeItem(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      var data = RemoveCartItemRequest(
          scope: "clear_cart_item",
          giftCode: "",
          width: AppSizes.width.toInt(),
          customerId:
              (storageController.getUserData()?.userId ?? '').toString(),
          currencyCode: storageController.getCurrentCurrency(),
          langCode: storageController.getCurrentLanguage(),
          itemId: (widget.cartProduct?.itemId ?? '').toString());
      widget.cartScreenBloc?.add(CartScreenRemoveItemEvent(data));
      widget.cartScreenBloc?.emit(LoadingState());
    } else {}
  }

  Future<void> incrementCartItem(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      if (incrementTimer != null) {
        incrementTimer!.cancel();
      }
      widget.cartScreenBloc?.add(CartQuantityIncreaseEvent({
        'productId': (widget.cartProduct?.productId ?? '').toString(),
        'qty': (int.parse(widget.quantity) +
                (((widget.cartProduct?.qtyStep ?? '1').isEmpty ||
                        (widget.cartProduct?.qtyStep ?? '1') == "0")
                    ? 1
                    : int.parse((widget.cartProduct?.qtyStep ?? "1"))))
            .toString()
      }));
      // widget.cartScreenBloc?.emit(CartScreenInitial());
      incrementTimer = Timer(
        const Duration(seconds: 1),
        () {
          updateCart(context);
        },
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AlertMessage.showWarning(
            GenericMethods.getStringValue(
                context, AppStringConstant.networkConnectionError),
            context);
      });
    }
  }

  Future<void> decrementCartItem(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      if (decrementTimer != null) {
        decrementTimer!.cancel();
      }
      if (int.parse(widget.quantity) > 1 &&
          (int.parse(widget.quantity) >
              int.parse((widget.cartProduct?.minQty ?? "1").isNotEmpty
                  ? (widget.cartProduct?.minQty ?? "1")
                  : "1"))) {
        widget.cartScreenBloc?.add(CartQuantityDecreaseEvent({
          'productId': (widget.cartProduct?.productId ?? '').toString(),
          'qty': (int.parse(widget.quantity) -
                  (((widget.cartProduct?.qtyStep ?? '1').isEmpty ||
                          (widget.cartProduct?.qtyStep ?? '1') == "0")
                      ? 1
                      : int.parse((widget.cartProduct?.qtyStep ?? "1"))))
              .toString()
        }));
        // widget.cartScreenBloc?.emit(CartScreenInitial());

        decrementTimer = Timer(
          const Duration(seconds: 1),
          () {
            updateCart(context);
          },
        );
      } else {
        DialogHelper.confirmationDialog(
            GenericMethods.getStringValue(
                context, AppStringConstant.removeItemsFromCart),
            context, onConfirm: () {
          removeItem(context);
        });
      }
    }
  }

  Future<void> updateCart(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      final productData = updateCartRequest(widget.cartModel?.cart?.products);
      var data = UpdateCartRequest(
          scope: "update_cart",
          gc: "${storageController.getGiftCode().toList().reversed.toList()}"
              .replaceAll(" ", ""),
          width: AppSizes.width.toString(),
          currencyCode: storageController.getCurrentCurrency(),
          languageCode: storageController.getCurrentLanguage(),
          cartProducts: productData,
          deletePoints: "",
          usedPoints: storageController.getUsedPoint());
      widget.cartScreenBloc?.add(CartScreenUpdateQtyEvent(
          data, (storageController.getUserData()?.userId ?? '').toString()));
      widget.cartScreenBloc?.emit(CartScreenInitial());
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AlertMessage.showWarning(
            GenericMethods.getStringValue(
                context, AppStringConstant.networkConnectionError),
            context);
      });
    }
  }
}
