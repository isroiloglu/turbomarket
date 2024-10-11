import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/stateData.dart';
import 'package:collection/collection.dart';

import '../Constants/appConstants.dart';
import '../Constants/appStringConstants.dart';
import '../Constants/imagesConstant.dart';
import '../Helper/genericMethods.dart';

class StateSpinner extends StatefulWidget {
  List<StateData>? stateList;
  StateData? selectedState;
  Function(StateData?) callback;

  StateSpinner(this.stateList, this.selectedState, this.callback, {super.key});

  @override
  State<StateSpinner> createState() => _StateSpinnerState();
}

class _StateSpinnerState extends State<StateSpinner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          GenericMethods.getStringValue(context, AppStringConstant.region) ??
              '',
        ),
        const SizedBox(
          height: AppSizes.normalPadding,
        ),
        DropdownButtonFormField<StateData>(
          elevation: 0,
          dropdownColor: AppColors.background,
          icon: Image.asset(
            AppImages.arrowDown,
            width: AppSizes.widgetSidePadding,
          ),
          value: widget?.stateList?.firstWhereOrNull(
                  (e) => e.stateCode == widget.selectedState?.stateCode) ??
              widget.stateList?.first,
          menuMaxHeight: AppSizes.height / 2,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.onPrimary,
            focusColor: Theme.of(context).colorScheme.onPrimary,
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  //  Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                )),
            errorMaxLines: 2,
            disabledBorder: OutlineInputBorder(
                gapPadding: 0, borderRadius: BorderRadius.circular(12)),
            isDense: true,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.lightGray),
            border: const OutlineInputBorder(
                gapPadding: 0, borderRadius: BorderRadius.zero),
          ),
          items: (widget?.stateList ?? []).map((StateData optionData) {
            return DropdownMenuItem(
              value: optionData,
              child: Text(
                optionData.stateName ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontFamily: 'SF-Pro-Display'),
              ),
            );
          }).toList(),
          onChanged: (value) {
            widget.callback(value);
          },
          validator: (value) {
            if (value == null) {
              return "${GenericMethods.getStringValue(context, AppStringConstant.country)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
            }
          },
        ),
      ],
    );
  }
}
