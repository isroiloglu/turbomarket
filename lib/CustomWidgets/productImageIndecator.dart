import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';

import '../Constants/appConstants.dart';
import '../Models/ProductDetailModels/response/image.dart';

class ProductPageIndicator extends StatefulWidget {
  double _defaultSize = 8.0;
  double _defaultSelectedSize = 8.0;
  static const double _defaultSpacing = 8.0;
  static const Color _defaultDotColor = const Color(0x509E9E9E);
  static const Color _defaultSelectedDotColor = Colors.grey;

  /// The current page index ValueNotifier
  final ValueNotifier<int>? currentPageNotifier;

  /// The number of items managed by the PageController
  final int? itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int>? onPageSelected;

  ///The dot color
  final Color dotColor;

  ///The selected dot color
  final Color selectedDotColor;

  ///The normal dot size
  final double? height;
  final double? width;

  ///The selected dot size
  final double? selectedSize;

  ///The space between dots
  final double dotSpacing;
  List<ProductImage>? productImages;

  ProductPageIndicator(
      {Key? key,
      @required this.currentPageNotifier,
      @required this.itemCount,
      this.onPageSelected,
      this.width,
      this.height,
      this.dotSpacing = _defaultSpacing,
      Color? dotColor,
      Color? selectedDotColor,
      this.selectedSize,
      this.productImages})
      : this.dotColor = dotColor ??
            ((selectedDotColor?.withAlpha(150)) ?? _defaultDotColor),
        this.selectedDotColor = selectedDotColor ?? AppColors.black,
        super(key: key);

  @override
  CirclePageIndicatorState createState() {
    return new CirclePageIndicatorState();
  }
}

class CirclePageIndicatorState extends State<ProductPageIndicator> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    _readCurrentPageIndex();
    widget.currentPageNotifier!.addListener(_handlePageIndex);
    super.initState();
  }

  @override
  void dispose() {
    widget.currentPageNotifier!.removeListener(_handlePageIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget._defaultSize = AppSizes.width / 6;
    widget._defaultSelectedSize = AppSizes.width / 5;
    return Container(
      height: widget.height ?? widget._defaultSize,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List<Widget>.generate(widget.itemCount!, (int index) {
            double size = widget._defaultSize;
            Color color = widget.dotColor;
            if (isSelected(index)) {
              size = widget._defaultSelectedSize;
              color = widget.selectedDotColor;
            }
            return GestureDetector(
              onTap: () {
                widget.onPageSelected == null
                    ? null
                    : widget.onPageSelected!(index);
              },
              child: Stack(
                children: [
                  Container(
                    width: widget.width ?? size + widget.dotSpacing,
                    height: widget.height ?? size + widget.dotSpacing,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.lightGray),
                    margin: const EdgeInsets.all(AppSizes.normalPadding / 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ImageView(
                        url: widget.productImages?[index].thumb,
                        width: widget.width ?? size,
                        height: widget.height ?? size,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: index == _currentPageIndex,
                      child: Container(
                        width: widget.width ?? size + widget.dotSpacing,
                        height: widget.width ?? size + widget.dotSpacing,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.black.withOpacity(0.2)),
                        margin:
                            const EdgeInsets.all(AppSizes.normalPadding / 2),
                      ))
                ],
              ),
            );
          })),
    );
  }

  bool isSelected(int dotIndex) => _currentPageIndex == dotIndex;

  _handlePageIndex() {
    setState(_readCurrentPageIndex);
  }

  _readCurrentPageIndex() {
    _currentPageIndex = widget.currentPageNotifier!.value;
  }
}
