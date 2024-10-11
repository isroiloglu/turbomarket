import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import '../Helper/genericMethods.dart';

class ProductAvailabilityWidget extends StatelessWidget {
  final bool isInStock;
  final bool isOutStock;
  final bool isOnRequest;
  final bool isFromProduct;

  const ProductAvailabilityWidget({Key? key, required this.isInStock, required this.isOutStock, required this.isOnRequest, this.isFromProduct = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.background
      ),
      padding: const EdgeInsets.all(AppSizes.linePadding/2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(

            isInStock ? Icons.check_circle_outline
                : isOutStock ? Icons.notifications_none_outlined : Icons.info_outline ,
            color: isInStock ? AppTheme.cashbackPointColor : MobikulTheme.clientPrimaryColor,
            size: 16.0,
          ),
          const SizedBox(width: 4.0),
          Text(
            isInStock
                ? GenericMethods.getStringValue(context, AppStringConstant.available)
                : isOutStock
                ? GenericMethods.getStringValue(context, AppStringConstant.outStock)
                : GenericMethods.getStringValue(context, AppStringConstant.notAvailable),
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                color: isInStock ? AppTheme.cashbackPointColor : MobikulTheme.clientPrimaryColor,
              fontSize: isFromProduct ? 12 : 10
            ),
          )
        ],
      ),
    );
  }
}
