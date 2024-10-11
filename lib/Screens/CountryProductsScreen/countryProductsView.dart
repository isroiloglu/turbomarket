import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/product_item.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CountryProductsScreen/Bloc/countryProductBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CountryProductsScreen/Bloc/countryProductEvents.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../Constants/arguments_map.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/globalData.dart';
import '../../Models/CategoryProductData/category_product_data_model.dart';
import '../CatalogScreen/widgets/catalogGridView.dart';
import 'Bloc/CountryProductStates.dart';

class CountryProductsView extends StatefulWidget {
  Map<String, dynamic> mapData;

  CountryProductsView(this.mapData, {Key? key}) : super(key: key);

  @override
  State<CountryProductsView> createState() => _CountryProductsViewState();
}

class _CountryProductsViewState extends State<CountryProductsView> {
  var scrollController = ScrollController();
  bool isLoading = false;
  CategoryProductsDataModel? _categoriesModel;
  List<ProductItem>? products = [];
  CountryProductBloc? _countryProductBloc;
  int page = 1;
  int total = 0;
  String? sortValue = "product-asc";
  String sortBy = "";

  void pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        ((_categoriesModel?.productList?.length ?? 0) < total)) {
      log('POSITION IS $scrollController');
      setState(() {
        isLoading = true;
        page += 1;
        var values = sortValue?.split("#");
        fetchPaginationData(values!);
      });
    }
  }

  Future<void> fetchData() async {
    log('==========WORKED FETCH');

    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      log('MAP DATA IS ${widget.mapData}');
      (widget.mapData[fromBannerKey] ?? false)
          ? _countryProductBloc?.add(FetchPromotionProducts(
              widget.mapData[categoryIdKey],
              page,
              sortBy,
              sortValue,
              GlobalData.filterHash))
          : _countryProductBloc?.add(FetchCountryProductEvent(
              widget.mapData[categoryIdKey],
              page,
              sortBy,
              sortValue,
              GlobalData.filterHash));
      scrollController.addListener(pagination);
    } else {
      // show network dialog here
    }
  }

  Future<void> fetchPaginationData(List<String> values) async {
    log('==========WORKED FETCH PAGINATION');
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      (widget.mapData[fromBannerKey] ?? false)
          ? _countryProductBloc?.add(FetchPromotionProducts(
              widget.mapData[categoryIdKey],
              page,
              sortBy,
              sortValue,
              GlobalData.filterHash))
          : _countryProductBloc?.add(FetchCountryProductEvent(
              widget.mapData[categoryIdKey],
              page,
              sortBy,
              sortValue,
              GlobalData.filterHash));
    } else {
      // show network dialog here
    }
  }

  @override
  void initState() {
    _countryProductBloc = context.read<CountryProductBloc>();
    fetchData();
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
      body: BlocBuilder<CountryProductBloc, CountryProductScreenState>(
        builder: (context, state) {
          if (state is CountryProductInitialState) {
            isLoading = true;
          } else if (state is CountryProductFetchState) {
            isLoading = false;
            _categoriesModel = state.categoriesModel;
            if (widget.mapData[fromBannerKey] ?? false) {
              log('WORKED -1');
              products?.addAll(state.categoriesModel?.promotionProducts ?? []);
            } else {
              log('WORKED -2 LENGTH IS ${state.categoriesModel?.productList?.length}');
              products?.addAll(state.categoriesModel?.productList ?? []);
            }
            total = int.parse(
                (state.categoriesModel?.productParams?.totalItems ?? "0")
                    .toString());
          } else if (state is CountryProductErrorState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(state.message ?? '', context);
            });
          }
          return buildMainUi(context);
        },
      ),
    );
  }

  Widget buildMainUi(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.normalPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.mapData[categoryNameKey],
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(
              height: AppSizes.extraPadding,
            ),
            Visibility(
              visible: (widget.mapData[fromBannerKey] ?? false)
                  ? (_categoriesModel?.promotionProducts?.isNotEmpty ?? false)
                  : (_categoriesModel?.productList?.isNotEmpty ?? false),
              child: Expanded(
                child: catalogGridView(
                  context,
                  // (widget.mapData[fromBannerKey] ?? false)
                  //     ? _categoriesModel?.promotionProducts
                  //     : _categoriesModel?.productList,
                  products,
                  true,
                  scrollController,
                  from: "catalog",
                ),
              ),
            ),
          ]),
        ),
        Visibility(
          visible: ((widget.mapData[fromBannerKey] ?? false)
                  ? (_categoriesModel?.promotionProducts?.isEmpty ?? false)
                  : (_categoriesModel?.productList?.isEmpty ?? false)) &&
              !isLoading,
          child: Center(
            child: Text(
              GenericMethods.getStringValue(
                  context, AppStringConstant.noItemFound),
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: const Loader(),
        )
      ],
    );
  }
}
