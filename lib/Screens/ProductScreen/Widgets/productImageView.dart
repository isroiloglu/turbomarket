import 'package:flutter/material.dart';

import '../../../CommonWidgets/widgetSpace.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/imagesConstant.dart';
import '../../../CustomWidgets/productImageIndecator.dart';
import '../../../Helper/imageView.dart';
import '../../../Models/ProductDetailModels/response/image.dart';

class ProductImageView extends StatefulWidget {
  ProductImageView({Key? key, this.productImages}) : super(key: key);
  List<ProductImage>? productImages;

  @override
  _ProductImageViewState createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  final _pageController = PageController(initialPage: 0);
  final _currentPageNotifier = ValueNotifier<int>(0);
  double? imageSize;

  @override
  Widget build(BuildContext context) {
    imageSize ??= (AppSizes.width / 4);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.extraPadding),
                  child: Image.asset(
                    AppImages.cancelIcon,
                    width: AppSizes.extraPadding,
                    height: AppSizes.extraPadding,
                  ),
                )),
            widgetSpace(),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.productImages?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ImageView(
                    url: widget.productImages?[index].main,
                  );
                },
                onPageChanged: (int index) {
                  _currentPageNotifier.value = index;
                },
              ),
            ),
            _buildCircularIndicator(_currentPageNotifier),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: AppSizes.marginFive,vertical:AppSizes.spacingDefault ),
            //   child: SizedBox(
            //     height: (AppSizes.width / 4),
            //     child: ListView.builder(
            //         physics: const ClampingScrollPhysics(),
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemCount: widget.productImages?.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           return GestureDetector(
            //             onTap: () {
            //               //
            //               setState(() {
            //                 _pageController = PageController(initialPage: index);
            //               });
            //             },
            //             child: ImageView(
            //               url: widget.productImages?[index].thumb,
            //               width: imageSize!,
            //               height: imageSize!,
            //               fit: BoxFit.fill,
            //             ),
            //           );
            //         }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget _buildCircularIndicator(_currentPageNotifier) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProductPageIndicator(
        dotColor: AppColors.darkGray,
        selectedDotColor:
            Theme.of(context).bottomAppBarTheme.color ?? Colors.black,
        itemCount: widget.productImages?.length,
        currentPageNotifier: _currentPageNotifier,
        productImages: widget.productImages,
        onPageSelected: (int index) {
          _currentPageNotifier.value = index;
          setState(() {
            _pageController.animateToPage(index,
                curve: Curves.ease, duration: Duration(milliseconds: 300));
          });
        },
      ),
    );
  }
}
