import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/arguments_map.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/CommonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/homeCategoryChips.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/homeProductCart.dart';

import '../../../Models/HomePageModels/homeCategoryProduct.dart';
import '../../../Models/HomePageModels/product_item.dart';

Widget homeProductListView(BuildContext context, String title,
    List<ProductItem> products, bool imageVisibility, String image) {
  ScrollController controller = ScrollController();

  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Visibility(
            visible: imageVisibility && (image != ''),
            child: Container(
              margin: const EdgeInsets.all(AppSizes.normalPadding),
              child: ImageView(
                url: image,
                height: AppSizes.width / 2.1,
                width: AppSizes.width * 0.9,
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.extraPadding,
          ),
          SizedBox(
            height: (AppSizes.width / 2) -
                (AppSizes.extraPadding + AppSizes.normalPadding) +
                123,
            child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return HomeProductCart(
                    products[index],
                  );
                }),
          ),
          const SizedBox(
            height: AppSizes.extraPadding * 2,
          ),
        ],
      ),
      Positioned(
          right: 0,
          top: (imageVisibility && (image != ''))
              ? ((AppSizes.width / 2.4) + (AppSizes.width / 2.1))
              : AppSizes.width / 2.4,
          // bottom: AppSizes.width/ 2.2,
          child: iconContainer(context, () {
            if (controller.position.pixels <
                controller.position.maxScrollExtent) {
              controller.animateTo(
                  controller.position.pixels + (AppSizes.width / 2),
                  duration: const Duration(microseconds: 1),
                  curve: Curves.easeIn);
            }
          })),
      Positioned(
          left: 0,
          top: (imageVisibility && (image != ''))
              ? ((AppSizes.width / 2.4) + (AppSizes.width / 2.1))
              : AppSizes.width / 2.4,
          // bottom: AppSizes.width/ 2.2,
          child: iconContainer(context, () {
            if (controller.position.pixels >
                controller.position.minScrollExtent) {
              controller.animateTo(
                  controller.position.pixels - (AppSizes.width / 2),
                  duration: const Duration(microseconds: 1),
                  curve: Curves.easeIn);
            }
          }, icons: Icons.arrow_back_ios_outlined)),
    ],
  );
}

class HomeCategoryProductView extends StatefulWidget {
  String? title;
  List<HomeCategoryProduct> products;
  bool imageVisibility;
  String image;
  String id;

  HomeCategoryProductView(
      this.title, this.products, this.imageVisibility, this.image, this.id,
      {Key? key})
      : super(key: key);

  @override
  State<HomeCategoryProductView> createState() => _HomeCategoryProductState();
}

class _HomeCategoryProductState extends State<HomeCategoryProductView> {
  ScrollController controller = ScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.size16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.extraPadding),
              child: Container(
                constraints: BoxConstraints(maxWidth: AppSizes.width * 0.85),
                child: Text(
                  widget.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
            Visibility(
              // visible: widget.imageVisibility && (widget.image != ''),
              visible: false,
              child: Container(
                margin: const EdgeInsets.all(AppSizes.normalPadding),
                child: ImageView(
                  url: widget.image,
                  height: AppSizes.width / 2.1,
                  width: AppSizes.width * 0.9,
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            SizedBox(
              height: AppSizes.size45,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? AppSizes.mediumPadding : 0,
                          right: 8),
                      child: homeCategoryChips(context, () {
                        setState(() {
                          selectedIndex = index;
                        });
                      }, widget.products[index].title ?? '',
                          index == selectedIndex),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.mediumPadding),
              controller: controller,
              shrinkWrap: true,
              itemCount: widget.products[selectedIndex].products!.length > 4
                  ? 4
                  : widget.products[selectedIndex].products?.length,
              itemBuilder: (context, index) {
                return HomeProductCart(
                    widget.products[selectedIndex].products?[index]);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 0,
                mainAxisExtent: AppSizes.height * 0.39,
              ),
            ),
            const SizedBox(height: 8),
            widget.products[selectedIndex].products!.length > 4
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.mediumPadding),
                    child: commonButton(context,
                        backgroundColor: const Color(0xffEBEBEB), () {
                      if (widget.products.isNotEmpty ?? false) {
                        // Navigator.pushNamed(context, subCategory,
                        //     arguments: subCategoryDataMap(
                        //         widget.products[selectedIndex].categoryId ?? '',
                        //         widget.products[selectedIndex].title ?? ''));
                        Navigator.pushNamed(context, catalogPage,
                            arguments: getCatalogMap(
                                widget.products[selectedIndex].categoryId ?? '',
                                "",
                                widget.products[selectedIndex].title ?? '',
                                false));
                      } else {
                        Navigator.pushNamed(context, catalogPage,
                            arguments: getCatalogMap(
                                widget.products[selectedIndex].categoryId ?? '',
                                "",
                                widget.products[selectedIndex].title ?? '',
                                false));
                      }
                    },
                        GenericMethods.getStringValue(
                          context,
                          AppStringConstant.viewAll,
                        ),
                        height: 50,
                        textStyle: const TextStyle(
                          fontFamily: 'SF-Pro-Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        )),
                  )
                : SizedBox(),
            const SizedBox(height: AppSizes.extraPadding),
          ],
        ),
      ],
    );
  }
}

Widget iconContainer(BuildContext context, Function() callBack,
    {double? height, double? width, IconData? icons}) {
  return GestureDetector(
    onTap: callBack,
    child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.linePadding / 2,
            vertical: AppSizes.linePadding / 2),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(AppSizes.normalPadding / 2)),
        child: Icon(
          icons ?? Icons.arrow_forward_ios_outlined,
          size: 18,
          color: AppColors.black,
        )),
  );
}
