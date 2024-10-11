import 'package:flutter/material.dart';

import '../Constants/appConstants.dart';

Widget widgetSpace([int type=0,double? space= AppSizes.sidePadding]){
  //for horizontal spacing
  if(type==1){
    return SizedBox(
      width: space,
    );
  }
  //for vertical spacing
  else{
    return SizedBox(
      height: space,
    );
  }

}