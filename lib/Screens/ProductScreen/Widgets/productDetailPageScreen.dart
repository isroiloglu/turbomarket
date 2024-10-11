import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/productImageIndecator.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/request/add_to_cart_request.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/image.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/addToCartBottomBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/productImageView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';
import '../../../CommonWidgets/productAvailabilityWidget.dart';
import '../../../CommonWidgets/starRatingWidget.dart';
import '../../../Config/theme.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Helper/imageView.dart';
import '../../AddReview/bloc/addReviewScreenBloc.dart';
import '../../AddReview/bloc/addReviewScreenRepository.dart';
import 'featureVariantsWidget.dart';
import 'productDetailsTabBarWidget.dart';
import 'productFeaturesDetailsWidget.dart';
import 'reviewDisplayWidget.dart';
import 'sellerProductsWidget.dart';
import '../../AddReview/writeAReviewDialog.dart';
import '../bloc/productScreenEvent.dart';

class ProductDetailPageScreen extends StatefulWidget {
  final ProductDetailModel? detailModel;
  final ProductScreenBloc? productScreenBloc;
  final List<ProductImage> slides;
  final Map<String, String> selectedOptions;
  final AddToCartRequest addToCartRequest;
  final bool? productIsInWishlist;
  final bool? optionsRequired;
  final int? quantity;
  final Map<String, String> extra;

  const ProductDetailPageScreen(
      {Key? key,
      this.detailModel,
      this.productScreenBloc,
      required this.slides,
      required this.selectedOptions,
      required this.addToCartRequest,
      this.productIsInWishlist,
      this.optionsRequired,
      this.quantity,
      required this.extra})
      : super(key: key);

  @override
  _ProductDetailPageScreenState createState() =>
      _ProductDetailPageScreenState();
}

