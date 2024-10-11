import 'dart:async';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/imagesConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/accountScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/bloc/accountScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/bloc/accountScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/cartScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/bloc/homeScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/homeScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/NavigationDrawerScreen/navigationDrawerScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/bloc/searchScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/bloc/searchSreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/searchScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/storeSelectionScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/wishListScreen.dart';

import '../../Constants/appConstants.dart';
import '../../Screens/CategoryScreen/bloc/categoryScreenBloc.dart';
import '../../Screens/CategoryScreen/bloc/categoryScreenRepository.dart';
import '../../Screens/CategoryScreen/categoryScreen.dart';
import '../../Screens/HomeScreen/Widgets/itemCardBloc/itemCardBloc.dart';
import '../../Screens/HomeScreen/Widgets/itemCardBloc/itemCardRepository.dart';
import '../../Screens/HomeScreen/bloc/homeScreenRepository.dart';
import 'badgeIcon.dart';

class TabbarController {
  static StreamController<int> countController =
      StreamController<int>.broadcast();

  TabbarController._privateConstructor();

  static final TabbarController _instance =
      TabbarController._privateConstructor();

  factory TabbarController() {
    return _instance;
  }
}

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final pages = [
    MultiBlocProvider(providers: [
      BlocProvider<HomeScreenBloc>(
        create: (_) => HomeScreenBloc(
          repository: HomeScreenRepositoryImp(),
        ),
        child: HomeScreen(),
      ),
      BlocProvider<ItemCardBloc>(
        create: (context) => ItemCardBloc(
          repository: ItemCardRepositoryImp(),
        ),
      ),
    ], child: const HomeScreen()),
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => SearchScreenBloc(
          repository: SearchImpRepository(),
        ),
        child: SearchScreen(),
      ),
      // BlocProvider<ItemCardBloc>(
      //   create: (context) => ItemCardBloc(
      //     repository: ItemCardRepositoryImp(),
      //   ),
      // ),
    ], child: const SearchScreen()),
    BlocProvider<StoreSelectionScreenBloc>(
      create: (context) => StoreSelectionScreenBloc(
          repositoryImp: StoreSelectionRepositoryImp()),
      child: StoreSelectionScreen(false),
    ),
    BlocProvider<CartScreenBloc>(
      create: (context) =>
          CartScreenBloc(repository: CartScreenRepositoryImp()),
      child: const CartScreen(),
    ),
    BlocProvider<AccountScreenBloc>(
      create: (context) =>
          AccountScreenBloc(repository: AccountScreenRepositoryImp()),
      child: const NavigationDrawerScreen(),
    ),
    Container()
  ];
  var badgeCount = 0;

  @override
  void initState() {
    if (storageController.getBadgeCount().isNotEmpty &&
        storageController.getBadgeCount() != "null" &&
        storageController.getBadgeCount() != "0") {
      badgeCount = int.parse(storageController.getBadgeCount());
    } else {
      badgeCount = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _registerStreamListener();
    return Scaffold(
      body: pages[GlobalData.selectedIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  void _registerStreamListener() {
    TabbarController.countController.stream.listen((event) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          badgeCount = event;
        });
      });
    });
  }

  Widget buildMyNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8),
      child: ConvexAppBar.badge(
        const {},
        onTap: (int i) {
          setState(() {
            GlobalData.selectedIndex = i;
          });
        },
        style: TabStyle.fixed,
        activeColor: MobikulTheme.clientPrimaryColorA,
        color: Colors.white,
        top: -16,
        cornerRadius: 12,
        curveSize: 70,
        backgroundColor: Colors.grey.shade400,
        initialActiveIndex: GlobalData.selectedIndex,
        items: [
          TabItem(
            fontFamily: 'SF-Pro-Display',
            activeIcon: Padding(
              padding: const EdgeInsets.all(1),
              child: Image.asset(
                AppImages.homeIcon,
                color: MobikulTheme.clientPrimaryColor,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.homeIcon,
                height: 2,
                width: 2,
              ),
            ),
            title: GenericMethods.getStringValue(
              context,
              AppStringConstant.home,
            ),
          ),
          TabItem(
            icon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.searchIcon,
                height: 24,
                width: 24,
              ),
            ),
            fontFamily: 'SF-Pro-Display',
            activeIcon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.searchIcon,
                height: 24,
                width: 24,
                color: MobikulTheme.clientPrimaryColor,
              ),
            ),
            title: GenericMethods.getStringValue(
              context,
              AppStringConstant.catalog,
            ),
          ),
          TabItem(
            icon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.appLogo,
                height: 24,
                width: 24,
              ),
            ),
            fontFamily: 'SF-Pro-Display',
            activeIcon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.appLogo,
                height: 24,
                width: 24,
                // color: MobikulTheme.clientPrimaryColor,
              ),
            ),
            title: GenericMethods.getStringValue(
              context,
              storageController.getStoreData()!.storefrontId == "1"
                  ? AppStringConstant.wholeSale
                  : AppStringConstant.retailer,
            ),
          ),
          TabItem(
            icon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.cartIcon,
                height: 24,
                width: 24,
              ),
            ),
            fontFamily: 'SF-Pro-Display',
            activeIcon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.cartIcon,
                height: 24,
                width: 24,
                color: MobikulTheme.clientPrimaryColor,
              ),
            ),
            title: GenericMethods.getStringValue(
              context,
              AppStringConstant.cart,
            ),
          ),
          TabItem(
            icon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.profileIcon,
                height: 24,
                width: 24,
              ),
            ),
            fontFamily: 'SF-Pro-Display',
            activeIcon: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                AppImages.profileIcon,
                height: 24,
                width: 24,
                color: MobikulTheme.clientPrimaryColor,
              ),
            ),
            title: GenericMethods.getStringValue(
              context,
              AppStringConstant.profile,
            ),
          ),
        ],
      ),
    );
    return BottomAppBar(
      color: AppColors.transparent,
      notchMargin: 30.0,
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomNavigationItem(
              "home",
            ),
            bottomNavigationItem(
              "search",
            ),
            bottomNavigationItem(
              "retails",
            ),
            bottomNavigationItem(
              "basket",
            ),
            bottomNavigationItem(
              "profile",
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationItem(String type) {
    return GestureDetector(
      onTap: () {
        int index = 0;
        switch (type) {
          case "home":
            index = 0;
            break;

          case "search":
            index = 1;
            break;

          case "retails":
            index = 2;
            break;

          case "basket":
            index = 3;
            break;

          case "profile":
            index = 4;
            break;
        }
        setState(() {
          GlobalData.selectedIndex = index;
        });
      },
      child: Stack(
        children: [
          SizedBox(
            child: type == "cart"
                ? BadgeIcon(
                    icon: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                              enableFeedback: false,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSizes.normalPadding),
                                child: getIcon(type),
                              )),
                          getText(type)
                        ],
                      ),
                    ),
                    badgeCount: badgeCount,
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          enableFeedback: false,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: AppSizes.normalPadding),
                            child: getIcon(type),
                          )),
                      getText(type)
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Image getIcon(String type) {
    Image? bottomImage;
    switch (type) {
      case "home":
        if (GlobalData.selectedIndex == 0) {
          bottomImage = Image.asset(AppImages.homeIcon,
              width: 20,
              height: 20,
              color: Theme.of(context).bottomAppBarTheme.color);
        } else {
          bottomImage = Image.asset(
            AppImages.homeIcon,
            width: 20,
            height: 20,
          );
        }
        break;

      case "search":
        if (GlobalData.selectedIndex == 1) {
          bottomImage = Image.asset(AppImages.searchIcon,
              width: 20,
              height: 20,
              color: Theme.of(context).bottomAppBarTheme.color);
        } else {
          bottomImage = Image.asset(
            AppImages.searchIcon,
            width: 20,
            height: 20,
          );
        }
        break;
      case "retails":
        if (GlobalData.selectedIndex == 2) {
          bottomImage = Image.asset(
            AppImages.arrowDown,
            color: Colors.grey.shade400,
            width: 20,
            height: 20,
          );
        } else {
          bottomImage = Image.asset(
            AppImages.retailIcon,
            width: 20,
            height: 20,
          );
        }
        break;

      case "basket":
        if (GlobalData.selectedIndex == 3) {
          bottomImage = Image.asset(AppImages.myFavoriteIcon,
              width: 20,
              height: 20,
              color: Theme.of(context).bottomAppBarTheme.color);
        } else {
          bottomImage = Image.asset(
            AppImages.myFavoriteIcon,
            width: 20,
            height: 20,
          );
        }
        break;

      case "profile":
        if (GlobalData.selectedIndex == 4) {
          bottomImage = Image.asset(AppImages.profileIcon,
              width: 20,
              height: 20,
              color: Theme.of(context).bottomAppBarTheme.color);
        } else {
          bottomImage = Image.asset(
            AppImages.profileIcon,
            width: 20,
            height: 20,
          );
        }
        break;
    }
    return bottomImage!;
  }

  Text getText(String type) {
    Text? navigationText;
    switch (type) {
      case "home":
        if (GlobalData.selectedIndex == 0) {
          navigationText = Text(
            GenericMethods.getStringValue(context, AppStringConstant.home),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF-Pro-Display',
                color: MobikulTheme.clientPrimaryColor),
          );
        } else {
          navigationText = Text(
            GenericMethods.getStringValue(context, AppStringConstant.home),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'SF-Pro-Display',
              color: AppColors.white,
            ),
          );
        }
        break;

      case "search":
        if (GlobalData.selectedIndex == 1) {
          navigationText = Text(
            GenericMethods.getStringValue(context, AppStringConstant.search),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF-Pro-Display',
                color: MobikulTheme.clientPrimaryColor),
          );
        } else {
          navigationText = Text(
            GenericMethods.getStringValue(context, AppStringConstant.search),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'SF-Pro-Display',
              color: AppColors.white,
            ),
          );
        }
        break;

      case "retails":
        if (GlobalData.selectedIndex == 2) {
          navigationText = const Text(
            // GenericMethods.getStringValue(
            //     context,
            //     storageController.getStoreData()!.storefrontId == "1"
            //         ? AppStringConstant.wholeSale
            //         : AppStringConstant.retailer),
            '',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF-Pro-Display',
                color: MobikulTheme.clientPrimaryColor),
          );
        } else {
          navigationText = const Text(
            // GenericMethods.getStringValue(
            //     context,
            // (StorageController().getStoreData()?.storefrontId ?? '') == "1"
            //     ? AppStringConstant.wholeSale
            //     : AppStringConstant.retailer),
            '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'SF-Pro-Display',
              color: AppColors.white,
            ),
          );
        }
        break;

      case "basket":
        if (GlobalData.selectedIndex == 3) {
          navigationText = Text(
              GenericMethods.getStringValue(context, AppStringConstant.cart),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF-Pro-Display',
                  color: MobikulTheme.clientPrimaryColor));
        } else {
          navigationText = Text(
            GenericMethods.getStringValue(context, AppStringConstant.cart),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF-Pro-Display',
              color: AppColors.white,
            ),
          );
        }
        break;

      case "profile":
        if (GlobalData.selectedIndex == 4) {
          navigationText = Text(
              GenericMethods.getStringValue(context, AppStringConstant.profile),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF-Pro-Display',
                  color: MobikulTheme.clientPrimaryColor));
        } else {
          navigationText = Text(
            GenericMethods.getStringValue(context, AppStringConstant.profile),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF-Pro-Display',
                color: AppColors.white),
          );
        }
        break;
    }

    return navigationText!;
  }
}
