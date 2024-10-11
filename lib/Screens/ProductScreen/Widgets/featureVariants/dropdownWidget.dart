import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';
import '../../../../Config/theme.dart';
import '../../bloc/productScreenEvent.dart';
import '../../bloc/productScreenStates.dart';

class DropDownWidgetForFeatures extends StatefulWidget {
  final ProductDetailModel? productDetailModel;
  final ProductScreenBloc? productScreenBloc;
  final int? parentIndex;

  const DropDownWidgetForFeatures(
      {Key? key,
      this.productDetailModel,
      this.parentIndex,
      this.productScreenBloc})
      : super(key: key);

  @override
  State<DropDownWidgetForFeatures> createState() =>
      _DropDownWidgetForFeaturesState();
}

class _DropDownWidgetForFeaturesState extends State<DropDownWidgetForFeatures> {
  String selectedVariant = "";
  String productId = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget
            .productDetailModel!
            .featuresVariantsArrayList![widget.parentIndex!]
            .featureVariantsList!
            .map(
          (e) {
            if (e.imagePath?.isEmpty ?? true) {
              log('PARAMETER IS ${e.toString()}');
              return GestureDetector(
                onTap: () {
                  setState(() {
                    productId = e.productId!;
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(right: 14),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.maximumPadding,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: productId == e.productId
                            ? Colors.black.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        border:
                            Border.all(width: 1, color: AppColors.darkGray)),
                    child: Text(
                      e.variant.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SF-Pro-Display',
                      ),
                    )),
              );
            } else {
              return Container(
                  margin: EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.maximumPadding,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: productId == e.productId
                          ? Colors.black.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 1, color: AppColors.darkGray)),
                  child: Text(e.variant.toString()));
            }
          },
        ).toList(),
      ),
    );
    return DropdownButtonFormField<dynamic>(
      value: widget.productDetailModel!
          .featuresVariantsArrayList![widget.parentIndex!].variant,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4.0),
          ),
          enabled: true),
      items: (widget
              .productDetailModel!
              .featuresVariantsArrayList![widget.parentIndex!]
              .featureVariantsList)
          ?.map((e) => DropdownMenuItem(
                value: e.variant,
                child: Text(e.variant ?? "",
                    style: AppTheme.lightTheme.textTheme.bodyMedium),
              ))
          .toList(),
      onChanged: (value) {
        widget.productDetailModel!
            .featuresVariantsArrayList![widget.parentIndex!].featureVariantsList
            ?.forEach((element) {
          if (value as String == element.variant) {
            productId = element.productId ?? "";
          }
        });
        widget.productScreenBloc?.emit(ProductScreenInitial());
        widget.productScreenBloc?.add(ProductScreenDataFetchEvent(productId));
        setState(() {
          selectedVariant = value as String;
        });
      },
    );
  }
}
