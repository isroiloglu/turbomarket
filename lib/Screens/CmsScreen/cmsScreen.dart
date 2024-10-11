import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CmsScreen/bloc/cmsScreenStates.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/arguments_map.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/loader.dart';
import '../../Models/ProductDetailModels/response/cms_page_detail.dart';
import 'bloc/cmsScreenBloc.dart';
import 'bloc/cmsScreenEvents.dart';

class CmsScreen extends StatefulWidget {
  Map<String , dynamic>? argument;
  CmsScreen(this.argument, {super.key});


  @override
  State<CmsScreen> createState() => _CmsScreenState();
}

class _CmsScreenState extends State<CmsScreen> {
  CMSScreenBloc? _cmsScreenBloc;
  bool isLoading = true;
  CMSPageDetail? cmsPageDetail;

  @override
  void initState() {
    _cmsScreenBloc = context.read<CMSScreenBloc>();
    _cmsScreenBloc?.add(CMSScreenDataFetchEvent(widget.argument?[pageIdKey] ?? "1"));
    cmsPageDetail = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,
      appBar: PreferredSize(
        preferredSize:  const Size.fromHeight(AppSizes.appBarSize),
        child: commonAppBar(context, false, "",true),
      ),

      body: BlocBuilder<CMSScreenBloc, CMSScreenState>(
        builder: (context,currentState){
          if (currentState is CMSScreenInitial) {
            isLoading = true;
            cmsPageDetail = null;
          } else if (currentState is CMSScreenSuccess) {
            cmsPageDetail = currentState.cmsPageDetail;
            isLoading = false;
          } else if (currentState is CMSScreenError) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message ?? '', context);
            });
          }
          return _buildUI(cmsPageDetail);
        },
      ),

    );
  }

  Widget _buildUI(CMSPageDetail? cmsPageDetail) {
    return Stack(
      children: [
        Visibility(
          visible: !isLoading,
          child: Padding(
            padding: const EdgeInsets.only(left: AppSizes.normalPadding,right: AppSizes.normalPadding),
            child: WebView(
              initialUrl: "",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (c) {
                _loadHtmlFromAssets(c);
              },
            ),
          ),
        ),
        Visibility(visible: isLoading, child: const Loader())
      ],
    );
  }

  _loadHtmlFromAssets(_controller) async {
    String fileText = cmsPageDetail?.description ?? "";
    _controller?.loadUrl(Uri.dataFromString("""<!DOCTYPE html>
    <html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
      <body style='"margin: 0; padding: 0;'>
        <div>
          $fileText
        </div>
      </body>
    </html>""", mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
