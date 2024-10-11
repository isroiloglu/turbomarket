import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Constants/imagesConstant.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/storageHelper.dart';

Widget topLayout(BuildContext context) {
  return Column(children: [
    Align(alignment: Alignment.topRight, child: Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.normalPadding,AppSizes.extraPadding,AppSizes.mediumPadding,AppSizes.normalPadding),
      child: GestureDetector(onTap:(){
        Navigator.of(context).pop();
      },child: const Icon(Icons.close_sharp,size: AppSizes.size25,)),
    )),
    Padding(
        padding: const EdgeInsets.only(
            top: AppSizes.size25, bottom: AppSizes.size25),
        child: GestureDetector(
          onTap: (){
            if(!(storageController.getLoginStatus() ?? false)){
              Navigator.popAndPushNamed(
                context,
                login,
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  height: AppSizes.size45,
                  width: AppSizes.size40,
                  AppImages.drawerLogo),
              Padding(
                padding: const EdgeInsets.only(left: AppSizes.mediumPadding),
                child: SizedBox(
                  height: 100,
                  width: AppSizes.width/2 - AppSizes.normalPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          GenericMethods.getStringValue(
                              context,
                              storageController.getLoginStatus() ?? false
                                  ? storageController.getUserData()?.firstname ?? ""
                                  : GenericMethods.getStringValue(
                                  context, AppStringConstant.pleaseLogin)),
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: storageController.getLoginStatus() ?? false,
                        child: const SizedBox(
                          height: AppSizes.linePadding,
                        ),
                      ),
                      Visibility(
                        visible: storageController.getLoginStatus() ?? false,
                        child: Text(
                            "${GenericMethods.getStringValue(context, AppStringConstant.yourCaseBackPoint)}  ${storageController.getUserData()?.points}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.orange)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
  ]);
}
