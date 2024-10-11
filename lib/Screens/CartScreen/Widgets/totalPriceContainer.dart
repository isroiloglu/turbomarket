import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/cart_model.dart';

class TotalPriceContainer extends StatelessWidget {
  final CartModel? cartModel;

  const TotalPriceContainer({Key? key, this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pricingLabels = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                GenericMethods.getStringValue(
                    context, AppStringConstant.totalPrice),
                style: TextStyle(
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black.withOpacity(0.9)),
              ),
              Text(
                cartModel?.cart?.formatDisplaySubtotal ?? "",
                style: TextStyle(
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.black.withOpacity(0.9)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cartModel?.cart?.orderDiscount != 0
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: AppSizes.extraPadding),
                      child: Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.discount),
                        style: const TextStyle(
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: MobikulTheme.clientPrimaryColor),
                      ),
                    )
                  : const SizedBox(),
              cartModel?.cart?.orderDiscount != 0
                  ? Padding(
                      padding: EdgeInsets.only(top: AppSizes.extraPadding),
                      child: Text(cartModel?.cart?.orderDiscount,
                          style: const TextStyle(
                              fontFamily: 'SF-Pro-Display',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: MobikulTheme.clientPrimaryColor)),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          pricingLabels,
          const SizedBox(height: AppSizes.extraPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 15,
                decoration: const BoxDecoration(
                  color: MobikulTheme.lightGreyTest,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                width: AppSizes.width * 0.8,
                child: const DottedLine(
                  direction: Axis.horizontal,
                  dashColor: AppColors.lightGray,
                ),
              ),
              Container(
                height: 30,
                width: 15,
                decoration: const BoxDecoration(
                  color: MobikulTheme.lightGreyTest,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.extraPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  GenericMethods.getStringValue(
                      context, AppStringConstant.total),
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.black.withOpacity(0.9)),
                ),
                Text(
                  cartModel?.cart?.formatTotal ?? "",
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.black.withOpacity(0.9)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
