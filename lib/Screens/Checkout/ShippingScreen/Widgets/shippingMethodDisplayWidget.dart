import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/Widgets/shippingMethodStoreWidget.dart';

class ShippingMethodDisplayWidget extends StatefulWidget {
  final List<shippingMethods>? allShippingMethods;
  final void Function(shippingMethods)? onChanged;


  const ShippingMethodDisplayWidget({Key? key, this.allShippingMethods,this.onChanged})
      : super(key: key);

  @override
  _ShippingMethodDisplayWidgetState createState() =>
      _ShippingMethodDisplayWidgetState();
}

class _ShippingMethodDisplayWidgetState
    extends State<ShippingMethodDisplayWidget> {
  shippingMethods? selectedShippingMethod;

  @override
  void initState() {
    selectedShippingMethod = widget.allShippingMethods?[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.allShippingMethods?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: MobikulTheme.clientPrimaryColor)),
                child:
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  visualDensity:
                      const VisualDensity(horizontal: -4.0, vertical: -3.0),
                  activeColor: MobikulTheme.clientPrimaryColor,
                  value: widget.allShippingMethods?[index] ?? shippingMethods.empty(),
                  groupValue: selectedShippingMethod,
                  selected: selectedShippingMethod == widget.allShippingMethods?[index],
                  onChanged: (shippingMethods? value) {
                    setState(() {
                      selectedShippingMethod = value;
                      widget.onChanged!(selectedShippingMethod!);
                    });
                  },

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppSizes.width /2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (widget.allShippingMethods?[index].shipping ?? "")
                                  .trim(),
                              style: AppTheme.lightTheme.textTheme.labelMedium
                                  ?.copyWith(color: Colors.grey.shade500),
                            ),
                            Visibility(
                              visible: (widget.allShippingMethods?[index].deliveryTime ?? "").isNotEmpty,
                              child: Text(widget
                                      .allShippingMethods?[index].deliveryTime ??
                                  ""),
                            ),
                            Visibility(
                              visible: (widget.allShippingMethods?[index]
                                  .description ??
                                  "").isNotEmpty,
                              child: Html(
                                  data: widget.allShippingMethods?[index]
                                          .description ??
                                      ""),
                            ),
                            (widget.allShippingMethods?[index].stores != null) &&(selectedShippingMethod == widget.allShippingMethods?[index])
                                ? GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              ShippingMethodStoreSelectionWidget(
                                                  list: widget
                                                      .allShippingMethods?[
                                                          index]
                                                      .stores));
                                    },
                                    child: Text(
                                      GenericMethods.getStringValue(
                                          context,
                                          AppStringConstant
                                              .availablePickupPoints),
                                      style: AppTheme
                                          .lightTheme.textTheme.bodyMedium
                                          ?.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: MobikulTheme
                                                  .clientPrimaryColor),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      Text(widget.allShippingMethods?[index]?.rate ?? "",
                          style: AppTheme.lightTheme.textTheme.bodyLarge),
                    ],
                  ),
                )
            ),
          );
        });
  }
}
