import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/productAvailabilityWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/starRatingWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/sellerProductsDataModel.dart';

import '../../../CustomWidgets/CommonButton.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/ProductDetailModels/request/add_to_cart_request.dart';
import '../../../Models/ProductDetailModels/request/product_data.dart';
import '../../../Models/ProductDetailModels/response/product_detail_model.dart';
import '../bloc/productScreenBloc.dart';
import '../bloc/productScreenEvent.dart';
import '../bloc/productScreenStates.dart';
import 'addToCartBottomBar.dart';

class SellerProductWidget extends StatefulWidget {
  final List<SellerProductsDataModel>? sellerProductsDataModel;
  final AddToCartRequest addToCartRequest;
  final ProductScreenBloc? productScreenBloc;
  final ProductDetailModel? productResponse;
  final int quantity;
  final Map<String, String> selectedOptions, extra;

  const SellerProductWidget(
      {Key? key,
      this.sellerProductsDataModel,
      required this.addToCartRequest,
  required this.extra, required this.selectedOptions,
      this.productScreenBloc,
      this.productResponse,
      required,
      required this.quantity})
      : super(key: key);

  @override
  State<SellerProductWidget> createState() => _SellerProductWidgetState();
}

class _SellerProductWidgetState extends State<SellerProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            GenericMethods.getStringValue(
                context, AppStringConstant.sellerOfProduct),
            style: AppTheme.lightTheme.textTheme.labelMedium
                ?.copyWith(color: Colors.grey, fontWeight: FontWeight.normal)),
        const SizedBox(
          height: 18.0,
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.sellerProductsDataModel?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                width: AppSizes.width - (5 * AppSizes.normalPadding),
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          Theme.of(context).dividerColor.withOpacity(0.07)),
                ),
                padding: const EdgeInsets.all(AppSizes.normalPadding),
                margin: const EdgeInsets.only(bottom: AppSizes.mediumPadding),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: ImageView(
                              url: widget
                                      .sellerProductsDataModel?[index].logo ??
                                  '',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSizes.extraPadding,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                  widget.sellerProductsDataModel?[index]
                                          .company ??
                                      '',
                                  style:
                                      AppTheme.lightTheme.textTheme.bodyLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(
                              height: AppSizes.normalPadding,
                            ),
                            Text(
                              widget.sellerProductsDataModel?[index]
                                      .formatPrice ??
                                  '',
                              style: AppTheme.lightTheme.textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: AppSizes.normalPadding,
                            ),
                            ProductAvailabilityWidget(
                              isInStock: widget
                                      .sellerProductsDataModel?[index]
                                      .inStock ??
                                  true,
                              isOutStock: widget
                                      .sellerProductsDataModel?[index]
                                      .inStock ??
                                  false,
                              isOnRequest: widget
                                      .sellerProductsDataModel?[index]
                                      .inStock ??
                                  false,
                            ),
                            Row(
                              children: [
                                commonButton(
                                  context,
                                  () {
                                    if (widget.sellerProductsDataModel?[index]
                                            .allowAddToCart ==
                                        true) {
                                      widget.productScreenBloc?.add(
                                          AddToCartEvent(AddToCartRequest(
                                              currencyCode: storageController
                                                  .getCurrentCurrency(),
                                              languageCode: storageController
                                                  .getCurrentLanguage(),
                                              productData:

ProductData(
                                                  amount: widget.quantity
                                                      .toString(),
                                                  productId: widget
                                                      .sellerProductsDataModel?[
                                                          index]
                                                      .productId
                                                      .toString(),
                                                  productOptions: widget.selectedOptions ,
                                                  extra: widget.extra).toJson())));
                                      widget.productScreenBloc
                                          ?.emit(ProductScreenInitial());
                                    } else {
                                      AlertMessage.showError(
                                          GenericMethods.getStringValue(
                                              context,
                                              AppStringConstant
                                                  .notAllowToCart),
                                          context);
                                    }
                                  },
                                  GenericMethods.getStringValue(
                                      context, AppStringConstant.addToCart),
                                  textColor: Colors.white,
                                  elevation: 4.0,
                                  backgroundColor:
                                      MobikulTheme.clientPrimaryColor,
                                  height: 35,
                                  width: 100,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
