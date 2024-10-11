import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PaymentMethodModels/payment_methods.dart';

import '../../../../Config/theme.dart';
import '../../../../Constants/appConstants.dart';
import '../../../../Constants/appStringConstants.dart';
import '../../../../Constants/routeConstant.dart';
import '../../../../CustomWidgets/CommonButton.dart';
import '../../../../Helper/genericMethods.dart';

class PaymentOptionWidget extends StatefulWidget {
  final List<PaymentMethod>? allPaymentMethod;
  final void Function(PaymentMethod)? onChanged;

  const PaymentOptionWidget({Key? key, this.allPaymentMethod, this.onChanged})
      : super(key: key);

  @override
  _PaymentOptionWidgetState createState() => _PaymentOptionWidgetState();
}

class _PaymentOptionWidgetState extends State<PaymentOptionWidget> {
  PaymentMethod? selectedPaymentMethod;

  @override
  void initState() {
    selectedPaymentMethod = widget.allPaymentMethod?[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.allPaymentMethod?.length ?? 0,
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
                  selected: selectedPaymentMethod?.paymentId ==
                      widget.allPaymentMethod?[index].paymentId,
                  contentPadding: EdgeInsets.zero,
                  visualDensity:
                      const VisualDensity(horizontal: -4.0, vertical: -3.0),
                  activeColor: MobikulTheme.clientPrimaryColor,
                  value:
                      widget.allPaymentMethod?[index] ?? PaymentMethod.empty(),
                  groupValue: selectedPaymentMethod,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      selectedPaymentMethod = value;
                      widget.onChanged!(selectedPaymentMethod!);
                    });
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: AppSizes.width / 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (widget.allPaymentMethod?[index].payment ?? "")
                                  .trim(),
                              style: AppTheme.lightTheme.textTheme.labelMedium
                                  ?.copyWith(
                                      color: selectedPaymentMethod?.paymentId ==
                                              widget.allPaymentMethod?[index]
                                                  .paymentId
                                          ? Colors.black
                                          : Colors.grey.shade500),
                            ),
                            Visibility(
                              visible: (widget.allPaymentMethod?[index]
                                          .description ??
                                      "")
                                  .isNotEmpty,
                              child: Text(
                                widget.allPaymentMethod?[index].description ??
                                    "",
                                style: AppTheme.lightTheme.textTheme.bodyLarge
                                    ?.copyWith(
                                        color: selectedPaymentMethod
                                                    ?.paymentId ==
                                                widget.allPaymentMethod?[index]
                                                    .paymentId
                                            ? Colors.black
                                            : Colors.grey.shade500),
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
