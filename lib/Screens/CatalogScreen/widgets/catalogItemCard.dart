import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';

import '../../../CommonWidgets/productAvailabilityWidget.dart';
import '../../../CommonWidgets/productdiscountWidget.dart';
import '../../../Config/theme.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/globalData.dart';
import '../../../Models/HomePageModels/product_item.dart';

class CatalogItemCard extends StatefulWidget {
  double? imageSize = 250;
  String? viewType;

  final ProductItem? data;

  CatalogItemCard({Key? key, this.data, this.imageSize, this.viewType})
      : super(key: key);

  @override
  State<CatalogItemCard> createState() => _CatalogItemCardState();
}

class _CatalogItemCardState extends State<CatalogItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, productDetailPage,arguments:widget.data?.productId ?? '');

      },
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: AppSizes.normalPadding, vertical: AppSizes.mediumPadding),

        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius:
            const BorderRadius.all(Radius.circular(AppSizes.linePadding))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
                children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppSizes.linePadding), topRight: Radius.circular(AppSizes.linePadding)),
                child: ImageView(
                  url:widget.data?.image ?? widget.data?.images?[0].toString() ?? '',
                  height: (AppSizes.width / 2) - ( AppSizes.extraPadding  ),
                  width: (AppSizes.width / 2) - ( AppSizes.extraPadding ),
                  fit: BoxFit.fill,
                ),
              ),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: ProductAvailabilityWidget(isInStock: widget.data?.inStock ?? false, isOnRequest: widget.data?.backOrder?? false, isOutStock: widget.data?.outOfStock ??false,)),

                  Visibility(
                    visible: widget.data?.isDiscount ?? false,
                    child: Positioned(
                        top: 5,
                        right: 5,
                        child: productDiscountView(context, widget.data?.discount.toString() ??'')),
                  )

            ]),

            Padding(
              padding: const EdgeInsets.all(AppSizes.normalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: (AppSizes.width / 2) - (AppSizes.normalPadding + 2*AppSizes.extraPadding),
                    padding: const EdgeInsets.all(AppSizes.normalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data?.formatPrice,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        // const SizedBox(
                        //   height: AppSizes.normalPadding,
                        // ),
                      (widget.data?.listPrice!=0)
                        ? Text(
                          widget.data?.formatListPrice,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.lineThrough),
                        )
                      : Text(
                       '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.lineThrough),
                      ),
                        const SizedBox(
                          height: AppSizes.normalPadding,
                        ),
                        // Text(
                        //   widget.data?.product??"",
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .bodyMedium
                        //       ?.copyWith(fontWeight: FontWeight.w500),
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.star,color: MobikulTheme.clientPrimaryColor,size: 15,) ,
                                      const SizedBox(
                                        width: AppSizes.normalPadding,
                                      ),
                                      Text((widget.data?.comments?.avgRating ?? "0.0").toString(),style:Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).colorScheme.primary,
                                          )
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: AppSizes.normalPadding,
                                  ),

                                  Text(widget.data?.product ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: (){

                                },
                                child: Icon((widget.data?.productInWishlist ?? false) ? Icons.favorite: Icons.favorite_outline,  color:  MobikulTheme.clientPrimaryColor,))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
