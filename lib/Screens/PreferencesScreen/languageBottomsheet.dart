

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';

import '../../CommonWidgets/AppBar/bottomSheetAppbar.dart';
import '../../Constants/appConstants.dart';
import '../../CustomWidgets/appRestart.dart';
import '../../CustomWidgets/fullScreenBottomSheet.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/globalData.dart';
import '../../Helper/storageHelper.dart';
import '../../main.dart';

void showLanguage(BuildContext context) {
  var availableLanguages = GlobalData.homeScreenModels?.activeLanguageList;
  if (availableLanguages != null && availableLanguages.isNotEmpty) {showMyModalBottomSheet(
    isScrollControlled: true,
    elevation: 0,
    context: context,
    builder: (ctx) => Scaffold(
      appBar: commonToolBar(GenericMethods.getStringValue(context, AppStringConstant.changeLanguage), context, isLeadingEnable: true),
      body: ListView.separated(
        itemCount: availableLanguages.length,
        itemBuilder: (context, index) {
          var item = availableLanguages[index];
          return InkWell(
              onTap: () {
                if(storageController.getCurrentLanguage()==item.langCode){
                  ToastUtils.showCustomToast(context, GenericMethods.getStringValue(context, AppStringConstant.alreadySelected), const Icon(Icons.warning), AppColors.yellow);
                }else{
                  // MyApp.setLocale(context, Locale(item.langCode??""));
                  MyApp.of(context)?.setLocale(item.langCode??"", context);
                  AppRestart.rebirth(context);


                }

              },
              child: ListTile(
                title: Text(item.name??"",style: TextStyle(color: item.langCode==storageController.getCurrentLanguage()?AppColors.black:AppColors.darkGray)),
                // leading: SizedBox(width: 0,),
                // horizontalTitleGap: 0,
                // contentPadding: EdgeInsets.zero,
                dense:true,
                minLeadingWidth: 0,
                trailing: item.langCode==storageController.getCurrentLanguage()? const Icon(Icons.check_circle_outline, color: MobikulTheme.clientPrimaryColor,) : const SizedBox(),
              )

          );
        }, separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 2,
          height: 2,
        );
      },),
    ),
  );


  }
}