import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeFronts.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeSelectionResponse.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenBloc.dart';

import '../../../Constants/imagesConstant.dart';
import '../bloc/storeSelectionScreenEvents.dart';

Widget storeSelectionGridView(
    context,
    StoreSelectionResponse storeSelectionResponse,
    StoreSelectionScreenBloc storeSelectionScreenBloc,
    StoreFront? selectedStore) {
  return Column(
    children: [
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          storeSelectionScreenBloc.add(StoreSelectionLoadingEvent(
              storeSelectionResponse.storeFrontList![0]));
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: storeSelectionResponse.storeFrontList?[0].url ==
                                selectedStore?.url
                            ? MobikulTheme.clientPrimaryColor
                            : MobikulTheme.lightGrey),
                    child: Image.asset(
                      'assets/Images/delivery-active.png',
                      color: storeSelectionResponse.storeFrontList?[0].url ==
                              selectedStore?.url
                          ? AppColors.white
                          : AppColors.black,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: AppSizes.size20,
                  ),
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.wholeSale),
                    // storeSelectionResponse.storeFrontList?[0].name ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  )
                ],
              ),
              Transform.scale(
                scale: 1.1,
                child: Checkbox(
                  value: storeSelectionResponse.storeFrontList?[0].url ==
                      selectedStore?.url,
                  onChanged: (v) {
                    storeSelectionScreenBloc.add(StoreSelectionLoadingEvent(
                        storeSelectionResponse.storeFrontList![0]));
                  },
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          storeSelectionScreenBloc.add(StoreSelectionLoadingEvent(
              storeSelectionResponse.storeFrontList![1]));
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: storeSelectionResponse.storeFrontList?[1].url ==
                                selectedStore?.url
                            ? MobikulTheme.clientPrimaryColor
                            : MobikulTheme.lightGrey),
                    child: Image.asset(
                      'assets/Images/bag-menu.png',
                      color: storeSelectionResponse.storeFrontList?[1].url ==
                              selectedStore?.url
                          ? AppColors.white
                          : AppColors.black,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: AppSizes.size20,
                  ),
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.retailer),

                    // storeSelectionResponse.storeFrontList?[1].name ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  )
                ],
              ),
              Transform.scale(
                scale: 1.1,
                child: Checkbox(
                  value: storeSelectionResponse.storeFrontList?[1].url ==
                      selectedStore?.url,
                  onChanged: (v) {
                    storeSelectionScreenBloc.add(StoreSelectionLoadingEvent(
                        storeSelectionResponse.storeFrontList![1]));
                  },
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
