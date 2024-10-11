import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';



class FilterCheckBox extends StatefulWidget {
  bool selected;
  Function(bool) callback;
   FilterCheckBox(this.selected, this.callback, {Key? key}) : super(key: key);

  @override
  State<FilterCheckBox> createState() => _FilterCheckBoxState();
}

class _FilterCheckBoxState extends State<FilterCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: MobikulTheme.clientPrimaryColor,
      value: widget.selected,
      onChanged: (bool? value) {
        setState(() {
          widget.selected = value!;
        });
        widget.callback(value!);
      },

    );;
  }
}
