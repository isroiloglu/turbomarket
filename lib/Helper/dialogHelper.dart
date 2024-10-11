import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/commonTextField.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';

import '../Config/theme.dart';
import '../Constants/appConstants.dart';
import 'appLocalization.dart';


class DialogHelper {
  static confirmationDialog(
      String text, BuildContext context,
      {VoidCallback? onConfirm,
        VoidCallback? onCancel,
        bool? barrierDismissible}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (ctx) => AlertDialog(
        content: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: <Widget>[
          TextButton(
            style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(MobikulTheme.clientPrimaryColor)),
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onCancel != null) {
                onCancel();
              }
            },
            child: Text(
              GenericMethods.getStringValue(context, AppStringConstant.cancel)
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.white),
            ),
          ),
          TextButton(
            style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(MobikulTheme.clientPrimaryColor)),
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              GenericMethods.getStringValue(context, AppStringConstant.ok)
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  static showExceptionDialog(String text, BuildContext context,
      {VoidCallback? onConfirm, String? buttonText}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(
          text,
        ),
        actions: <Widget>[
          TextButton(
            style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(MobikulTheme.clientPrimaryColor)),
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              buttonText ==  null ? GenericMethods.getStringValue(context, AppStringConstant.retry)
                  .toUpperCase() : buttonText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }



  static showLoginDialog(String text, BuildContext context,
      {VoidCallback? onConfirm, String? buttonText}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(
          text,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              buttonText ?? 'Retry',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }

  static deleteAccountConfirmationDialog(
      BuildContext context, String title , String description,Function(String)? onConfirm, bool isLoading ) {
    TextEditingController _passwordEditingController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey();

    showDialog(
      context: context,
      builder: (ctx) => Stack(
        children: [
          AlertDialog(
            title: Text(
                title,style: Theme.of(context).textTheme.bodyLarge
            ),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    description,style: Theme.of(context).textTheme.bodyMedium,
                  ),
                 const SizedBox(height: AppSizes.mediumPadding,),
                  CommonTextField(
                    onSave: (value) {
                    },
                    controller: _passwordEditingController,
                    isPassword: true,
                    showPasswordButton: true,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return  GenericMethods.getStringValue(context,AppStringConstant.password)+" "+GenericMethods.getStringValue(context,AppStringConstant.isRequired);
                      }
                      if (value.toString().length<6) {
                        return  GenericMethods.getStringValue(context,AppStringConstant.digitPasswordRequired);
                      }
                    },
                    style: Theme.of(context).textTheme.bodyText1, hint: GenericMethods.getStringValue(context,AppStringConstant.password),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  GenericMethods.getStringValue(context, AppStringConstant.cancel).toUpperCase(),style:Theme.of(context).textTheme.bodyText1,
                ),),
              TextButton(
                onPressed: () {
                  print("validate ${_formKey.currentState?.validate()}");
                  if (_formKey.currentState?.validate() == true) {
                    GenericMethods.hideSoftKeyBoard();
                    if (onConfirm != null) {
                      //closeDialog(ctx);
                      onConfirm(_passwordEditingController.text);
                    }
                  }

                },
                child: Text(
                    GenericMethods.getStringValue(context, AppStringConstant.ok).toUpperCase(),style:Theme.of(context).textTheme.bodyText1
                ),
              ),
            ],
          ),
          Visibility(
              visible: isLoading,
              child: Loader())
        ],
      ),
    );
  }

  static notificationPermissionDialog(
      String text, BuildContext context,
      {VoidCallback? onConfirm}) {



    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(GenericMethods.getStringValue(context, AppStringConstant.enableNotification,),
         style: Theme.of(context).textTheme.bodyMedium,
           ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        actions: <Widget>[
          TextButton(
            style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(MobikulTheme.clientPrimaryColor)),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(
              GenericMethods.getStringValue(context, AppStringConstant.cancel)
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.white),
            ),
          ),
          TextButton(
            style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(MobikulTheme.clientPrimaryColor)),
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              GenericMethods.getStringValue(context, AppStringConstant.ok)
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  static loaderDialog(String title, String description, BuildContext context,
      AppLocalizations? localizations) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        title: Text(localizations?.translate(title) ?? ''),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: MobikulTheme.clientAccentColor,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(localizations?.translate(description) ?? '', style: Theme.of(context).textTheme.headlineSmall,),
            ),
          ],
        ),
      ),
    );
  }
}
