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
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PaymentMethodModels/payment_methods.dart';

class AnorSavedCardOptionWidget extends StatefulWidget {
  final List<SavedCard>? allSavedCard;
  final void Function(SavedCard)? onChanged;

  const AnorSavedCardOptionWidget({Key? key, this.allSavedCard, this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnorSavedCardOptionWidgetState();
  }
}

class AnorSavedCardOptionWidgetState extends State<AnorSavedCardOptionWidget> {
  SavedCard? selectedCard;

  @override
  void initState() {
    selectedCard = widget.allSavedCard?[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.allSavedCard!.length ?? 0,
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
                selected: selectedCard?.id == widget.allSavedCard?[index].id,
                contentPadding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4.0, vertical: -3.0),
                activeColor: MobikulTheme.clientPrimaryColor,
                value: widget.allSavedCard?[index] ?? SavedCard.empty(),
                groupValue: selectedCard,
                onChanged: (SavedCard? value) {
                  debugPrint("savedCard --> " + value!.toJson().toString());
                  setState(() {
                    selectedCard = value;
                    widget.onChanged!(selectedCard!);
                  });
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.allSavedCard![index].account!,
                      style: AppTheme.lightTheme.textTheme.labelSmall
                          ?.copyWith(color: selectedCard?.id == widget.allSavedCard?[index].id ? Colors.black :Colors.grey.shade700, ),
                    ),
                    Text(
                      widget.allSavedCard![index].cardnumber!,
                      style: AppTheme.lightTheme.textTheme.labelSmall
                          ?.copyWith(color: selectedCard?.id == widget.allSavedCard?[index].id ? Colors.black :Colors.grey.shade700,),
                    ),
                    Text(
                      widget.allSavedCard![index].exp!,
                      style: AppTheme.lightTheme.textTheme.labelSmall
                          ?.copyWith(color: selectedCard?.id == widget.allSavedCard?[index].id ? Colors.black :Colors.grey.shade700,),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
