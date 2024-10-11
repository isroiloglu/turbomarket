import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/bloc/cartScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/cartScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/bloc/guestCheckoutBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/guestCheckoutScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/OrderSuccessScreen/orderSuccessScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/bloc/paymentScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/bloc/shippingBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/shippingScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CountryProductsScreen/Bloc/CountryProductRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CountryProductsScreen/Bloc/countryProductBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CountryProductsScreen/countryProductsView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/accountScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/bloc/accountScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ForgotPasswordScreen/bloc/forgotPasswordBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ForgotPasswordScreen/forgotPasswordScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderDetailScreen/bloc/orderDetailBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderDetailScreen/bloc/orderDetailRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderDetailScreen/orderDetailScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/addressScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/bloc/profilesBloc/multipleProfilesRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/productScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/bloc/homeScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CatalogScreen/bloc/catalogScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CatalogScreen/bloc/ccatalogScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CatalogScreen/catalogScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CmsScreen/cmsScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/homeScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/SignUpScreen/bloc/signUpSCreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/SignUpScreen/bloc/signUpScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/myPointsScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderListScreen/bloc/orderListBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OrderListScreen/orderListScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/bloc/promotionScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/bloc/promotionScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/promotionScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/bloc/searchScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/bloc/searchSreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/searchScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/storeSelectionScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SubCategoryScreen/bloc/subCategoryBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SubCategoryScreen/bloc/subCategoryRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SubCategoryScreen/subCategoryScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListRepository.dart';

import '../CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import '../Screens/AccountScreen/bloc/accountScreenRepository.dart';
import '../Screens/CategoryScreen/bloc/categoryScreenBloc.dart';
import '../Screens/CategoryScreen/bloc/categoryScreenRepository.dart';
import '../Screens/CategoryScreen/categoryScreen.dart';
import '../Screens/Checkout/AddressScreen/bloc/profilesBloc/multipleProfilesBloc.dart';
import '../Screens/Checkout/GuestCheckout/bloc/guestCheckoutRepository.dart';
import '../Screens/Checkout/PaymentScreen/bloc/paymentScreenRepository.dart';
import '../Screens/Checkout/PaymentScreen/paymentScreen.dart';
import '../Screens/Checkout/ShippingScreen/bloc/shippingRepository.dart';
import '../Screens/CmsScreen/bloc/cmsScreenBloc.dart';
import '../Screens/CmsScreen/bloc/cmsScreenRepository.dart';
import '../Screens/ForgotPasswordScreen/bloc/forgotPasswordRepository.dart';
import '../Screens/HomeScreen/Widgets/itemCardBloc/itemCardBloc.dart';
import '../Screens/HomeScreen/Widgets/itemCardBloc/itemCardRepository.dart';
import '../Screens/HomeScreen/bloc/homeScreenBloc.dart';
import '../Screens/LoginSignUpScreen/LoginScreen/loginScreen.dart';
import '../Screens/LoginSignUpScreen/SignUpScreen/signUpScreen.dart';
import '../Screens/MyPointsScreen/bloc/myPointsRepository.dart';
import '../Screens/MyPointsScreen/bloc/myPointsScreenBloc.dart';
import '../Screens/OnBoarding/onBoardingScreen.dart';
import '../Screens/OrderListScreen/bloc/orderListRepository.dart';
import '../Screens/Splash/splashScreenView.dart';
import '../Screens/WishlistScreen/wishListScreen.dart';

