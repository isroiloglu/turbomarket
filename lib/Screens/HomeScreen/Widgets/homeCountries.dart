import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/countries.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/arguments_map.dart';
import '../../../Helper/imageView.dart';

Widget homeCountries(BuildContext context, String title,
    List<Countries> countries, bool imageVisibility, String image) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: AppSizes.mediumPadding),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      const SizedBox(
        height: AppSizes.extraPadding,
      ),
      // Visibility(
      //   visible: imageVisibility && (image != ''),
      //   child: Container(
      //     margin: EdgeInsets.all(AppSizes.normalPadding),
      //     child: ImageView(
      //       url: image,
      //       height: AppSizes.width / 2.1,
      //       width: AppSizes.width * 0.9,
      //     ),
      //   ),
      // ),
      SizedBox(
        height: AppSizes.width / 9,
        width: AppSizes.width.toDouble(),
        child: ListView.builder(
            shrinkWrap: true,
            // physics: const BouncingScrollPhysics(),
            itemCount: countries.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? AppSizes.mediumPadding : 0,
                  right: AppSizes.mediumPadding,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, countryProduct,
                        arguments: getCatalogMap(countries[index].id ?? '', "",
                            countries[index].title ?? '', true));
                  },
                  child: Container(
                    width: AppSizes.width / 9,
                    height: AppSizes.width / 9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular((AppSizes.width / 6) / 2)),
                      color: AppColors.lightGray.withOpacity(0.3),
                      image: DecorationImage(
                        image: NetworkImage(
                          countries[index].image ?? "",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      // const SizedBox(
      //   height: AppSizes.extraPadding * 2,
      // ),
    ],
  );
}
