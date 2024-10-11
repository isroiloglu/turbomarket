import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';

import '../../../Constants/appConstants.dart';

class SliderForOnBoarding extends StatelessWidget {
  String? image, description, logo, heading;

  SliderForOnBoarding(
      {super.key, this.image, this.description, this.logo, this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.extraPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              height: AppSizes.height * 0.033,
              width: AppSizes.width / 4,
              image: AssetImage(logo!)),
          SizedBox(height: AppSizes.height * 0.12),
          Image(
              height: AppSizes.width / 1.5,
              width: AppSizes.width / 1.5,
              image: AssetImage(image!)),
          SizedBox(
            height: AppSizes.height * 0.09,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.185),
            child: Text(
              GenericMethods.getStringValue(context, heading!),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  fontFamily: 'SF-Pro-Display',
                  letterSpacing: -0.5),
            ),
          ),
          const SizedBox(
            height: AppSizes.extraPadding + 4,
          ),
          Text(
            GenericMethods.getStringValue(context, description ?? ''),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'SF-Pro-Display',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
