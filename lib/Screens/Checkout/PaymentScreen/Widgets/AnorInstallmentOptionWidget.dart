/*
 *  Webkul Software.
 *
 *  @package  Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html 
 *  @link https://store.webkul.com/license.html
 *
 */
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PaymentMethodModels/payment_methods.dart';

class AnorInstallmentOptionWidget extends StatefulWidget {
  final VendorRecipient vendorRecipient;
  final void Function(String) onChanged;

  const AnorInstallmentOptionWidget(
      {Key? key, required this.vendorRecipient, required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnorInstallmentOptionWidgetState();
  }
}

class AnorInstallmentOptionWidgetState
    extends State<AnorInstallmentOptionWidget> {
  String? selectedInstallmentId;
  final List<String> labels = [
    AppStringConstant.emiLabel1,
    AppStringConstant.emiLabel2,
    AppStringConstant.emiLabel3,
    AppStringConstant.emiLabel4,
  ];



  @override
  void initState() {
    selectedInstallmentId =  widget.vendorRecipient.simpleRecipientId??"";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> values = [
      widget.vendorRecipient.simpleRecipientId??"",
      widget.vendorRecipient.threemonthRecipientId??"",
      widget.vendorRecipient.sixmonthRecipientId??"",
      widget.vendorRecipient.twelvemonthRecipientId??"",
    ];

    return ListView.builder(
        itemCount: labels.length,
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
              child: RadioListTile(
                selected: selectedInstallmentId == values[index],
                contentPadding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4.0, vertical: -3.0),
                activeColor: MobikulTheme.clientPrimaryColor,
                value: values[index],
                groupValue: selectedInstallmentId,
                onChanged: (String? value) {
                  setState(() {
                    selectedInstallmentId = value;
                  });
                  widget.onChanged(value!);
                },
                title: Text(
                  GenericMethods.getStringValue(context, labels[index]),
                  style: AppTheme.lightTheme.textTheme.labelSmall
                      ?.copyWith(color:selectedInstallmentId == values[index] ?Colors.black : Colors.grey.shade700, ),
                ),
              ),
            ),
          );
        });
  }
}
