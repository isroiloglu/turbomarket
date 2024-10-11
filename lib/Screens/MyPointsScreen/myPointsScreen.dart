import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/MyPointsModel/myPointsResponse.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/bloc/myPointScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/bloc/myPointScreenStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/bloc/myPointsScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/widgets/myPointsItem.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/loader.dart';

class MyPointsScreen extends StatefulWidget {
  const MyPointsScreen({Key? key}) : super(key: key);

  @override
  State<MyPointsScreen> createState() => _MyPointsScreenState();
}

class _MyPointsScreenState extends State<MyPointsScreen> {
  bool isLoading = true;
  MyPointScreenBloc? myPointScreenBloc;
  var scrollController = ScrollController();
  MyPointResponse? myPointResponse;

  @override
  void initState() {
    myPointScreenBloc = context.read<MyPointScreenBloc>();
    myPointScreenBloc?.add(MyPointScreenFetchEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize),
          child: commonAppBar(context, false, "",true),
        ),
        body: buildMainUi(context));
  }

  buildMainUi(BuildContext context) {
    return BlocBuilder<MyPointScreenBloc, MyPointScreenState>(
        builder: (context, currentState) {
          if (currentState is MyPointScreenInitialState) {
            isLoading = true;
          } else if (currentState is MyPointScreenSuccessState) {
            isLoading = false;
            myPointResponse=currentState.response;
          }  else if (currentState is MyPointsScreenErrorState) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message ?? '', context);
            });
          }
          myPointScreenBloc?.emit(MyPointsScreenEmptyState());
          return buildOrderListView(context);
        });
  }

  buildOrderListView(BuildContext buildContext) {
    if (isLoading) {
      return const Center(child: Loader());
    } else if (myPointResponse?.pointsDataList == null ||
        (myPointResponse?.pointsDataList?.isEmpty ?? false)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSizes.extraPadding,
            ),
            Text(
              GenericMethods.getStringValue(context, AppStringConstant.noPoints),
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1,
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(AppSizes.sidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.mediumPadding*4 ,),
            Text("${storageController.getUserData()?.firstname ?? ''} ${storageController.getUserData()?.lastname ?? ''}", style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600,)),
            Padding(
              padding: const EdgeInsets.only(top: AppSizes.normalPadding),
              child: Text("${GenericMethods.getStringValue(
                  context, AppStringConstant.yourCaseBackPoint)}${storageController.getUserData()?.points??""}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium?.copyWith(fontWeight: FontWeight.w500,color: MobikulTheme.clientPrimaryColor)),
            ),

            Padding(
              padding: const EdgeInsets.only(top: AppSizes.buttonHeight),
              child: Text(GenericMethods.getStringValue(context, AppStringConstant.transactionHistory),
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColors.darkGray)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: AppSizes.normalPadding),
                child: Stack(children: [

                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: (myPointResponse?.pointsDataList?.length) ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return myPointsItem(
                            orderItems: myPointResponse?.pointsDataList![index], context: buildContext);
                      }),

                ]),
              ),
            ),
          ],
        ),
      );
    }
  }
}
