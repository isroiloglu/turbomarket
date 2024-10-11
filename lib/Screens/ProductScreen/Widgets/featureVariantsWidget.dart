import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/featureVariants/dropDownImageWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/featureVariants/dropDownLabelWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/featureVariants/dropdownWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';
import '../../../Config/theme.dart';

class FeatureVariantsWidget extends StatefulWidget {
  final ProductDetailModel? productDetailModel;
  final ProductScreenBloc? productScreenBloc;

  const FeatureVariantsWidget(
      {Key? key, required this.productDetailModel, this.productScreenBloc})
      : super(key: key);

  @override
  _FeatureVariantsWidgetState createState() => _FeatureVariantsWidgetState();
}

class _FeatureVariantsWidgetState extends State<FeatureVariantsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: widget.productDetailModel?.featuresVariantsArrayList?.length,
        itemBuilder: (context, index) {
          return featuresData(
              widget.productDetailModel?.featuresVariantsArrayList![index]
                      .featureStyle ??
                  "",
              index);
        });
  }

  Widget featuresData(String type, int parentIndex) {
    Widget widget1 = Container();
    switch (type) {
      case "dropdown_labels":
        widget1 = SizedBox(
          height: 70.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget
                          .productDetailModel
                          ?.featuresVariantsArrayList![parentIndex]
                          .description ??
                      "",
                  style: AppTheme.lightTheme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: AppSizes.mediumPadding,
              ),
              DropDownLabelWidget(
                parentIndex: parentIndex,
                productDetailModel: widget.productDetailModel,
                productScreenBloc: widget.productScreenBloc,
                selectedVariationFeatures: widget.productDetailModel
                    ?.selectedVariationFeatures![parentIndex],
              ),
              const SizedBox(
                height: AppSizes.mediumPadding,
              ),
            ],
          ),
        );
        break;
      case "dropdown_images":
        widget1 = SizedBox(
            height: 100.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  widget
                          .productDetailModel
                          ?.featuresVariantsArrayList![parentIndex]
                          .description ??
                      "",
                  style: AppTheme.lightTheme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: AppSizes.mediumPadding,
              ),
              DropDownImageWidget(
                productScreenBloc: widget.productScreenBloc,
                productDetailModel: widget.productDetailModel,
                selectedVariationFeatures: widget.productDetailModel
                    ?.selectedVariationFeatures![parentIndex],
                parentIndex: parentIndex,
              ),
              const SizedBox(
                height: AppSizes.mediumPadding,
              ),
            ]));
        break;
      case "dropdown":
        widget1 = SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              widget.productDetailModel?.featuresVariantsArrayList![parentIndex]
                      .description ??
                  "",
              style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'SF-Pro-Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            height: AppSizes.mediumPadding,
          ),
          DropDownWidgetForFeatures(
            productScreenBloc: widget.productScreenBloc,
            productDetailModel: widget.productDetailModel,
            parentIndex: parentIndex,
          ),
          const SizedBox(
            height: AppSizes.mediumPadding,
          ),
        ]));
        break;
      default:
        widget1 = Container();
        break;
    }
    return widget1;
  }
}
