import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/feature_value.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_group_feature.dart';

import '../../../Config/theme.dart';

class ProductFeatureDetails extends StatelessWidget {
  final List<ProductGroupFeatures>? productGroupFeatures;
  final String title;

  const ProductFeatureDetails(
      {Key? key, this.productGroupFeatures, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            minHeight: AppSizes.height * 0.3, maxHeight: AppSizes.height * 0.8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              GenericMethods.getStringValue(context, title),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: AppSizes.mediumPadding),
            const Divider(),
            SizedBox(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: productGroupFeatures?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: AppSizes.mediumPadding),
                          _textViewForProductFeatures(
                              productGroupFeatures![index].values),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }

  Widget _textViewForProductFeatures(List<FeatureValue>? featureValue) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: featureValue?.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: MobikulTheme.lightGreyTest,
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(
                vertical: AppSizes.mediumPadding,
                horizontal: AppSizes.extraPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${featureValue![index].name ?? ""}:",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    featureValue[index].values?.length == 1
                        ? featureValue[index].values![0]
                        : featureValue[index].values!.join(',').toString(),
                    style: AppTheme.lightTheme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        });
  }

//
// Widget textViewForProductFeatures(
//     int parentIndex, List<FeatureValue>? featureValue) {
//   var featureLabels = ListView.builder(
//       itemCount: featureValue?.length,
//       shrinkWrap: true,
//       physics: const ClampingScrollPhysics(),
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
//           child: Text(
//             "${featureValue![index].name ?? ""}:",
//             style: AppTheme.lightTheme.textTheme.bodyMedium,
//           ),
//         );
//       });
//   var featureValues = ListView.builder(
//       itemCount: featureValue?.length,
//       shrinkWrap: true,
//       physics: const ClampingScrollPhysics(),
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: Text(
//               featureValue![index].values?.length == 1
//                   ? featureValue[index].values![0]
//                   : featureValue[index].values!.join(',').toString(),
//               style: AppTheme.lightTheme.textTheme.bodyMedium
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//       });
//   return ListView.builder(itemBuilder: (context,index){
//
//     return _textViewForProductFeatures(index, featureValue);
//   });
//   // return Row(
//   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //   children: [
//   //     Expanded(child: featureLabels),
//   //     Expanded(child: featureValues),
//   //   ],
//   // );
// }
}
