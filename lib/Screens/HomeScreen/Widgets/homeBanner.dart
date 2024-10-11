import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/arguments_map.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';

import '../../../Models/HomePageModels/bannerPages.dart';

Widget homeBanner(BuildContext context, String title, List<BannerPages> banners, bool imageVisibility, String image){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),),
      Visibility(
        visible: imageVisibility && (image != ''),
        child: Container(
          margin: EdgeInsets.all(AppSizes.normalPadding),
          child: ImageView(
            url: image,
            height: AppSizes.width / 2.1,
            width: AppSizes.width * 0.9,
          ),
        ),
      ),
      const SizedBox(height: AppSizes.extraPadding,),

      SizedBox(
        height: AppSizes.width/ 4,
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: banners.length ,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, cmsPage,arguments: getCmsMap(banners[index].id??"", banners[index].title??""));
            },
            child: Container(
                margin: const EdgeInsets.only(right: AppSizes.extraPadding),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.07)),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(AppSizes.normalPadding/2))
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.normalPadding/2),
                  child: ImageView(
                    url: banners[index].image,
                    width: AppSizes.width/12 *7,
                    height: AppSizes.width/ 4,
                    fit: BoxFit.fill,
                    isBanner: true,
                  ),
                )
            ),
          );
        }),
      ),
      const SizedBox(
        height: AppSizes.extraPadding*2,
      ),
    ],
  );
}
