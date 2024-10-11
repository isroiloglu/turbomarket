import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/commonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/cart_model.dart';

import '../../../Config/theme.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CartModel/Request/apply_coupon.dart';
import '../../../Models/CartModel/Request/cart_request.dart';
import '../bloc/cartScreenBloc.dart';
import '../bloc/cartScreenEvents.dart';
import '../bloc/cartScreenStates.dart';

class ApplyPointsWidget extends StatefulWidget {
  final CartModel? cartModel;
  final CartScreenBloc? cartScreenBloc;

  const ApplyPointsWidget({Key? key, this.cartModel, this.cartScreenBloc})
      : super(key: key);

  @override
  _ApplyPointsWidgetState createState() => _ApplyPointsWidgetState();
}

class _ApplyPointsWidgetState extends State<ApplyPointsWidget> {
  TextEditingController? pointsController;

  @override
  void initState() {
    pointsController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pointsController?.text = '';
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppSizes.width / 2,
            child: TextFormField(
              controller: pointsController,
              cursorColor: MobikulTheme.clientPrimaryColor,
              style: AppTheme.lightTheme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: GenericMethods.getStringValue(
                    context, AppStringConstant.pointsToUse),
                hintStyle: AppTheme.lightTheme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.grey.shade500),
                helperText: (widget.cartModel?.cart?.pointsInUse ?? 0) > 0
                    ? "${widget.cartModel?.cart?.pointsInUse} ${GenericMethods.getStringValue(context, AppStringConstant.pointsInUse)}'\n'${GenericMethods.getStringValue(context, AppStringConstant.youHavePoints)} ${storageController.getUserData()?.points ?? 0} ${GenericMethods.getStringValue(context, ((storageController.getUserData()?.points ?? 0) > 1) ? AppStringConstant.points : AppStringConstant.point)}"
                    : "${GenericMethods.getStringValue(context, AppStringConstant.youHavePoints)} ${storageController.getUserData()?.points ?? 0} ${GenericMethods.getStringValue(context, ((storageController.getUserData()?.points ?? 0) > 1) ? AppStringConstant.points : AppStringConstant.point)}",
                contentPadding: const EdgeInsets.all(8.0),
                border: InputBorder.none,
                enabled: true,
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey.shade300)),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
          ),
          commonButton(context, () {
            if (((pointsController?.text ?? '').trim() != '')) {
              ((storageController.getUserData()?.points ?? 0) >=
                      int.parse((pointsController?.text ?? "0").trim() != ""
                          ? (pointsController?.text ?? "0")
                          : "0"))
                  ? fetchCartData()
                  : WidgetsBinding.instance.addPostFrameCallback((_) {
                      AlertMessage.showError(
                          GenericMethods.getStringValue(
                                  context, AppStringConstant.notEnoughPoint) ??
                              '',
                          context);
                    });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showError(
                    GenericMethods.getStringValue(
                            context, AppStringConstant.pointRequired) ??
                        '',
                    context);
              });
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
    );
  }

  Future<void> fetchCartData() async {
    CartRequest request = CartRequest(
        width: AppSizes.width.toInt(),
        customerId: storageController.getUserData()?.userId,
        currencyCode: storageController.getCurrentCurrency(),
        langCode: storageController.getCurrentLanguage(),
        totalCash: "0",
        formatedSubtotal: "0.0USD",
        giftCode:
            "${storageController.getGiftCode().toList().reversed.toList()}"
                .replaceAll(" ", ""),
        walletCartId: "",
        rechargeAmount: "0.0USD",
        subtotal: 0.0,
        walletSystem: 0,
        usedPoints: pointsController?.text ?? "0");
    storageController.setUsedPoint(pointsController?.text ?? "0");
    GenericMethods.hideSoftKeyBoard();
    widget.cartScreenBloc?.add(ApplyRewardPointEvent(request));
  }
}
