import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/commonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/cart_model.dart';

import '../../../Config/theme.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CartModel/Request/apply_coupon.dart';
import '../../../Models/CartModel/Request/update_cart_request.dart';
import '../bloc/cartScreenBloc.dart';
import '../bloc/cartScreenEvents.dart';
import '../bloc/cartScreenStates.dart';

class ApplyCouponWidget extends StatefulWidget {
  final CartModel? cartModel;
  final CartScreenBloc? cartScreenBloc;

  const ApplyCouponWidget(
      {Key? key, required this.cartModel, this.cartScreenBloc})
      : super(key: key);

  @override
  _ApplyCouponWidgetState createState() => _ApplyCouponWidgetState();
}

class _ApplyCouponWidgetState extends State<ApplyCouponWidget> {
  TextEditingController? couponController;

  @override
  void initState() {
    couponController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppSizes.width / 2,
                child: TextFormField(
                  controller: couponController,
                  cursorColor: MobikulTheme.clientPrimaryColor,
                  style: AppTheme.lightTheme.textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: GenericMethods.getStringValue(
                        context, AppStringConstant.enterPromoCode),
                    hintStyle: AppTheme.lightTheme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.grey.shade500),
                    contentPadding: const EdgeInsets.all(8.0),
                    enabled: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
              commonButton(context, () {
                widget.cartModel?.couponCode = couponController?.text.trim();
                HashSet<String> couponCode = storageController.getGiftCode();
                print("onClickDiscountApplyBtn: +  $couponCode");
                if (couponCode
                    .contains(widget.cartModel?.couponCode?.toLowerCase())) {
                  AlertMessage.showError(
                      GenericMethods.getStringValue(
                          context, AppStringConstant.duplicateCouponError),
                      context);
                } else {
                  if (widget.cartModel?.couponCode != "") {
                    couponCode
                        .add(widget.cartModel?.couponCode ?? "".toLowerCase());
                    storageController.setGiftCode(couponCode);
                    var usedPoint = storageController.getUsedPoint();
                    var deletedPoint = storageController.getDeletedPoint();
                    print(
                        "onClickDiscountApplyBtn: +  ${couponCode.toString().replaceAll(", ", ",")}");
                    var data = ApplyCoupon(
                        giftCode:
                            "${storageController.getGiftCode().toList().reversed.toList()}"
                                .replaceAll(" ", ""),
                        width: AppSizes.width.toInt(),
                        customerId:
                            (storageController.getUserData()?.userId ?? '')
                                .toString(),
                        currencyCode: storageController.getCurrentCurrency(),
                        langCode: storageController.getCurrentLanguage(),
                        usedPoints: usedPoint,
                        deletePoints: deletedPoint);
                    GenericMethods.hideSoftKeyBoard();
                    widget.cartScreenBloc?.add(
                        ManageVoucherEvent(data, couponController?.text ?? ""));
                    widget.cartScreenBloc?.emit(LoadingState());
                    couponController?.text = "";
                  } else {
                    AlertMessage.showError(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.couponCodeWarning),
                        context);
                  }
                }
              },
                  GenericMethods.getStringValue(
                      context, AppStringConstant.applyCoupon),
                  height: 48.0,
                  width: AppSizes.width * 0.35,
                  borderRadius: 12,
                  backgroundColor: MobikulTheme.clientPrimaryColorA,
                  textColor: Colors.white)
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.mediumPadding,
        ),
      ],
    );
  }
}
