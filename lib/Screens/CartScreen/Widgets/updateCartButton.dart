import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/cart_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenBloc.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Helper/dialogHelper.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CartModel/Request/update_cart_request.dart';
import '../../../Models/CartModel/cart_product.dart';
import '../../../Models/ProductDetailModels/request/product_data.dart';
import '../bloc/cartScreenEvents.dart';
import '../bloc/cartScreenStates.dart';

class UpdateCartButton extends StatefulWidget {
  final CartScreenBloc? cartScreenBloc;
  final CartModel? cartModel;
  const UpdateCartButton({Key? key, this.cartScreenBloc, this.cartModel}) : super(key: key);

  @override
  _UpdateCartButtonState createState() => _UpdateCartButtonState();
}

class _UpdateCartButtonState extends State<UpdateCartButton> {
  Map<String, Map<String, dynamic>> updateCartRequest(
      List<CartProduct>? items) {
    int len = items?.length ?? 0;
    Map<String, Map<String, dynamic>> productMap;
    ProductData? productData;
    productMap = HashMap<String, Map<String, dynamic>>();
    Map<String, String> productOption;
    for (int i = 0; i < len; i++) {
      if (items?[i].itemId != null) {
        CartProduct item = items![i];
        productOption = HashMap<String, String>();
        if (item.productOptions != null) {
          int lenOptions = item.productOptions?.length ?? 0;
          for (int j = 0; j < lenOptions; j++) {
            var optionId = item.productOptions?[j].optionId.toString() ?? "";
            productOption[optionId] = item.productOptions?[j].variantId! ?? "";
          }
          productData = ProductData(
              amount: item.qty.toString(),
              productId: item.productId.toString(),
              objectId: item.itemId.toString(),
              productOptions: productOption);
        }
        productMap[item.itemId!.toString()] = productData!.toJson();
      }
    }
    return productMap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade300)),
        child: ListTile(
          onTap: () {
            updateCart(context);
          },
          horizontalTitleGap: 0.0,
          leading: const Icon(Icons.refresh,color: MobikulTheme.clientPrimaryColor,),
          title: Text(GenericMethods.getStringValue(
              context, AppStringConstant.updateShoppingCart),
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(fontSize: 16.0,color: MobikulTheme.clientPrimaryColor),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,size: 18.0),
        ));
  }

  Future<void> updateCart(BuildContext context) async{
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      final productData = updateCartRequest(widget.cartModel?.cart?.products);
      var data = UpdateCartRequest(
          scope: "update_cart",
          gc: "${storageController.getGiftCode().toList().reversed.toList()}".replaceAll(" ", ""),
          width: AppSizes.width.toString(),
          currencyCode: storageController.getCurrentCurrency(),
          languageCode: storageController.getCurrentLanguage(),
          cartProducts: productData);
      widget.cartScreenBloc?.add(CartScreenUpdateQtyEvent(
          data, (storageController.getUserData()?.userId??'').toString()));
      widget.cartScreenBloc?.emit(CartScreenInitial());
    }else{
      // DialogHelper.networkErrorDialog(context,onConfirm:() {
      //   updateCart(context);
      // });
    }
  }

}
