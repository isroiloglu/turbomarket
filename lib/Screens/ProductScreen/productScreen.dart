import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/user_data.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/image.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_detail_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/addToCartBottomBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenEvent.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/Widgets/productDetailPageScreen.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import '../../Helper/alertMessage.dart';
import '../../Models/LoginSignupModels/login_response.dart';
import '../../Models/ProductDetailModels/request/add_to_cart_request.dart';
import '../../Models/ProductDetailModels/request/product_data.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductScreenBloc? _productScreenBloc;
  bool isLoading = true;
  ProductDetailModel? productResponse;
  ProductData productData = ProductData();
  Map<String, String>? extra = {};
  int? qty;
  List<ProductImage> slides = [];
  Map<String, String> selectedOptions = {};

  @override
  void initState() {
    _productScreenBloc = context.read<ProductScreenBloc>();
    _productScreenBloc?.add(ProductScreenDataFetchEvent(widget.productId));
    super.initState();
  }

  @override
  void dispose() {
    _productScreenBloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarSize),
        child: commonAppBar(
            context,
            false,
            GenericMethods.getStringValue(context, AppStringConstant.products),
            false,
            showSearch: false,
            isFromProduct: true),
      ),
      body: SafeArea(
        child: BlocBuilder<ProductScreenBloc, ProductScreenState>(
          builder: (context, currentState) {
            if (currentState is ProductScreenInitial) {
              isLoading = true;
            } else if (currentState is ProductScreenSuccess) {
              slides.clear();
              isLoading = false;
              productResponse = currentState.productPageData;
              qty = int.parse(productResponse?.minQty ?? "1");
              slides.add(productResponse?.mainPair ?? ProductImage());
              slides.addAll(productResponse?.additionalImages ?? []);
              prepareCartRequest(<String, String>{});
            } else if (currentState is QuantityEvent) {
              qty = currentState.qty;
              productData.amount = qty.toString();
              isLoading = false;
            } else if (currentState is AddToCartSuccess) {
              isLoading = false;
              storageController
                  .setBadgeCount(currentState.data.productTotal.toString());
              TabbarController.countController.sink
                  .add(int.parse(currentState.data.productTotal.toString()));
              Future.delayed(Duration.zero, () async {
                AlertMessage.showSuccess(currentState.data.msg ?? "", context);
                if ((storageController.getUserData()?.userId ?? '')
                            .toString() ==
                        null ||
                    (storageController.getUserData()?.userId ?? '')
                            .toString() ==
                        "") {
                  LoginResponse userData = LoginResponse();
                  userData.userId = currentState.data.gId;
                  storageController.setUserData(userData);
                }
              });
              _productScreenBloc?.emit(AddToCartComplete());
            } else if (currentState is AddToWishListSuccess) {
              isLoading = false;
              if ((storageController.getUserData()?.userId ?? '').toString() ==
                      null ||
                  (storageController.getUserData()?.userId ?? '').toString() ==
                      "") {
                LoginResponse userData = LoginResponse();
                userData.userId = currentState.data.gId;
                storageController.setUserData(userData);
              }
              Future.delayed(Duration.zero, () async {
                AlertMessage.showSuccess(currentState.data.msg ?? "", context);
                productResponse?.productInWishList = true;
              });
              _productScreenBloc?.add(
                  ProductScreenDataFetchEvent(widget.productId.toString()));
            } else if (currentState is RemoveItemSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showSuccess(
                    currentState.baseModel?.message ?? '', context);
              });
              _productScreenBloc?.add(
                  ProductScreenDataFetchEvent(widget.productId.toString()));
            } else if (currentState is ProductScreenError) {
              isLoading = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showError(currentState.message ?? '', context);
              });
            }
            return productResponse == null
                ? const Loader()
                : Stack(
                    children: [
                      ProductDetailPageScreen(
                        addToCartRequest: AddToCartRequest(
                            currencyCode:
                                storageController.getCurrentCurrency(),
                            languageCode:
                                storageController.getCurrentLanguage(),
                            productData: productData.toJson()),
                        productIsInWishlist: productResponse?.productInWishList,
                        selectedOptions: selectedOptions,
                        slides: slides,
                        detailModel: productResponse,
                        productScreenBloc: _productScreenBloc,
                        quantity: qty ?? 1,
                        optionsRequired: true,
                        extra: extra ?? {},
                      ),
                      Visibility(visible: isLoading, child: const Loader()),
                    ],
                  );
          },
        ),
      ),
    );
  }

  ProductData prepareCartRequest(options) {
    productData = ProductData(
        amount: qty.toString(),
        productId: widget.productId.toString(),
        productOptions: selectedOptions,
        extra: extra);
    return productData;
  }
}
