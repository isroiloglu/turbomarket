import 'package:flutter/material.dart';
import '../../../../Config/theme.dart';
import '../../../../Models/ProductDetailModels/response/product_options.dart';

class DropDownForOptions extends StatefulWidget {
  final ProductOptions? productOptions;
  final int? parentIndex;
  final Map<String, String>? selectedOptions;

  const DropDownForOptions(
      {Key? key, this.productOptions, this.parentIndex, this.selectedOptions})
      : super(key: key);

  @override
  State<DropDownForOptions> createState() => _DropDownForOptionsState();
}

class _DropDownForOptionsState extends State<DropDownForOptions> {
  String selectedVariant = "";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      value: widget.productOptions?.options![widget.parentIndex!].variants![0]
              .variantName ??
          "",
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
      items: (widget.productOptions?.options![widget.parentIndex!].variants)
          ?.map((e) => DropdownMenuItem(
                value: e.variantName,
                child: Text(e.variantName ?? "",
                    style: AppTheme.lightTheme.textTheme.bodyMedium),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          widget.selectedOptions!["${widget.productOptions?.options![widget.parentIndex!].optionId}"] =
              value;
        });
      },
    );
  }
}
