import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/commonAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:intl/intl.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AddReview/writeAReviewDialog.dart';
import '../../../CommonWidgets/starRatingWidget.dart';
import '../../../Config/theme.dart';

class ReviewDisplayWidget extends StatelessWidget {
  final ProductDetailModel? detailModel;

  const ReviewDisplayWidget({Key? key, required this.detailModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarSize),
        child: commonAppBar(
            context,
            true,
            GenericMethods.getStringValue(context, AppStringConstant.reviews),
            true),
      ),
      body: detailModel?.reviews != false && detailModel?.comments != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.extraPadding),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.extraPadding,
                    vertical: AppSizes.extraPadding,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          StarRating(
                              onRatingChanged: (val) {},
                              size: 12.0,
                              rating: double.parse(
                                  detailModel?.comments?.avgRating.toString() ??
                                      "0.0")),
                          const SizedBox(width: AppSizes.extraPadding),
                          Text(
                              detailModel?.comments?.avgRating.toString() ?? "",
                              style: AppTheme.lightTheme.textTheme.titleLarge
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.reviewLabel),
                        style: AppTheme.lightTheme.textTheme.bodyLarge
                            ?.copyWith(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                detailModel?.comments?.posts != null
                    ? Column(
                        children: detailModel!.comments!.posts!.map((e) {
                          DateTime date = DateTime.parse(
                              e.timestamp?.split(" ").first ?? "");
                          return reviewCard(
                              detailModel!.comments!.posts!.indexOf(e),
                              date,
                              context);
                        }).toList(),
                      )
                    : const SizedBox(),
                const SizedBox(height: 24.0),
              ],
            )
          : const SizedBox(),
    );
  }

  Widget reviewCard(int index, DateTime date, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.extraPadding,
        vertical: AppSizes.extraPadding,
      ),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  detailModel?.comments?.posts![index].name != ""
                      ? detailModel?.comments?.posts![index].name ?? ""
                      : "Anonymous",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 14,
                    color: AppColors.lightGray,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('dd-MMMM-yyyy')
                        .format(date)
                        .replaceAll("-", " "),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGray),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              StarRating(
                  onRatingChanged: (val) {},
                  size: 10.0,
                  rating: double.parse(detailModel
                          ?.comments?.posts![index].ratingValue
                          .toString() ??
                      "0.0")),
              const SizedBox(width: 4.0),
              Text(
                  "${detailModel?.comments?.posts![index].ratingValue.toString() ?? ""} stars",
                  style: AppTheme.lightTheme.textTheme.bodySmall
                      ?.copyWith(color: Colors.grey.shade500)),
            ],
          ),
          const SizedBox(height: AppSizes.extraPadding),
          Divider(),
          const SizedBox(height: AppSizes.extraPadding),
          Text(detailModel?.comments?.posts![index].message ?? ""),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
