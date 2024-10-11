import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/productFeaturesDetailsWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/reviewDisplayWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AddReview/writeAReviewDialog.dart';
import '../../../Helper/genericMethods.dart';

class ProductDetailsTabBarWidget extends StatefulWidget {
  final ProductDetailModel? productDetailModel;
  final int length;
  final List<String> tabs;
  final List<Widget> tabView;

  const ProductDetailsTabBarWidget(
      {Key? key,
      required this.productDetailModel,
      required this.length,
      required this.tabs,
      required this.tabView})
      : super(key: key);

  @override
  _ProductDetailsTabBarWidgetState createState() =>
      _ProductDetailsTabBarWidgetState();
}

class _ProductDetailsTabBarWidgetState extends State<ProductDetailsTabBarWidget>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: widget.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
              children: widget.tabs
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        openBottomDialog(
                            widget.tabView[widget.tabs.indexOf(e)], e);
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                          widget.tabs.last != e
                              ? Container(
                                  width: double.infinity,
                                  height: 0.5,
                                  color: const Color(0xff7C7C7C),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  )
                  .toList()),
        ),
        // TabBar(
        //   tabs: widget.tabs
        //       .map((e) => Tab(
        //             text: e,
        //           ))
        //       .toList(),
        //   isScrollable: true,
        //   physics: const ClampingScrollPhysics(),
        //   labelStyle: AppTheme.lightTheme.textTheme.bodyLarge,
        //   labelColor: Colors.black,
        //   controller: tabController,
        //   padding: EdgeInsets.zero,
        //   unselectedLabelStyle: AppTheme.lightTheme.textTheme.bodyLarge
        //       ?.copyWith(fontWeight: FontWeight.normal),
        //   // indicatorSize: TabBarIndicatorSize.label,
        //   // indicatorPadding: EdgeInsets.all(AppSizes.mediumPadding),
        //   indicatorColor: MobikulTheme.clientPrimaryColor,
        //   labelPadding: const EdgeInsets.only(right: AppSizes.extraPadding),
        // ),
        // const SizedBox(
        //   height: 24.0,
        // ),
        // SizedBox(
        //   height: AppSizes.height / 2,
        //   width: AppSizes.width,
        //   child: TabBarView(
        //     controller: tabController,
        //     children: widget.tabView
        //         .map(
        //           (e) => e,
        //         )
        //         .toList(),
        //   ),
        // )
      ],
    );
  }

  void openBottomDialog(Widget dialog, String title) {
    if (title !=
        GenericMethods.getStringValue(context, AppStringConstant.reviews)) {
      showModalBottomSheet<int>(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return dialog;
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => dialog,
        ),
      );
    }
  }
}
