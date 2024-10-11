import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/bloc/promotionScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/bloc/promotionScreenState.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/widgets/promotionItem.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/loader.dart';
import '../../Models/PromotionsModel/promotionResponse.dart';
import 'bloc/promotionScreenBloc.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  bool isLoading = true;
  PromotionScreenBloc? promotionScreenBloc;
  var scrollController = ScrollController();
  PromotionResponse? promotionResponse;
  int pageNumber = 1;
  int total = 0;

  void pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        ((promotionResponse?.promotions?.length ?? 0) < total)) {
      setState(() {
        isLoading = true;
        pageNumber += 1;
        promotionScreenBloc?.add(PromotionScreenFetchEvent(pageNumber));
      });
    }
  }

  @override
  void initState() {
    promotionScreenBloc = context.read<PromotionScreenBloc>();
    promotionScreenBloc?.add(PromotionScreenFetchEvent(pageNumber));
    scrollController.addListener(pagination);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize),
          child: commonAppBar(context, false, "", true),
        ),
        body: buildMainUi(context));
  }

  buildMainUi(BuildContext context) {
    return BlocBuilder<PromotionScreenBloc, PromotionScreenState>(
        builder: (context, currentState) {
      if (currentState is PromotionScreenInitialState) {
        isLoading = true;
      } else if (currentState is PromotionScreenSuccessState) {
        isLoading = false;
        promotionResponse = currentState.response;
        total =
            int.parse(currentState.response?.search?.totalItems ?? "0") ?? 0;
      } else if (currentState is PromotionScreenErrorState) {
        isLoading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message ?? '', context);
        });
      }
      promotionScreenBloc?.emit(MyPointsScreenEmptyState());
      return mainListView(context);
    });
  }

  mainListView(BuildContext buildContext) {
    if (isLoading) {
      return const Center(child: Loader());
    } else if (promotionResponse?.promotions == null ||
        (promotionResponse?.promotions?.isEmpty ?? false)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSizes.normalPadding,
            ),
            Text(
              GenericMethods.getStringValue(
                  context, AppStringConstant.noPromotions),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: AppSizes.size10),
        child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: (promotionResponse?.promotions?.length) ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return promotionItem(
                  buildContext, promotionResponse?.promotions?[index]);
            }),
      );
    }
  }
}
