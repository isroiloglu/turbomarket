import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/imagesConstant.dart';

import '../Constants/appConstants.dart';
import '../Helper/genericMethods.dart';
import 'package:collection/collection.dart';

import '../Models/AccountModels/Response/countryList.dart';


class CountrySpinner extends StatefulWidget {
  List<CountryList>? countryList;
  CountryList? selectedCountry;
  Function(CountryList?, bool) callback;

  CountrySpinner(this.countryList, this.selectedCountry,
       this.callback, {super.key});

  @override
  State<CountrySpinner> createState() => _CountrySpinnerState();
}

class _CountrySpinnerState extends State<CountrySpinner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(GenericMethods.getStringValue(context, AppStringConstant.country) ?? '', ),
        const SizedBox(
          height: AppSizes.normalPadding,
        ),
        DropdownButtonFormField<CountryList>(
          elevation: 0,
          dropdownColor: AppColors.background,
          icon: Image.asset(AppImages.arrowDown,width: AppSizes.widgetSidePadding,),
          value: widget?.countryList?.firstWhereOrNull((e) => e.countryCode == widget.selectedCountry?.countryCode) ?? widget.countryList?.first,
          menuMaxHeight: AppSizes.height / 2,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.onPrimary,
            focusColor: Theme.of(context).colorScheme.onPrimary,
            enabledBorder:   OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1
                )),
            focusedBorder:  OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  //  Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                )),
            errorMaxLines: 2,
            disabledBorder: const OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.zero),
            isDense: true,
            hintStyle:  Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.lightGray),
            border:  OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(12)),

          ),
          items: (widget?.countryList ?? [])
              .map((CountryList optionData) {
            return DropdownMenuItem(
              value: optionData,
              child: Column(
                children: [
                  Text(
                    optionData.countryName ?? "",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontFamily: 'SF-Pro-Display'),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value){
            widget.callback(value,((value?.stateList??[]).isNotEmpty?true:false));
          },
          validator: (value) {
            if (value == null) {
              return "${GenericMethods.getStringValue(
                  context, AppStringConstant.country)} ${GenericMethods.getStringValue(
                  context, AppStringConstant.isRequired)}";
            }

          },
        ),
      ],
    );
  }
}