class _ProductDetailPageScreenState extends State<ProductDetailPageScreen> {
  int currentPage = 0;
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productName = SizedBox(
      width: AppSizes.width / 1.5,
      child: Text(
        widget.detailModel?.product ?? "",
        style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF-Pro-Display'),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
    var price = RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: widget.detailModel?.formatprice.toString() ?? "",
              style: AppTheme.lightTheme.textTheme.titleMedium),
          const TextSpan(
            text: " ",
          ),
          // TextSpan(
          //     text: widget.detailModel?.currencySymbol ?? "",
          //     style: AppTheme.lightTheme.textTheme.bodySmall
          //         ?.copyWith(fontWeight: FontWeight.w700)),
        ],
      ),
    );
    var cashbackPoints = widget.detailModel?.rewardPoints != 0
        ? Text(
            "${GenericMethods.getStringValue(context, AppStringConstant.cashbackPoints)}:${widget.detailModel?.rewardPoints} ${GenericMethods.getStringValue(context, (widget.detailModel?.rewardPoints ?? 0) > 1 ? AppStringConstant.points : AppStringConstant.point)}",
            style: AppTheme.lightTheme.textTheme.bodySmall
                ?.copyWith(color: AppTheme.cashbackPointColor))
        : const SizedBox();
    var priceInPoints = Text(
      "${GenericMethods.getStringValue(context, AppStringConstant.priceInPoints)}:${widget.detailModel?.priceInPoints} ${GenericMethods.getStringValue(context, (widget.detailModel?.rewardPoints ?? 0) > 1 ? AppStringConstant.points : AppStringConstant.point)}",
      style: const TextStyle(
        fontFamily: 'SF-Pro-Display',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: widget.detailModel?.additionalImages?.length == 0
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductImageView(
                                      productImages: [
                                        widget.detailModel!.mainPair!
                                      ],
                                    )));
                          },
                          child: SizedBox(
                            height: AppSizes.height * 0.4989,
                            width: MediaQuery.of(context).size.width - 32,
                            // (2 * AppSizes.maximumPadding),
                            child: ImageView(
                                url: widget.detailModel?.mainPair?.main ?? ''),
                          ),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: AppSizes.height * 0.4989,
                              child: PageView(
                                controller: _pageController,
                                onPageChanged: ((index) {
                                  setState(() {
                                    _currentPageNotifier.value = index;
                                    currentPage = index;
                                  });
                                }),
                                children: List.generate(
                                    widget.slides.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductImageView(
                                                          productImages:
                                                              widget.slides,
                                                        )));
                                          },
                                          child: SizedBox(
                                            height: AppSizes.height * 0.4989,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                (2 * AppSizes.maximumPadding),
                                            child: ImageView(
                                                height:
                                                    AppSizes.height * 0.4989,
                                                url: widget.slides[index].main),
                                          ),
                                        )),
                              ),
                            ),

                            const SizedBox(
                              height: 4.0,
                            ),
                            ProductPageIndicator(
                              dotColor: AppColors.darkGray,
                              width: AppSizes.width * 0.173,
                              height: AppSizes.height * 0.0928,
                              selectedDotColor:
                                  Theme.of(context).bottomAppBarTheme.color ??
                                      Colors.black,
                              itemCount: widget.slides?.length,
                              currentPageNotifier: _currentPageNotifier,
                              productImages: widget.slides,
                              onPageSelected: (int index) {
                                _currentPageNotifier.value = index;
                                setState(() {
                                  _pageController.animateToPage(index,
                                      curve: Curves.ease,
                                      duration:
                                          const Duration(milliseconds: 300));
                                });
                              },
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: widget.slides.map((data) {
                            //     int index = widget.slides.indexOf(data);
                            //     return Card(
                            //         color: currentPage == index
                            //             ? const Color.fromRGBO(255, 255, 255, 1)
                            //             : const Color.fromRGBO(
                            //                 255, 255, 255, 0.4),
                            //         elevation: 0.0,
                            //         shape: const CircleBorder(
                            //             side: BorderSide(
                            //                 color: MobikulTheme
                            //                     .clientPrimaryColor)),
                            //         clipBehavior: Clip.antiAlias,
                            //         child: Container(
                            //           width: 10.0,
                            //           height: 10.0,
                            //           decoration: BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             color: currentPage == index
                            //                 ? MobikulTheme.clientPrimaryColor
                            //                 : Colors.white,
                            //           ),
                            //         ));
                            //   }).toList(),
                            // ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: productName),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: AppSizes.maximumPadding),
                      child: GestureDetector(
                          onTap: () {
                            if (widget.productIsInWishlist ?? false) {
                              widget.productScreenBloc?.add(RemoveItemEvent(
                                  widget.detailModel?.itemId?.toString() ??
                                      "0"));
                            } else {
                              widget.productScreenBloc?.add(
                                  AddToWishListEvent(widget.addToCartRequest));
                            }
                          },
                          child: (widget.productIsInWishlist ?? false)
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Icon(
                                    Icons.favorite,
                                    color: AppColors.darkGray,
                                  ),
                                )
                              : const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: AppColors.darkGray,
                                  ),
                                )),
                    )
                  ],
                ),
                const SizedBox(height: AppSizes.maximumPadding),
                if (widget.detailModel?.isDiscount ?? false)
                  Row(
                    children: [
                      Text(
                        widget.detailModel?.formatlistPrice ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.productName.withOpacity(0.8)),
                      ),
                      const SizedBox(width: AppSizes.normalPadding),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                            color: AppColors.productDiscount,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '${widget.detailModel?.discount}%' ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontFamily: 'SF-Pro-Display',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                        ),
                      )
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.detailModel?.formatprice ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    priceInPoints,
                  ],
                ),
                const SizedBox(
                  height: AppSizes.normalPadding,
                ),
                // Row(
                //   children: [
                //     (widget.detailModel?.comments != null) &&
                //             (widget.detailModel?.comments != {})
                //         ? StarRating(
                //             onRatingChanged: (val) {},
                //             size: 20.0,
                //             rating:
                //                 widget.detailModel?.comments?.avgRating != null
                //                     ? double.parse(widget
                //                             .detailModel?.comments?.avgRating
                //                             .toString() ??
                //                         "0.0")
                //                     : 0.0,
                //             enable: false,
                //           )
                //         : const SizedBox(),
                //     const SizedBox(width: 20.0),
                //     widget.detailModel?.comments?.avgRating != null
                //         ? Text(
                //             widget.detailModel?.comments?.avgRating
                //                     .toString() ??
                //                 "",
                //             style: Theme.of(context).textTheme.bodyLarge,
                //           )
                //         : Text(
                //             '0.0',
                //             style: Theme.of(context).textTheme.bodyLarge,
                //           ),
                //     const SizedBox(width: 20.0),
                //     ProductAvailabilityWidget(
                //       isInStock: widget.detailModel?.inStock ?? true,
                //       isOutStock: widget.detailModel?.inStock ?? false,
                //       isOnRequest: widget.detailModel?.inStock ?? false,
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: AppSizes.extraPadding,
                // ),
                // comparePrice,
                // Visibility(
                //   visible: widget.detailModel?.isDiscount ?? false,
                //   child: Text(
                //     widget.detailModel?.formatlistPrice.toString() ?? "",
                //     style: const TextStyle(
                //         fontFamily: 'Montserrat',
                //         decoration: TextDecoration.lineThrough,
                //         color: MobikulTheme.clientPrimaryColor),
                //   ),
                // ),
                // const SizedBox(
                //   height: 8.0,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [price, cashbackPoints],
                // ),
                // const SizedBox(
                //   height: AppSizes.normalPadding,
                // ),
                // priceInPoints,
                // const SizedBox(
                //   height: AppSizes.maximumPadding,
                // ),
                (widget.detailModel?.featuresVariantsArrayList != null)
                    ? FeatureVariantsWidget(
                        productDetailModel: widget.detailModel,
                        productScreenBloc: widget.productScreenBloc,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: AppSizes.maximumPadding,
                ),
                ProductDetailsTabBarWidget(
                    tabs: tabLabelData(),
                    length: tabLabelData().length,
                    tabView: tabViewData(),
                    productDetailModel: widget.detailModel),
                (widget.detailModel?.sellerProductsDataModel != null)
                    ? SellerProductWidget(
                        sellerProductsDataModel:
                            widget.detailModel?.sellerProductsDataModel,
                        addToCartRequest: widget.addToCartRequest,
                        quantity: widget.quantity ?? 1,
                        productResponse: widget.detailModel,
                        productScreenBloc: widget.productScreenBloc,
                        selectedOptions: widget.selectedOptions,
                        extra: widget.extra)
                    : const SizedBox(),
                SizedBox(
                  height: AppSizes.width / 3.4,
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: widget.detailModel?.allowAddToCart ?? false,
          child: Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: AddToCartBottomBar(
              quantity: widget.quantity ?? 1,
              productResponse: widget.detailModel,
              productScreenBloc: widget.productScreenBloc,
              optionsRequired: widget.detailModel?.allowAddToCart ?? false,
              addToCartRequest: widget.addToCartRequest,
            ),
          ),
        ),
      ],
    );
  }

  List<String> tabLabelData() {
    List<String> tabs = [];
    widget.detailModel?.fullDescription != ""
        ? tabs.add(GenericMethods.getStringValue(
            context, AppStringConstant.productDescription))
        : '';
    (widget.detailModel?.productFeaturesGroup?.isNotEmpty ?? false
        ? tabs.add(GenericMethods.getStringValue(
            context, AppStringConstant.productFeatures))
        : '');
    tabs.add(GenericMethods.getStringValue(context, AppStringConstant.reviews));
    return tabs;
  }

  List<Widget> tabViewData() {
    List<Widget> tabsView = [];
    widget.detailModel?.fullDescription != ""
        ? tabsView.add(
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    minHeight: AppSizes.height * 0.3,
                    maxHeight: AppSizes.height * 0.8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: AppColors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        GenericMethods.getStringValue(context,
                                AppStringConstant.productDescription) ??
                            '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: AppSizes.mediumPadding),
                      const Divider(),
                      Html(
                        data: widget.detailModel?.fullDescription ?? "",
                        style: {
                          "body": Style(
                              padding: HtmlPaddings.zero, margin: Margins.zero)
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
    widget.detailModel?.productFeaturesGroup?.isNotEmpty ?? false
        ? tabsView.add(ProductFeatureDetails(
            productGroupFeatures: widget.detailModel?.productFeaturesGroup,
            title: AppStringConstant.productFeatures,
          ))
        : const SizedBox();
    tabsView.add(ReviewDisplayWidget(
      detailModel: widget.detailModel,
    )
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     widget.detailModel?.reviews != false &&
        //             widget.detailModel?.comments != null
        //         ? ReviewDisplayWidget(
        //             detailModel: widget.detailModel,
        //           )
        //         : const SizedBox(),
        //     GestureDetector(
        //       onTap: () {
        //         showDialog(
        //             context: (context),
        //             builder: (context) => BlocProvider<AddReviewScreenBloc>(
        //                 create: (context) => AddReviewScreenBloc(
        //                     repository: AddReviewRepositoryImp()),
        //                 child: WriteAReviewDialog(
        //                   productName: widget.detailModel?.product ?? "",
        //                   productId: widget.detailModel?.productId ?? 1,
        //                 )));
        //       },
        //       child: Text(
        //         GenericMethods.getStringValue(
        //             context, AppStringConstant.writeAReview),
        //         style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
        //           color: AppTheme.cashbackPointColor,
        //           decoration: TextDecoration.underline,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
    return tabsView;
  }
}
