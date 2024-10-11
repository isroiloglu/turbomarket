import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/Request/cart_request.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/cart_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/Widgets/applyPointsWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/Widgets/emptyCartWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/Widgets/totalPriceContainer.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/Widgets/updateCartButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenBloc.dart';
import '../../../CommonWidgets/widgetSpace.dart';
import '../../../Config/theme.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Constants/routeConstant.dart';
import '../../../CustomWidgets/CommonButton.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/globalData.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CartModel/Request/update_cart_request.dart';
import '../../../Models/CartModel/cart_product.dart';
import '../../../Models/ProductDetailModels/request/product_data.dart';
import '../../GuestCheckout/guestCheckoutBottomsheet.dart';
import '../bloc/cartScreenEvents.dart';
import '../bloc/cartScreenStates.dart';
import '../shippingCostEstimationBloc/shippingCostEstimationBloc.dart';
import '../shippingCostEstimationBloc/shippingCostEstimationRepository.dart';
import 'applyCoupon.dart';
import 'calculateShippingCostWidget.dart';
import 'cartLineItemWidget.dart';
import 'emptyCartButton.dart';

class CartDetailsScreen extends StatefulWidget {
  final CartModel? cartModel;
  final CartScreenBloc? cartScreenBloc;
  final List<Map<String, String>> quantity;
  final ValueChanged<String> onValueChanged;
  final ValueChanged<bool> valueChangedCouponApply;
  final bool isLoading;

  const CartDetailsScreen(
      {Key? key,
      required this.cartModel,
      required this.quantity,
      this.cartScreenBloc,
      required this.onValueChanged,
      required this.valueChangedCouponApply,
      required this.isLoading})
      : super(key: key);

