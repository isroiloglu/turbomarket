import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';

import '../../CommonWidgets/AppBar/bottomSheetAppbar.dart';
import '../../Config/theme.dart';
import '../../Constants/appConstants.dart';
import '../../CustomWidgets/appRestart.dart';
import '../../CustomWidgets/fullScreenBottomSheet.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/globalData.dart';
import '../../Helper/storageHelper.dart';

void showCurrencyBottomSheet(BuildContext context) {
  var availableLanguages = GlobalData.homeScreenModels?.activeCurrencyList;
  if (availableLanguages != null && availableLanguages.isNotEmpty) {
    showMyModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Scaffold(
        appBar: commonToolBar(
            GenericMethods.getStringValue(
                context, AppStringConstant.changeCurrency),
            context,
            isLeadingEnable: true),
        body: ListView.separated(
          itemCount: availableLanguages.length,
          itemBuilder: (context, index) {
            var item = availableLanguages[index];
            return InkWell(
                onTap: () {
                  if (storageController.getCurrentCurrency() ==
                      item.currencyCode) {
                    ToastUtils.showCustomToast(context, GenericMethods.getStringValue(context, AppStringConstant.alreadySelected),
                        const Icon(Icons.warning), AppColors.yellow);
                  } else {
                    AppRestart.rebirth(context);
                    storageController
                        .setCurrentCurrency(item.currencyCode ?? "");
                  }
                },
                child: ListTile(
                  title: Text(
                    item.description ?? "",
                    style: TextStyle(
                        color: item.currencyCode ==
                                storageController.getCurrentCurrency()
                            ? AppColors.black
                            : AppColors.darkGray),
                  ),
                  dense: true,
                  minLeadingWidth: 0,
                  trailing: item.currencyCode ==
                          storageController.getCurrentCurrency()
                      ? const Icon(
                          Icons.check_circle_outline,
                          color: MobikulTheme.clientPrimaryColor,
                        )
                      : const SizedBox(),
                )

                );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
