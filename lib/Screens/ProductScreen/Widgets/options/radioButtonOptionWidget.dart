import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_options.dart';

import '../../../../Config/theme.dart';
import '../../../../Models/ProductDetailModels/response/variant.dart';

class RadioButtonOptionWidget extends StatefulWidget {
  final int index;
  final ProductOptions? productOptions;
  final Map<String, dynamic> selectedOptions;

  RadioButtonOptionWidget(
      {Key? key,
      required this.index,
      required this.productOptions,
      required this.selectedOptions})
      : super(key: key);

  @override
  State<RadioButtonOptionWidget> createState() =>
      _RadioButtonOptionWidgetState();
}

class _RadioButtonOptionWidgetState extends State<RadioButtonOptionWidget> {
  List<Variant>? variants;

  @override
  void initState() {
    widget.productOptions?.options![widget.index]
        .variants![0].isSelected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount:
            widget.productOptions?.options![widget.index].variants?.length,
        itemBuilder: (context, index) {
          return RadioListTile<String>(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            contentPadding: EdgeInsets.zero,
            value: widget.productOptions?.options![widget.index]
                    .variants![index].variantName ??
                "",
            groupValue: (widget.productOptions?.options![widget.index]
                        .variants![index].isSelected ??
                    false)
                ? widget.productOptions?.options![widget.index].variants![index]
                    .variantName
                : "",
            title: Text(
                widget.productOptions?.options![widget.index].variants![index]
                        .variantName ??
                    "",
                style: AppTheme.lightTheme.textTheme.bodyMedium),
            onChanged: (value) {
              for (Variant variant
                  in (widget.productOptions?.options![widget.index].variants ??
                      [])) {
                variant.isSelected = false;
              }
              setState(() {
                widget.productOptions?.options![widget.index].variants![index]
                    .isSelected = true;
                widget.selectedOptions[
                        "${widget.productOptions?.options![widget.index].optionId}"] =
                    value;
              });
            },
            selected: widget.productOptions?.options![widget.index]
                    .variants![index].isSelected ??
                false,
          );
        });
  }
}