  @override
  _CartDetailsScreenState createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  String? mGiftCertificate;

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
  Widget build(BuildContext context) {
    return widget.quantity.isNotEmpty
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.normalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.cartModel?.cart?.products?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Slidable(
                          startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: AppColors.red,
                                  foregroundColor: Colors.white,
                                  icon: CupertinoIcons.delete,
                                ),
                              ]),
                          endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: AppColors.blue,
                                  foregroundColor: Colors.white,
                                  icon: CupertinoIcons.minus,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  color: AppColors.blue,
                                  width: 50,
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                        fontFamily: 'SF-Pro-Display',
                                        fontSize: 22,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: AppColors.blue,
                                  foregroundColor: Colors.white,
                                  icon: CupertinoIcons.add,
                                ),
                              ]),
                          child: CartLineItem(
                            quantity: widget.quantity[index]['qty'].toString(),
                            cartScreenBloc: widget.cartScreenBloc,
                            cartProduct:
                                widget.cartModel?.cart?.products?[index],
                            cartModel: widget.cartModel,
                          ),
                        );
                      }),
                  const SizedBox(height: AppSizes.size20),
                  const Divider(),
                  const SizedBox(height: AppSizes.mediumPadding),
                  ApplyCouponWidget(
                    cartModel: widget.cartModel,
                    cartScreenBloc: widget.cartScreenBloc,
                  ),
                  Visibility(
                    visible: widget.cartModel?.cart?.appliedPromotions !=
                                null &&
                            (widget.cartModel?.cart?.appliedPromotions ?? [])
                                .isNotEmpty
                        ? true
                        : false,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: (widget.cartModel?.cart
                                            ?.appliedPromotions ??
                                        [])
                                    .length,
                                itemBuilder: (BuildContext context, i) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "${widget.cartModel?.cart?.appliedPromotions?[i].name}",
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            cancelCoupon(context);
                                          },
                                          child: Visibility(
                                              visible: widget
                                                      .cartModel
                                                      ?.cart
                                                      ?.appliedPromotions?[i]
                                                      .cancelCoupon ??
                                                  true,
                                              child: const Icon(Icons.cancel))),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.cartModel?.cart?.pendingCertificates !=
                                null &&
                            (widget.cartModel?.cart?.pendingCertificates ?? [])
                                    .length !=
                                0
                        ? true
                        : false,
                    child: Column(
                      children: [
                        widgetSpace(),
                        Row(
                          children: [
                            widgetSpace(1),
                            const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.local_offer)),
                            widgetSpace(1),
                            Text(
                              GenericMethods.getStringValue(context,
                                  AppStringConstant.appliedGiftCertificate),
                            ),
                          ],
                        ),
                        widgetSpace(),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                (widget.cartModel?.cart?.pendingCertificates ??
                                        [])
                                    .length,
                            itemBuilder: (BuildContext context, i) {
                              return Row(
                                children: [
                                  widgetSpace(1),
                                  Text(
                                    "${GenericMethods.getStringValue(context, AppStringConstant.coupon)} ${widget.cartModel?.cart?.pendingCertificates?[i]}",
                                  ),
                                  widgetSpace(1),
                                  InkWell(
                                      onTap: () async {
                                        deleteCoupon(context, i);
                                      },
                                      child: const Visibility(
                                          visible: true,
                                          child: Icon(Icons.cancel))),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: (storageController.getLoginStatus() == true) &&
                        (widget.cartModel?.cart?.allowPaymentByPoints ?? false),
                    child: ApplyPointsWidget(
                        cartModel: widget.cartModel,
                        cartScreenBloc: widget.cartScreenBloc),
                  ),
                  Visibility(
                    visible: (storageController.getLoginStatus() == true) &&
                        (widget.cartModel?.cart?.allowPaymentByPoints ??
                            false) &&
                        ((widget.cartModel?.cart?.pointsInUse ?? 0) > 0),
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.cartModel?.cart?.pointsInUse} ${GenericMethods.getStringValue(context, AppStringConstant.pointsInUse)}",
                              ),
                              InkWell(
                                  onTap: () async {
                                    cancelPoint(context);
                                  },
                                  child: const Icon(Icons.cancel)),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(height: AppSizes.extraPadding),
                  ((widget.cartModel?.cart?.shippingId ?? '') != '')
                      ? Container(
                          decoration: BoxDecoration(
                              color: MobikulTheme.clientPrimaryColorA
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          width: AppSizes.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.mediumPadding,
                                vertical: AppSizes.extraPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/Images/delivery-active.png',
                                      width: 36,
                                      height: 36,
                                    ),
                                    const SizedBox(
                                      width: AppSizes.extraPadding,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 100),
                                          child: Text(
                                            widget.cartModel?.cart
                                                    ?.shippingName ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'SF-Pro-Display'),
                                          ),
                                        ),
                                        if (widget.cartModel?.cart?.storeData
                                                ?.storeName?.isNotEmpty ??
                                            false)
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 100),
                                            child: Text(
                                              widget.cartModel?.cart?.storeData
                                                      ?.storeName ??
                                                  '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'SF-Pro-Display'),
                                            ),
                                          )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  widget.cartModel?.cart?.formatShippingCost ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => BlocProvider<
                                                ShippingCostEstimationScreenBloc>(
                                            create: (context) =>
                                                ShippingCostEstimationScreenBloc(
                                                    repository:
                                                        ShippingCostEstimationRepositoryImp()),
                                            child:
                                                const CalculateShippingCostWidget())).then(
                                        (value) {
                                      if (value ?? false) {
                                        final productData = updateCartRequest(
                                            widget.cartModel?.cart?.products);
                                        var set =
                                            storageController.getGiftCode();
                                        var data = UpdateCartRequest(
                                            scope: "update_cart",
                                            gc: "${set.toList().reversed.toList()}"
                                                .replaceAll(" ", ""),
                                            width: AppSizes.width.toString(),
                                            currencyCode: storageController
                                                .getCurrentCurrency(),
                                            languageCode: storageController
                                                .getCurrentLanguage(),
                                            cartProducts: productData);

                                        widget.cartScreenBloc?.add(
                                            ReloadCartEvent(
                                                data,
                                                storageController
                                                        .getUserData()
                                                        ?.userId ??
                                                    ""));
                                      }
                                    });
                                  },
                                  child: Text(
                                      GenericMethods.getStringValue(
                                          context, AppStringConstant.change),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'SF-Pro-Display',
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          width: AppSizes.width,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => BlocProvider<
                                          ShippingCostEstimationScreenBloc>(
                                      create: (context) =>
                                          ShippingCostEstimationScreenBloc(
                                              repository:
                                                  ShippingCostEstimationRepositoryImp()),
                                      child:
                                          const CalculateShippingCostWidget())).then(
                                  (value) {
                                if (value ?? false) {
                                  final productData = updateCartRequest(
                                      widget.cartModel?.cart?.products);
                                  var set = storageController.getGiftCode();
                                  var data = UpdateCartRequest(
                                      scope: "update_cart",
                                      gc: "${set.toList().reversed.toList()}"
                                          .replaceAll(" ", ""),
                                      width: AppSizes.width.toString(),
                                      currencyCode: storageController
                                          .getCurrentCurrency(),
                                      languageCode: storageController
                                          .getCurrentLanguage(),
                                      cartProducts: productData);

                                  widget.cartScreenBloc?.add(ReloadCartEvent(
                                      data,
                                      storageController.getUserData()?.userId ??
                                          ""));
                                }
                              });
                            },
                            child: Text(
                              GenericMethods.getStringValue(context,
                                  AppStringConstant.calculateDeliveryPrice),
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'SF-Pro-Display',
                                color: MobikulTheme.clientPrimaryColorA,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                  // const SizedBox(height: AppSizes.extraPadding),
                  // UpdateCartButton(cartScreenBloc: widget.cartScreenBloc,cartModel: widget.cartModel),
                  const SizedBox(height: AppSizes.mediumPadding),
                  EmptyCartButton(
                      cartScreenBloc: widget.cartScreenBloc,
                      qty: widget.quantity),
                  const SizedBox(height: AppSizes.extraPadding),
                  TotalPriceContainer(
                    cartModel: widget.cartModel,
                  ),
                  // const SizedBox(height: AppSizes.maximumPadding),
                  // GestureDetector(
                  //   onTap: () {
                  //     GlobalData.selectedIndex = 0;
                  //     Navigator.pushAndRemoveUntil<void>(
                  //       context,
                  //       MaterialPageRoute<void>(
                  //           builder: (BuildContext context) =>
                  //               const BottomNavigationScreen()),
                  //       ModalRoute.withName('/home'),
                  //     );
                  //   },
                  //   child: Container(
                  //       width: AppSizes.width,
                  //       height: AppSizes.size50,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(4.0),
                  //           border: Border.all(
                  //               color: MobikulTheme.clientPrimaryColor)),
                  //       child: Center(
                  //         child: Text(
                  //           GenericMethods.getStringValue(
                  //               context, AppStringConstant.continueShopping),
                  //           style: AppTheme.lightTheme.textTheme.bodyLarge
                  //               ?.copyWith(
                  //                   color: MobikulTheme.clientPrimaryColor),
                  //         ),
                  //       )),
                  // ),
                  const SizedBox(height: AppSizes.mediumPadding),
                  commonButton(
                    height: AppSizes.size50,
                    context,
                    () {
                      if ((storageController.getLoginStatus() ?? false)) {
                        Navigator.pushNamed(context, checkoutAddress);
                      } else {
                        bottomSheet(context);
                      }
                    },
                    GenericMethods.getStringValue(
                        context, AppStringConstant.placeAnOrder),
                    textColor: Colors.white,
                    borderRadius: 12,
                    backgroundColor: MobikulTheme.clientPrimaryColorA,
                  ),
                  const SizedBox(height: AppSizes.mediumPadding),

                ],
              ),
            ),
          )
        : EmptyCartWidget();
  }

  Future<void> cancelCoupon(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      var set = storageController.getGiftCode();
      set?.clear();
      await storageController.setGiftCode(set);
      storageController.setAfterCoupanCodeTotal("");
      final productData = updateCartRequest(widget.cartModel?.cart?.products);
      var data = UpdateCartRequest(
          scope: "update_cart",
          gc: "${set.toList().reversed.toList()}".replaceAll(" ", ""),
          width: AppSizes.width.toString(),
          currencyCode: storageController.getCurrentCurrency(),
          languageCode: storageController.getCurrentLanguage(),
          cartProducts: productData,
          usedPoints: storageController.getUsedPoint() ?? '',
          deletePoints: '');
      widget.cartScreenBloc?.add(RemoveVoucherEvent(
          data,
          ((storageController.getUserData()?.userId ?? '').toString() ?? '')
              .toString()));
      widget.cartScreenBloc?.emit(LoadingState());
      widget.valueChangedCouponApply(true);
    } else {}
  }

  Future<void> cancelPoint(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      var set = storageController.getGiftCode();
      var points = storageController.getUsedPoint();

      storageController.setUsedPoint('0');
      storageController.setDeletedPoint(points);
      final productData = updateCartRequest(widget.cartModel?.cart?.products);

      // widget.cartScreenBloc?.add(RemovePointEvent(
      //     data, storageController.getUserData()?.userId??""));

      CartRequest request = CartRequest(
          width: AppSizes.width.toInt(),
          customerId: storageController.getUserData()?.userId,
          currencyCode: storageController.getCurrentCurrency(),
          langCode: storageController.getCurrentLanguage(),
          totalCash: "0",
          formatedSubtotal: "0.0USD",
          giftCode: "${set.toList().reversed.toList()}".replaceAll(" ", ""),
          walletCartId: "",
          rechargeAmount: "0.0USD",
          subtotal: 0.0,
          walletSystem: 0,
          deletedPoints: points ?? "0");

      widget.cartScreenBloc?.add(RemovePointEvent(request));

      widget.cartScreenBloc?.emit(CartScreenInitial());
      widget.valueChangedCouponApply(true);
    } else {}
  }

  Future<void> deleteCoupon(BuildContext context, int index) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      var set = storageController.getGiftCode();
      set.remove(widget.cartModel?.cart?.pendingCertificates?[index]);
      print(
          "kjdhfkjsdhf1 ${widget.cartModel?.cart?.pendingCertificates?[index]}");
      await storageController.setGiftCode(set);
      print(
          "kjdhfkjsdhf2 $set, ${"${storageController.getGiftCode().toList().reversed.toList()}".replaceAll(" ", "")}");
      storageController.setAfterCoupanCodeTotal("");
      final productData = updateCartRequest(widget.cartModel?.cart?.products);
      var data = UpdateCartRequest(
        scope: "update_cart",
        gc: "${storageController.getGiftCode().toList().reversed.toList()}"
            .replaceAll(" ", ""),
        width: AppSizes.width.toString(),
        currencyCode: storageController.getCurrentCurrency(),
        languageCode: storageController.getCurrentLanguage(),
        cartProducts: productData,
        usedPoints: storageController.getUsedPoint() ?? '',
      );
      widget.cartScreenBloc?.add(CartScreenUpdateQtyEvent(
          data,
          ((storageController.getUserData()?.userId ?? '').toString() ?? '')
              .toString()));
      widget.cartScreenBloc?.emit(CartScreenInitial());
      widget.valueChangedCouponApply(true);
    } else {}
  }
}
