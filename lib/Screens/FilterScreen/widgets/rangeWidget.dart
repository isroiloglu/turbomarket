import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';

import '../../../CommonWidgets/widgetSpace.dart';
import '../../../Constants/appConstants.dart';
import '../../../Models/HomePageModels/product_filters.dart';

class PriceRange extends StatefulWidget {
  Range? initialRange;
  RangeValues? currentRange;
  ValueChanged<RangeValues> onChanged;

  PriceRange({
    this.initialRange,
    this.currentRange,
    required this.onChanged,
  });

  @override
  _PriceRangeState createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  RangeValues? _currentRangeValues;
  double startPrice = 0.0;
  double endPrice = 0.0;
  bool rangedLoaded = true;

  @override
  void initState() {
    startPrice = double.parse(widget.initialRange?.min ?? "0.0");
    endPrice = double.parse(widget.initialRange?.max ?? "0.0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (rangedLoaded) {
      _currentRangeValues = RangeValues(
          widget.currentRange?.start ?? 0.0, widget.currentRange?.end ?? 0.0);
      rangedLoaded = false;
    }

    return Column(
      children: [
        widgetSpace(),
        SizedBox(
          width: AppSizes.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: AppSizes.width/ 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).dividerColor),
                       borderRadius:  const BorderRadius.all(Radius.circular(AppSizes.mediumPadding))),
                    padding: const EdgeInsets.all(AppSizes.extraPadding),
                    margin: const EdgeInsets.only(right: AppSizes.linePadding),
                    child: Text(
                      (widget.currentRange?.start ?? 0.0).toStringAsFixed(0),
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                  ),
                  Text(widget.initialRange?.suffix ??'', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.lightGray),),
                ],
              ),
              const Spacer(),
              // widgetSpace(1, 40),
              const SizedBox(
                width: AppSizes.extraPadding,
                child: Divider(
                  thickness: 2,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: AppSizes.width/ 3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).dividerColor),
                        borderRadius:  const BorderRadius.all(Radius.circular(AppSizes.mediumPadding))),
                    padding: const EdgeInsets.all(AppSizes.extraPadding),
                    margin: const EdgeInsets.only(right: AppSizes.linePadding),
                    child: Text(
                        (widget.currentRange?.end ?? 0.0).toStringAsFixed(0),
                        style: Theme.of(context).textTheme.bodyLarge
                    ),
                  ),
                  Text(widget.initialRange?.suffix ??'', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.lightGray),),
                ],
              ),
            ],
          ),
        ),
        SliderTheme(
          data: const SliderThemeData(
              showValueIndicator: ShowValueIndicator.always,

          ),

          child:

          RangeSlider(
            // labels: RangeLabels(
            //   _currentRangeValues!.start.round().toString(),
            //   _currentRangeValues!.end.round().toString(),
            // ),
            values: _currentRangeValues!,
            activeColor: MobikulTheme.clientPrimaryColor,
            inactiveColor: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.4),
            min: double.parse(widget.initialRange?.min ?? "0.0"),
            max: double.parse(widget.initialRange?.max ?? "0.0"),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
                startPrice = values.start;
                endPrice = values.end;
                widget.onChanged(values);
                log(values.start.toString());
                log(values.end.toString());
              });
            },

          ),
        ),
      ],
    );
  }
}
