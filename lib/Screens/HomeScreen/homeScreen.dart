import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/home_screen_models.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/homeCarousel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/homeCategories.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/search_bar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/bloc/homeScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/bloc/homeScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/bloc/homeScreenStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/widgets/promotionsBanner.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/NavigationDrawerScreen/navigationDrawerScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/widgets/searchTile.dart';

import '../../CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/imagesConstant.dart';
import '../../Constants/routeConstant.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/push_notifications_manager.dart';
import 'Widgets/homeBanner.dart';
import 'Widgets/homeCountries.dart';
import 'Widgets/homeProductListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenBloc? _homeScreenBloc;
  bool isLoading = false;
  HomeScreenModels? homeScreenData;

  @override
  void initState() {
    if (GlobalData.homeScreenModels != null) {
      homeScreenData = GlobalData.homeScreenModels;
    }
    _homeScreenBloc = context.read<HomeScreenBloc>();
    _homeScreenBloc?.add(const HomeScreenDataFetchEvent());
    PushNotificationsManager().setUpFirebase(context);
    PushNotificationsManager().checkInitialMessage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
                AppSizes.appBarSize + AppSizes.extraPadding),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomSearchBar(
                      onWidgetTap: () {
                        GlobalData.selectedIndex = 1;
                        Navigator.pushNamedAndRemoveUntil(
                            context, bottomNavigation, (route) => false);
                      },
                      onTap: () {
                        GlobalData.selectedIndex = 1;
                        Navigator.pushNamedAndRemoveUntil(
                            context, bottomNavigation, (route) => false);
                      },
                      controller: TextEditingController(),
                      onChanged: (String query) {},
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, wishlist);
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        'assets/Images/notification.png',
                      ),
                    ),
                  ),
                ],
              ),
            )),
        body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoadingState) {
              isLoading = true;
            } else if (state is HomeScreenSuccessState) {
              isLoading = false;
              homeScreenData = state.homeScreenModels;
              TabbarController.countController.sink
                  .add(homeScreenData?.productTotal ?? 0);
              storageController
                  .setBadgeCount(homeScreenData?.productTotal.toString());
              GlobalData.homeScreenModels = homeScreenData;
            } else if (state is HomeScreenErrorState) {
              isLoading = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showError(state.message ?? '', context);
              });
            }
            return buildMainUI();
          },
        ),
      ),
    );
  }

  Widget buildMainUI() {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration.zero).then(
          (value) {
            _homeScreenBloc?.add(const HomeScreenDataFetchEvent());
          },
        );
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.size20),
                Visibility(
                    visible: homeScreenData?.bannerList?.isNotEmpty ?? false,
                    child: HomeCarousel(homeScreenData?.bannerList ?? [])),
                const SizedBox(height: AppSizes.size26),
                dynamicUI(context),
                // Visibility(
                //     visible: homeScreenData?.promotionList != null &&
                //         (homeScreenData?.promotionList ?? []).isNotEmpty,
                //     child: Padding(
                //       padding: const EdgeInsets.all(AppSizes.mediumPadding),
                //       child: promotionsBanner(
                //           context, homeScreenData?.promotionList),
                //     ))
              ],
            ),
          ),
          Visibility(visible: isLoading, child: const Loader())
        ],
      ),
    );
  }

  Widget dynamicUI(BuildContext context) {
    final List<Widget> children = <Widget>[];
    children.add(homeCategories(
      context,
      GenericMethods.getStringValue(
              context, AppStringConstant.chooseCategory) ??
          '',
      homeScreenData?.categoryList ?? [],
    ));
    homeScreenData?.productList?.forEach(
      (element) {
        switch (element.type) {
          case AppConstant.country:
            children.add(homeCountries(
                context,
                element.title ?? '',
                element.countries ?? [],
                element.imageVisible ?? false,
                element.image ?? ''));
            break;
          // case AppConstant.page:
          //   children.add(homeBanner(
          //       context,
          //       element.title ?? '',
          //       element.pages ?? [],
          //       element.imageVisible ?? false,
          //       element.image ?? ''));
          //   break;
          // case AppConstant.product:
          //   children.add(homeProductListView(
          //       context,
          //       element.title ?? '',
          //       element.products ?? [],
          //       element.imageVisible ?? false,
          //       element.image ?? ''));
          //   break;
          case AppConstant.category:
            children.add(
              HomeCategoryProductView(
                  element.title ?? '',
                  element.categories ?? [],
                  element.imageVisible ?? false,
                  element.image ?? '',
                  homeScreenData!
                          .productList![
                              homeScreenData!.productList!.indexOf(element)]
                          .id ??
                      ''),
            );
            break;
          default:
            children.add(Container());
            break;
        }
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
