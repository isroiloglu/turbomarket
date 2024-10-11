import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_options.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/options/dropDownWidgetForOptions.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/options/radioButtonOptionWidget.dart';
import '../../../Config/theme.dart';

class ProductOptionsWidget extends StatefulWidget {
  final ProductOptions? productOptions;
  final Map<String, String> selectedOptions;

  const ProductOptionsWidget(
      {Key? key, required this.productOptions, required this.selectedOptions})
      : super(key: key);

  @override
  _ProductOptionsWidgetState createState() => _ProductOptionsWidgetState();
}

class _ProductOptionsWidgetState extends State<ProductOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.productOptions?.options?.length,
        itemBuilder: (context, index) {
          return optionsDataWidget(
              widget.productOptions?.options![index].optionType ?? "", index);
        });
  }

  Widget optionsDataWidget(String optionType, int parentIndex) {
    Widget optionWidget = Container();
    switch (optionType) {
      case "R":
        optionWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.productOptions?.options![parentIndex].optionName ?? "",
                style: AppTheme.lightTheme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 12.0,
            ),
            RadioButtonOptionWidget(
              index: parentIndex,
              productOptions: widget.productOptions,
              selectedOptions: widget.selectedOptions,
            ),
          ],
        );
        break;
      case "S":
        optionWidget =
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.productOptions?.options![parentIndex].optionName ?? "",
              style: AppTheme.lightTheme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 12.0,
          ),
          DropDownForOptions(
            parentIndex: parentIndex,
            productOptions: widget.productOptions,
            selectedOptions: widget.selectedOptions,
          ),
        ]);
        break;
      default:
        break;
    }
    return optionWidget;
  }
}
