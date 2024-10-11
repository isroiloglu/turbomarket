import 'package:flutter/material.dart';

import '../Constants/appConstants.dart';

Widget productDiscountView(BuildContext context, String discount){
  return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
  color: Theme.of(context).colorScheme.primary
  ),
  padding: const EdgeInsets.all(AppSizes.linePadding/2),
  child:Text('$discount%', style: TextStyle(fontSize: 10, color: AppColors.white),)
  );

}