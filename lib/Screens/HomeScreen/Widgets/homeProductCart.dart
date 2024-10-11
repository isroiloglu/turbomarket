import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/productdiscountWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/LoginSignupModels/login_response.dart';

import '../../../CommonWidgets/productAvailabilityWidget.dart';
import '../../../Config/theme.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/dialogHelper.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/HomePageModels/product_item.dart';
import '../../../Models/ProductDetailModels/request/add_to_cart_request.dart';
import '../../../Models/ProductDetailModels/request/product_data.dart';
import 'itemCardBloc/itemCardBloc.dart';
import 'itemCardBloc/itemCardEvent.dart';
import 'itemCardBloc/itemCardState.dart';

class HomeProductCart extends StatefulWidget {
  final ProductItem? productItem;

  const HomeProductCart(this.productItem, {super.key});

  @override
  State<HomeProductCart> createState() => _HomeProductCartState();
}

class _HomeProductCartState extends State<HomeProductCart> {
  ItemCardBloc? itemCardBloc;
  bool isLoading = false;
  String productId = '';

  @override
  Widget build(BuildContext context) {
    itemCardBloc = context.read<ItemCardBloc>();
    return BlocBuilder<ItemCardBloc, ItemCardState>(
      builder: (context, currentState) {
        if (currentState is ItemCardAddToWishlistInitial) {
          isLoading = false;
        } else if (currentState is ItemCardAddToWishlistLoading) {
          isLoading = true;
        } else if (currentState is ItemCardAddToWishlistSuccess) {
          isLoading = false;
          if (currentState.wishListResponseModel.error == null ||
              currentState.wishListResponseModel.error == false) {
            if (widget.productItem!.productId == currentState.productId) {
              widget.productItem!.itemId =
                  currentState.wishListResponseModel.itemId;
              widget.productItem!.productInWishlist = true;
            }

            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showSuccess(
                  currentState.wishListResponseModel.msg ?? '', context);
              if ((storageController.getUserData()?.userId ?? '') == '') {
                var userData = storageController.getUserData();
                userData?.userId = currentState.wishListResponseModel.gId ?? "";
                storageController.setUserData(userData ?? LoginResponse());
              }
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(
                  currentState.wishListResponseModel.msg ?? '', context);
            });
          }

          // widget.productItem!.productInWishlist = true;
          itemCardBloc?.emit(ItemCardAddToWishlistFinish());
        } else if (currentState is ItemCardAddToWishlistError) {
          isLoading = false;
          widget.productItem!.productInWishlist = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AlertMessage.showError(currentState.message ?? '', context);
          });
        } else if (currentState is RemoveItemSuccess) {
          isLoading = false;
          if (currentState.baseModel?.error == false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showSuccess(
                  currentState.baseModel?.message ?? '', context);
            });
            if (widget.productItem!.itemId == currentState.itemId) {
              widget.productItem?.productInWishlist = false;
            }
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(
                  currentState.baseModel?.message ?? '', context);
            });
          }
          itemCardBloc?.emit(ItemCardAddToWishlistFinish());
        } else if (currentState is AddToCartSuccess) {
          isLoading = false;
          storageController
              .setBadgeCount(currentState.data.productTotal.toString());

          Future.delayed(Duration.zero, () async {
            AlertMessage.showSuccess(currentState.data.msg ?? "", context);
            if ((storageController.getUserData()?.userId ?? '').toString() ==
                "") {
              LoginResponse userData = LoginResponse();
              userData.userId = currentState.data.gId;
              storageController.setUserData(userData);
            }
          });
        }
        return buildUi(context);
      },
    );
  }

  Widget buildUi(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, productDetailPage,
                arguments: widget.productItem?.productId ?? '');
          },
          child: Container(
            margin: const EdgeInsets.only(
                // left: AppSizes.normalPadding / 2,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSizes.linePadding)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(AppSizes.linePadding)),
                    child: ImageView(
                      url: widget.productItem?.image ??
                          widget.productItem?.images?[0],
                      height: AppSizes.height * 0.244,
                      width: AppSizes.width * 0.528,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.size10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: AppSizes.height * 0.045,
                        child: Text(
                          widget.productItem?.product ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 0,
                              fontFamily: 'SF-Pro-Display',
                              color: AppColors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: AppSizes.mediumPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.productItem?.isDiscount ?? false
                                  ? Row(
                                      children: [
                                        Text(
                                          widget.productItem?.formatListPrice ??
                                              '',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 11,
                                              color: AppColors.productName
                                                  .withOpacity(0.8)),
                                        ),
                                        const SizedBox(width: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2, vertical: 2),
                                          decoration: BoxDecoration(
                                              color: MobikulTheme
                                                  .clientPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            '${widget.productItem?.discount?.toInt()}%' ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontFamily:
                                                        'SF-Pro-Display',
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10),
                                          ),
                                        )
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 18,
                                    ),
                              Text(
                                widget.productItem?.formatPrice ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'SF-Pro-Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.productItem?.addToCart == true) {
                                itemCardBloc?.add(AddToCartEvent(
                                    AddToCartRequest(
                                        currencyCode: storageController
                                            .getCurrentCurrency(),
                                        languageCode: storageController
                                            .getCurrentLanguage(),
                                        productData: ProductData(
                                          amount: '1',
                                          productOptions: {},
                                          productId:
                                              widget.productItem?.productId,
                                        ).toJson())));
                                // widget.productScreenBloc?.emit(ProductScreenInitial());
                              } else {
                                AlertMessage.showError(
                                    GenericMethods.getStringValue(context,
                                        AppStringConstant.notAllowToCart),
                                    context);
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightGray),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                'assets/Images/bag_add.png',
                                color: AppColors.darkGray,
                              ),
                            ),
                          )
                        ],
                      ),

                      // const SizedBox(
                      //   height: AppSizes.normalPadding,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: ProductAvailabilityWidget(
              isInStock: widget.productItem?.inStock ?? false,
              isOnRequest: widget.productItem?.backOrder ?? false,
              isOutStock: widget.productItem?.outOfStock ?? false,
            )),
        Positioned(
            top: 10,
            right: 10,
            child: InkWell(
                onTap: () {
                  print(
                      "wishlist status:::${widget.productItem?.productInWishlist}");
                  // return;
                  if (widget.productItem?.productInWishlist ?? false) {
                    DialogHelper.confirmationDialog(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.removeItemFromWishlist),
                        context, onConfirm: () {
                      // productId = (widget.productItem?.itemId ?? '').toString();
                      itemCardBloc?.add(RemoveItemEvent(
                          widget.productItem?.itemId?.toString() ?? "0"));
                    }, onCancel: () {});
                  } else {
                    AddToCartRequest request = AddToCartRequest(
                        currencyCode: storageController.getCurrentCurrency(),
                        languageCode: storageController.getCurrentLanguage(),
                        productData: ProductData(
                            amount: "",
                            productId: widget.productItem?.productId.toString(),
                            productOptions: {},
                            extra: {}).toJson(),
                        storefrontId:
                            storageController.getStoreData()?.storefrontId ??
                                '');

                    //if (!data!.productInWishlist) {
                    // productId = (widget.productItem?.itemId ?? '').toString();
                    itemCardBloc?.add(AddToWishListItemCardEvent(
                        request, widget.productItem?.productId ?? ""));
                    //}

                    if (!widget.productItem!.productInWishlist) {
                      widget.productItem!.productInWishlist = true;
                    }

                    //productPageBloc?.emit(ProductScreenInitial());
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.white, width: 1)),
                  alignment: Alignment.center,
                  height: 32,
                  width: 32,
                  child: Icon(
                    (widget.productItem?.productInWishlist ?? false)
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: (widget.productItem?.productInWishlist ?? false)
                        ? AppColors.red
                        : AppColors.white,
                    size: 18,
                  ),
                ))),

        // Visibility(
        //   visible: isLoading && productId == (widget.productItem?.itemId ?? '').toString(),
        //     child: Loader())
      ],
    );
  }
}
