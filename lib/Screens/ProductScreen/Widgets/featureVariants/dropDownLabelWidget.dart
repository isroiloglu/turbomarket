import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/feature_variant_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/selected_variation_features.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';

import '../../bloc/productScreenEvent.dart';
import '../../bloc/productScreenStates.dart';

class DropDownLabelWidget extends StatefulWidget {
  final SelectedVariationFeatures? selectedVariationFeatures;
  final ProductDetailModel? productDetailModel;
  final ProductScreenBloc? productScreenBloc;
  final int parentIndex;

  const DropDownLabelWidget(
      {Key? key,
      required this.selectedVariationFeatures,
      required this.productDetailModel,
      this.productScreenBloc,
      required this.parentIndex})
      : super(key: key);

  @override
  State<DropDownLabelWidget> createState() => _DropDownLabelWidgetState();
}

class _DropDownLabelWidgetState extends State<DropDownLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget
                .productDetailModel
                ?.featuresVariantsArrayList![widget.parentIndex]
                .featureVariantsList
                ?.length,
            itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: OutlinedButton(
                  onPressed: () {

                    setState(() {
                      setSelectedVariant(index);
                    });
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                        width: 2.0,
                        color: widget.selectedVariationFeatures?.variantId ==
                                widget
                                    .productDetailModel
                                    ?.featuresVariantsArrayList![
                                        widget.parentIndex]
                                    .featureVariantsList![index]
                                    .variantId
                            ? MobikulTheme.clientAccentColor
                            : Colors.grey.shade400)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      widget
                              .productDetailModel
                              ?.featuresVariantsArrayList![widget.parentIndex]
                              .featureVariantsList![index]
                              .variant ??
                          "",
                      style: AppTheme.lightTheme.textTheme.bodyMedium,
                    ),
                  ),
                )))));
  }

  setSelectedVariant(int index) {
    widget.productScreenBloc?.emit(ProductScreenInitial());
    widget.productScreenBloc?.add(ProductScreenDataFetchEvent(widget
            .productDetailModel
            ?.featuresVariantsArrayList![widget.parentIndex]
            .featureVariantsList![index]
            .productId ??
        ""));
    setState(() {
      widget.productDetailModel?.featuresVariantsArrayList![widget.parentIndex]
          .featureVariantsList![index].isSelected = true;
    });
  }
}
