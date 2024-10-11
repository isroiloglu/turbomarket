import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/commonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shippingStoreModel.dart';

class ShippingMethodStoreSelectionWidget extends StatefulWidget {
  final List<ShippingStoreModel>? list;

  const ShippingMethodStoreSelectionWidget({Key? key, this.list})
      : super(key: key);

  @override
  _ShippingMethodStoreSelectionWidgetState createState() =>
      _ShippingMethodStoreSelectionWidgetState();
}

class _ShippingMethodStoreSelectionWidgetState
    extends State<ShippingMethodStoreSelectionWidget> {

  ShippingStoreModel? selectedShippingStore;

  @override
  void initState() {
    selectedShippingStore = widget.list?[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              GenericMethods.getStringValue(
                  context, AppStringConstant.selectPickupPoint),
              style: AppTheme.lightTheme.textTheme.labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.list?.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      activeColor: MobikulTheme.clientPrimaryColor,
                      visualDensity: const VisualDensity(horizontal: -4.0),
                      value: widget.list?[index] ?? ShippingStoreModel.empty(),
                      groupValue: selectedShippingStore,
                      selected: selectedShippingStore == widget.list?[index],
                      onChanged: (ShippingStoreModel? value) {
                        setState(() {
                          selectedShippingStore = value;
                          // widget.onChanged!(selectedShippingStore!);
                        });
                      },
                      title: Text(
                        "${widget.list?[index].name ?? ""} (${widget.list?[index].pickupRate ?? ""})",
                        style: AppTheme.lightTheme.textTheme.bodyLarge,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.list?[index].pickupAddress != null && widget.list?[index].pickupAddress != ""
                              ? Text(widget.list?[index].pickupAddress ?? "")
                              : const SizedBox(),
                          widget.list?[index].pickupPhone != null && widget.list?[index].pickupPhone != ""
                              ? Text(widget.list?[index].pickupPhone ?? "")
                              : const SizedBox(),
                          widget.list?[index].deliveryTime != null && widget.list?[index].deliveryTime != ""
                              ? Text(
                                  "${GenericMethods.getStringValue(context, AppStringConstant.deliveryTime)}: ${widget.list?[index].deliveryTime ?? ""}")
                              : const SizedBox(),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: AppSizes.extraPadding,
            ),
            commonButton(
                context,
                () {
                  GlobalData.selectedStore=selectedShippingStore?.storeLocationId??"";
                  Navigator.pop(context);
                },
                GenericMethods.getStringValue(
                    context, AppStringConstant.continueLabel),
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
