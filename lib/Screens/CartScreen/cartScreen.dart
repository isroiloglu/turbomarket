import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/checkoutAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/commonAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/IgnotePointer/ignorePointer.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/LoginSignupModels/login_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/Widgets/cartDetailsScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/Widgets/emptyCartWidget.dart';
import '../../CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/routeConstant.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/globalData.dart';
import '../../Helper/loader.dart';
import '../../Helper/storageHelper.dart';
import '../../Models/CartModel/Request/cart_request.dart';
import '../../Models/CartModel/cart_model.dart';
import 'bloc/cartScreenBloc.dart';
import 'bloc/cartScreenEvents.dart';
import 'bloc/cartScreenStates.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = true;
  CartScreenBloc? cartScreenBloc;
  CartModel? cartModel;
  CartRequest? request;
  List<Map<String, String>> finalQtyList = [];
  String? mGiftCertificate;

  @override
  void initState() {
    cartScreenBloc = context.read<CartScreenBloc>();
    fetchCartData();
    storageController.setUsedPoint('0');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        GlobalData.selectedIndex = 0;
        Navigator.pushNamedAndRemoveUntil(
            context, bottomNavigation, (route) => false);
        return true;
      },
      child: Scaffold(
        // backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize + 18),
          child: checkoutAppbar(
            context,
            GenericMethods.getStringValue(context, AppStringConstant.cart),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<CartScreenBloc, CartScreenState>(
            builder: (context, currentState) {
              if (currentState is CartScreenInitial) {
                isLoading = true;
              } else if (currentState is CartScreenSuccess) {
                isLoading = false;
                finalQtyList?.clear();
                cartModel = currentState.data;
                for (int i = 0;
                    i < (cartModel?.cart?.products?.length ?? 0);
                    i++) {
                  finalQtyList.add({
                    'productId': (cartModel?.cart?.products![i].productId ?? '')
                        .toString(),
                    'qty': (cartModel?.cart?.products![i].qty ?? '').toString()
                  });
                }
                TabbarController.countController.sink
                    .add(cartModel?.productTotal ?? 0);
                storageController
                    .setBadgeCount(cartModel?.productTotal.toString());
                LoginResponse? userData = storageController.getUserData();
                userData?.points = cartModel?.cart?.userPoints;
                storageController.setUserData(userData ?? LoginResponse());
                isLoading = false;
              } else if (currentState is RemoveCartItemSuccess) {
                isLoading = false;
                cartModel = currentState.data;

                Set<String> emptySet = {};
                storageController.setGiftCode(emptySet);
                finalQtyList?.clear();
                for (int i = 0;
                    i < (cartModel?.cart?.products?.length ?? 0);
                    i++) {
                  finalQtyList.add({
                    'productId': (cartModel?.cart?.products![i].productId ?? '')
                        .toString(),
                    'qty': (cartModel?.cart?.products![i].qty ?? '').toString()
                  });
                }
                TabbarController.countController.sink
                    .add(cartModel?.productTotal ?? 0);
                storageController
                    .setBadgeCount(cartModel?.productTotal.toString());
              } else if (currentState is RemoveCartSuccess) {
                isLoading = false;
                cartModel = currentState.data;
                TabbarController.countController.sink
                    .add(cartModel?.productTotal ?? 0);
                storageController
                    .setBadgeCount(cartModel?.productTotal.toString());
              } else if (currentState is UpdateCartSuccess) {
                isLoading = false;
                cartModel = currentState.data;
                TabbarController.countController.sink
                    .add(cartModel?.productTotal ?? 0);
                storageController
                    .setBadgeCount(cartModel?.productTotal.toString());
                finalQtyList?.clear();
                for (int i = 0;
                    i < (cartModel?.cart?.products?.length ?? 0);
                    i++) {
                  finalQtyList.add({
                    'productId': (cartModel?.cart?.products![i].productId ?? '')
                        .toString(),
                    'qty': (cartModel?.cart?.products![i].qty ?? '').toString()
                  });
                }
                if (cartModel?.error == true) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AlertMessage.showError(
                        currentState.data.msg ?? '', context);
                  });
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AlertMessage.showSuccess(
                        currentState.data.msg ?? '', context);
                  });
                }
              } else if (currentState is ApplyVoucherSuccess) {
                isLoading = false;
                cartModel = currentState.data;
                storageController.setAfterCoupanCodeTotal(
                    cartModel?.cart?.formatTotal ?? "");
                if (currentState.data.success == true) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AlertMessage.showSuccess(
                        currentState.data.message ?? '', context);
                  });
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AlertMessage.showError(
                        currentState.data.message ?? '', context);
                  });
                }
              } else if (currentState is QuantityEvent) {
                for (int i = 0;
                    i < (cartModel?.cart?.products?.length ?? 0);
                    i++) {
                  if ((cartModel?.cart?.products?[i].productId ?? '')
                          .toString() ==
                      currentState.qty['productId']) {
                    finalQtyList[i]['qty'] = currentState.qty['qty'].toString();
                    cartModel?.cart?.products?[i].qty =
                        currentState.qty['qty'].toString();
                  }
                }
                isLoading = false;
              } else if (currentState is ApplyVoucherError) {
                isLoading = false;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AlertMessage.showError(currentState.message ?? '', context);
                });
                storageController
                    .getGiftCode()
                    .remove(cartModel?.couponCode?.toLowerCase());
              } else if (currentState is LoadingState) {
                isLoading = true;
              } else if (currentState is CartScreenError) {
                isLoading = false;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AlertMessage.showError(currentState.message ?? '', context);
                });
              } else if (currentState is CartUpdateState) {
                isLoading = false;
                cartModel = currentState.data;
                TabbarController.countController.sink
                    .add(cartModel?.productTotal ?? 0);
                storageController
                    .setBadgeCount(cartModel?.productTotal.toString());
              }
              return buildMainUI();
            },
          ),
        ),
      ),
    );
  }

  Widget buildMainUI() {
    return cartModel == null
        ? const Loader()
        : ignorePointer(
            child: Stack(
              children: [
                (cartModel?.cart != null &&
                        ((cartModel?.productTotal ?? 0) != 0))
                    ? CartDetailsScreen(
                        cartModel: cartModel,
                        cartScreenBloc: cartScreenBloc,
                        quantity: finalQtyList,
                        onValueChanged: (value) {
                          mGiftCertificate = value;
                        },
                        valueChangedCouponApply: (value) {},
                        isLoading: isLoading,
                      )
                    : EmptyCartWidget(),
                Visibility(visible: isLoading, child: const Loader()),
              ],
            ),
            ignoring: isLoading,
          );
  }

  Future<void> fetchCartData() async {
    request = CartRequest(
        width: AppSizes.width.toInt(),
        customerId: (storageController.getUserData()?.userId ?? '').toString(),
        currencyCode: storageController.getCurrentCurrency(),
        langCode: storageController.getCurrentLanguage(),
        totalCash: "0",
        formatedSubtotal: "0.0USD",
        giftCode:
            "${storageController.getGiftCode().toList().reversed.toList()}"
                .replaceAll(" ", ""),
        walletCartId: "",
        rechargeAmount: "0.0USD",
        subtotal: 0.0,
        walletSystem: 0);
    cartScreenBloc?.add(CartScreenDataFetchEvent(request!));
    cartScreenBloc?.emit(CartScreenInitial());
  }
}
