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
import 'package:webview_flutter/webview_flutter.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/commonAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/appLocalization.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/SubmitOrderModel/submit_order_response.dart';

class PaymentWebview extends StatefulWidget {
  final Url? url;
  final int? orderId;
  Function(String) callBack;

  PaymentWebview(
      {Key? key, required this.url, this.orderId, required this.callBack})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaymentWebviewState();
  }
}

class PaymentWebviewState extends State<PaymentWebview> {
  AppLocalizations? _localizations;
  var loadData = 0.0;
  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.callBack('');
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url?.payment,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              // if (request.url.contains(widget.url?.success ?? '')) {
              //   var uri = Uri.dataFromString(request.url);
              //   Navigator.pop(context);
              //   widget.callBack(request.url);
              // }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
              if (url.contains(widget.url?.success ?? '')) {
                // var uri = Uri.dataFromString(url);
                Navigator.pop(context);
                widget.callBack(url);
              }
            },
            onProgress: (value) {
              setState(() {
                loadData = value / 100;
              });
            },
            gestureNavigationEnabled: true,
          ),
          Positioned(
              width: AppSizes.width,
              top: 0,
              child: Visibility(
                  visible: loadData < 1,
                  child: const LinearProgressIndicator(
                    // value: loadData,
                    color: Colors.grey,
                    backgroundColor: Colors.red,
                  )))
        ],
      ),
    );
  }
}
