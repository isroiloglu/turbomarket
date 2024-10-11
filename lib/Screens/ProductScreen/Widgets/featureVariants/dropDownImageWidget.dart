import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';
import '../../../../Config/theme.dart';
import '../../../../Models/ProductDetailModels/response/product_detail_model.dart';
import '../../../../Models/ProductDetailModels/response/selected_variation_features.dart';
import '../../bloc/productScreenEvent.dart';
import '../../bloc/productScreenStates.dart';

class DropDownImageWidget extends StatefulWidget {
  final SelectedVariationFeatures? selectedVariationFeatures;
  final ProductDetailModel? productDetailModel;
  final ProductScreenBloc? productScreenBloc;
  final int parentIndex;

  DropDownImageWidget(
      {Key? key,
      this.selectedVariationFeatures,
      this.productDetailModel,
      this.productScreenBloc,
      required this.parentIndex})
      : super(key: key);

  @override
  State<DropDownImageWidget> createState() => _DropDownImageWidgetState();
}

class _DropDownImageWidgetState extends State<DropDownImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: widget
                .productDetailModel
                ?.featuresVariantsArrayList![widget.parentIndex]
                .featureVariantsList
                ?.length,
            itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: GestureDetector(
                  onTap: () {
                    widget.productScreenBloc?.emit(ProductScreenInitial());
                    widget.productScreenBloc?.add(ProductScreenDataFetchEvent(
                        widget
                                .productDetailModel
                                ?.featuresVariantsArrayList![widget.parentIndex]
                                .featureVariantsList![index]
                                .productId ??
                            ""));
                    setState(() {
                      widget
                          .productDetailModel
                          ?.featuresVariantsArrayList![widget.parentIndex]
                          .featureVariantsList![index]
                          .isSelected = true;
                    });
                  },
                  child: Container(
                    height: 140.0,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                            width: 2.0,
                            color:
                                widget.selectedVariationFeatures?.variantId ==
                                        widget
                                            .productDetailModel
                                            ?.featuresVariantsArrayList![
                                                widget.parentIndex]
                                            .featureVariantsList![index]
                                            .variantId
                                    ? MobikulTheme.clientAccentColor
                                    : Colors.grey.shade400)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        widget
                                .productDetailModel
                                ?.featuresVariantsArrayList![widget.parentIndex]
                                .featureVariantsList![index]
                                .imagePath ??
                            "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )))));
  }
}
