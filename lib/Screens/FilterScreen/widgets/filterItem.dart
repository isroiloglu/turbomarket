import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/appConstants.dart';

Widget filterItemChips(BuildContext context, Function() callback, String title, bool selected){
  return GestureDetector(
    onTap: callback,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical:AppSizes.normalPadding),
      padding: const EdgeInsets.symmetric(horizontal:AppSizes.mediumPadding*2, vertical: AppSizes.mediumPadding/2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: selected ? Theme.of(context).colorScheme.primary : null,
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Center(child: Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color:selected ? AppColors.white : null ),textAlign: TextAlign.center,)),
    ),
  );
}