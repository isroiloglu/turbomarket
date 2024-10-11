import 'package:flutter/material.dart';

import '../Constants/appConstants.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    required this.controller,
    required this.isPassword,
    this.onSave,
    required this.validator,
    required this.hint,
    this.minLine,
    this.maxLine = 1,
    this.isEmail = false,
    this.showPasswordButton = false,
    this.isPhone = false,
    this.readonly = false,
    this.focusNode,
    this.style,
    this.intialValue,
    this.title,
    Key? key,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final bool isPassword, isEmail, readonly, isPhone, showPasswordButton;
  final FormFieldValidator validator;
  final FormFieldSetter<String>? onSave;
  final TextStyle? style;
  final String? intialValue;
  final FocusNode? focusNode;
  final int? minLine;
  final int? maxLine;
  final String? title;

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.intialValue,
      onSaved: widget.onSave,
      minLines: (widget.minLine),
      maxLines: (widget.maxLine),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontFamily: 'SF-Pro-Display'),
      autofocus: false,
      focusNode: widget.focusNode,
      cursorColor: Colors.grey,
      readOnly: widget.readonly,
      keyboardType: widget.isPhone
          ? TextInputType.phone
          : widget.isPassword
              ? TextInputType.visiblePassword
              : widget.isEmail
                  ? TextInputType.emailAddress
                  : TextInputType.text,
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.onPrimary,
        focusColor: Theme.of(context).colorScheme.onPrimary,
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              //  Theme.of(context).colorScheme.onPrimary,
              width: 1,
            )),
        errorMaxLines: 2,
        disabledBorder: const OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.zero),
        isDense: true,
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.lightGray),
        border: OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.circular(12)),
        labelText: widget.title,
        labelStyle: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500),
        suffixIcon: widget.isPassword && widget.showPasswordButton
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                  size: AppSizes.iconSize,
                  // color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      validator: widget.validator,
    );
  }
}
