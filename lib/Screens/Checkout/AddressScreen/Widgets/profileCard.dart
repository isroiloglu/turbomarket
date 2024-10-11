import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/MultipleProfilesModel/profileUserModel.dart';

class ProfileCard extends StatelessWidget {
  final ProfileUserModel? profileUserModel;
  final int? selectedIndex;
  final int? index;

  const ProfileCard(
      {Key? key, this.profileUserModel, this.selectedIndex, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: AppSizes.extraPadding,
          bottom: AppSizes.normalPadding,
          right: AppSizes.extraPadding),
      width: AppSizes.width,
      padding: const EdgeInsets.all(AppSizes.size16),
      decoration: BoxDecoration(
          color: index == selectedIndex
              ? Colors.blue.shade100.withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/Images/location.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(
            width: AppSizes.size10,
          ),
          SizedBox(
              width: AppSizes.width - 120,
              child: Text(
                "${profileUserModel?.bFirstname ?? ""} ${profileUserModel?.bCity ?? ""} ${profileUserModel?.bStateDescr ?? ""} ${profileUserModel?.bZipcode ?? ""} ${profileUserModel?.bCountryDescr ?? ""}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )),
          // const SizedBox(
          //   height: AppSizes.extraPadding,
          // ),
          // Text(GenericMethods.getStringValue(context, AppStringConstant.edit),
          //     style: AppTheme.lightTheme.textTheme.bodyMedium
          //         ?.copyWith(color: MobikulTheme.clientPrimaryColor,fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