Route<dynamic> generateRouteSettings(RouteSettings route) {
  final args = route.arguments;
  switch (route.name) {
    case splash:
      return MaterialPageRoute(builder: (_) => SplashScreenView());

    case onBoarding:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

    case login:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginScreenBloc>(
              create: (context) =>
                  LoginScreenBloc(repository: LoginScreenRepositoryImp()),
              child: LoginScreen(
                isFromStart: (args ?? true) as bool,
              )));

    case signup:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupScreenBloc>(
              create: (context) => SignupScreenBloc(
                    repository: SignUpScreenRepositoryImp(),
                  ),
              child: const SignUpScreen()));

    case productDetailPage:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductScreenBloc>(
              create: (context) =>
                  ProductScreenBloc(repository: ProductScreenRepositoryImp()),
              child:
                  ProductDetailsScreen(productId: route.arguments.toString())));

    case storeSelection:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<StoreSelectionScreenBloc>(
                create: (context) => StoreSelectionScreenBloc(
                    repositoryImp: StoreSelectionRepositoryImp()),
                child: StoreSelectionScreen((route.arguments ?? true) as bool),
              ));

    case catalogPage:
      return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<CatalogBloc>(
                      create: (context) =>
                          CatalogBloc(repository: CatalogDataImp()),
                    ),
                    BlocProvider<ItemCardBloc>(
                      create: (context) => ItemCardBloc(
                        repository: ItemCardRepositoryImp(),
                      ),
                    ),
                  ],
                  child:
                      CatalogScreen(route.arguments as Map<String, dynamic>)));

    case cmsPage:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<CMSScreenBloc>(
          create: (context) =>
              CMSScreenBloc(repository: CMSScreenRepositoryImp()),
          child: CmsScreen(route.arguments as Map<String, dynamic>),
        ),
      );

    case bottomNavigation:
      return MaterialPageRoute(builder: (_) => const BottomNavigationScreen());

    case home:
      return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
                BlocProvider<HomeScreenBloc>(
                  create: (_) =>
                      HomeScreenBloc(repository: HomeScreenRepositoryImp()),
                ),
                BlocProvider<ItemCardBloc>(
                  create: (context) => ItemCardBloc(
                    repository: ItemCardRepositoryImp(),
                  ),
                ),
              ], child: const HomeScreen()));
    case category:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<CategoryScreenBloc>(
                create: (context) =>
                    CategoryScreenBloc(repository: CategoriesProductDataImp()),
                child: CategoryScreen(),
              ));

    case orderList:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<OrderListBloc>(
                create: (_) =>
                    OrderListBloc(repository: OrderListRepositoryImp()),
                child: const OrderListScreen(),
              ));

    case myPoints:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<MyPointScreenBloc>(
                create: (_) =>
                    MyPointScreenBloc(repositoryImp: MyPointsRepositoryImp()),
                child: const MyPointsScreen(),
              ));

    case subCategory:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<SubCategoryBloc>(
                create: (_) =>
                    SubCategoryBloc(repository: SubCategoriesRepositoryImp()),
                child: SubCategoriesScreen(
                    route.arguments as Map<String, dynamic>),
              ));
    case cartPage:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<CartScreenBloc>(
                create: (_) =>
                    CartScreenBloc(repository: CartScreenRepositoryImp()),
                child: CartScreen(),
              ));

    case promotions:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<PromotionScreenBloc>(
                create: (_) => PromotionScreenBloc(
                    repositoryImp: PromotionScreenRepositoryImp()),
                child: const PromotionScreen(),
              ));

    case searchScreen:
      return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
                BlocProvider(
                  create: (_) =>
                      SearchScreenBloc(repository: SearchImpRepository()),
                  child: const SearchScreen(),
                ),
                BlocProvider<ItemCardBloc>(
                  create: (context) => ItemCardBloc(
                    repository: ItemCardRepositoryImp(),
                  ),
                ),
              ], child: const SearchScreen()));

    case wishlist:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (_) =>
                    WishlistScreenBloc(repository: WishlistImpRepository()),
                child: const WishListScreen(),
              ));

    case countryProduct:
      return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (_) => CountryProductBloc(
                          repository: CountryProductRepositoryImp()),
                    ),
                    BlocProvider<ItemCardBloc>(
                      create: (context) => ItemCardBloc(
                        repository: ItemCardRepositoryImp(),
                      ),
                    ),
                  ],
                  child: CountryProductsView(
                      route.arguments as Map<String, dynamic>)));

    case forgotPassword:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<ForgotPasswordBloc>(
                create: (_) => ForgotPasswordBloc(
                    forgotPasswordRepository: ForgotPasswordRepositoryImp()),
                child: const ForgotPasswordScreen(),
              ));

    case accountInformation:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountScreenBloc>(
                create: (_) =>
                    AccountScreenBloc(repository: AccountScreenRepositoryImp()),
                child: const AccountScreen(),
              ));

    case orderDetail:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<OrderDetailsBloc>(
                create: (_) =>
                    OrderDetailsBloc(repository: OrderDetailRepository()),
                child: OrderDetailScreen(orderId: route.arguments as String),
              ));

    case checkoutAddress:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<MultipleProfilesBloc>(
                create: (_) => MultipleProfilesBloc(
                    repository: MultipleProfilesRepositoryImp()),
                child: const AddressScreen(),
              ));

    case guestCheckoutAddress:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<GuestCheckoutBloc>(
                create: (_) =>
                    GuestCheckoutBloc(repository: GuestCheckoutRepositoryImp()),
                child: const GuestCheckoutScreen(),
              ));

    case orderSuccess:
      return MaterialPageRoute(
        builder: (_) => OrderSuccessScreen(orderId: route.arguments as String),
      );

    case shippingScreen:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<ShippingScreenBloc>(
                create: (_) => ShippingScreenBloc(
                    repository: ShippingScreenRepositoryImp()),
                child: ShippingScreen(
                  mapData: route.arguments as Map<String, dynamic>,
                ),
              ));

    case paymentScreen:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<PaymentScreenBloc>(
                create: (_) =>
                    PaymentScreenBloc(repository: PaymentScreenRepositoryImp()),
                child: PaymentScreen(
                  mapData: route.arguments as Map<String, dynamic>,
                ),
              ));

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${route.name}')),
              ));
  }
}
