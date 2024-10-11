import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import '../../../Constants/appConstants.dart';
import '../../../Helper/genericMethods.dart';

class EmptyCartWidget extends StatelessWidget {
  EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(GenericMethods.getStringValue(context, AppStringConstant.noItemFound))
      // Container(
      //   height: AppSizes.height / 2,
      //   width: AppSizes.width - 50,
      //   decoration: BoxDecoration(
      //     border: Border.all(width: 1.0, color: AppColors.background),
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //     Text(
      //         GenericMethods.getStringValue(
      //             context, AppStringConstant.emptyShoppingCart),
      //         style: Theme.of(context).textTheme.titleLarge),
      //     const Padding(padding: EdgeInsets.all(AppSizes.linePadding)),
      //     Text(
      //       GenericMethods.getStringValue(context, AppStringConstant.noItems),
      //       style: Theme.of(context)
      //           .textTheme
      //           .bodyText1
      //           ?.copyWith(fontWeight: FontWeight.normal),
      //     ),
      //     const Padding(padding: EdgeInsets.all(AppSizes.normalPadding)),
      //     ElevatedButton(
      //         onPressed: () {
      //           // Navigator.pushAndRemoveUntil<void>(
      //           //   context,
      //           //   MaterialPageRoute<void>(builder: (BuildContext context) =>  Bottom()),
      //           //   ModalRoute.withName('/'),
      //           // );
      //         },
      //         style: ElevatedButton.styleFrom(primary: AppColors.black),
      //         child: Text(
      //           GenericMethods.getStringValue(
      //               context, AppStringConstant.continueShopping),
      //           style: const TextStyle(color: AppColors.white),
      //         ))
      //   ]),
      // ),
    );
  }
}
