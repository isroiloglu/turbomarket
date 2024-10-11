import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenBloc.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Helper/dialogHelper.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CartModel/Request/remove_cart_request.dart';
import '../bloc/cartScreenEvents.dart';
import '../bloc/cartScreenStates.dart';

class EmptyCartButton extends StatefulWidget {
  final CartScreenBloc? cartScreenBloc;
  final List<dynamic>? qty;

  const EmptyCartButton({Key? key, required this.cartScreenBloc, this.qty})
      : super(key: key);

  @override
  _EmptyCartButtonState createState() => _EmptyCartButtonState();
}

class _EmptyCartButtonState extends State<EmptyCartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: MobikulTheme.lightGrey,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade300)),
        child: ListTile(
          onTap: () {
            clearCart(context);
          },
          horizontalTitleGap: 0.0,
          leading: const Icon(Icons.delete_forever, color: AppColors.black),
          title: Text(
            GenericMethods.getStringValue(
                context, AppStringConstant.emptyShoppingCart),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 18.0,
            color: AppColors.black,
          ),
        ));
  }

  Future<void> clearCart(BuildContext context) async {
    DialogHelper.confirmationDialog(
        GenericMethods.getStringValue(
            context, AppStringConstant.clearShoppingCart),
        context, onConfirm: () async {
      Set<String> emptySet = {};
      widget.qty?.clear();
      storageController.setGiftCode(emptySet);
      storageController.setUsedPoint('');
      storageController.setDeletedPoint('');
      storageController.setUsedPoint('');
      var data = RemoveCartRequest(
        giftCode: "",
        width: AppSizes.width.toInt(),
        customerId: (storageController.getUserData()?.userId ?? '').toString(),
        currencyCode: storageController.getCurrentCurrency(),
        langCode: storageController.getCurrentLanguage(),
        scope: "clear_cart",
      );
      widget.cartScreenBloc?.add(CartScreenRemoveEvent(data));
      widget.cartScreenBloc?.emit(CartScreenInitial());
    });
  }
}
