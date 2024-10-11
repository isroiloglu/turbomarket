import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/commonAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/imagesConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CatalogScreen/bloc/ccatalogScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CatalogScreen/widgets/catalogGridView.dart';

import '../../Constants/arguments_map.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/globalData.dart';
import '../../Helper/loader.dart';
import '../../Models/CategoryProductData/category_product_data_model.dart';
import '../../Models/HomePageModels/product_filters.dart';
import '../../Models/HomePageModels/product_item.dart';
import '../FilterScreen/filterScreen.dart';
import 'bloc/catalogScreenEvents.dart';
import 'bloc/catalogScreenStates.dart';

class CatalogScreen extends StatefulWidget {
  Map<String, dynamic> mapData;

  CatalogScreen(this.mapData, {Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  var visibilityGrid = true;
  CategoryProductsDataModel? _categoriesModel;
  List<ProductItem>? products = [];
  CatalogBloc? _catalogBloc;
  bool isLoading = false;
  bool isFilter = true;
  var scrollController = ScrollController();
  int page = 1;
  int total = 0;
  String? sortValue = "product-asc";

  ProductFiltersModel? _productFiltersModel;
  List<Filters> filters = [];
  String? filterId;
  Map<String, Set> selectedFilters = {};
  RangeValues? currentRange;
  ValueChanged<dynamic>? onChanged;
  String sortBy = "";
  String sortingValue = "";

  @override
  void initState() {
    GlobalData.filterHash = "";
    _catalogBloc = context.read<CatalogBloc>();
    fetchData();
    super.initState();
  }

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
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      if (widget.mapData[fromHomePageKey]) {
        _catalogBloc?.add(FetchHomePageCatalogEvent(
            widget.mapData[categoryIdKey].toString(),
            page,
            sortBy,
            sortingValue,
            GlobalData.filterHash));
      } else if (widget.mapData[variantIdKey] != "" ||
          widget.mapData[categoryIdKey] != "") {
        _catalogBloc?.add(FetchCatalogEvent(
            widget.mapData[categoryIdKey],
            widget.mapData[variantIdKey],
            page,
            sortBy,
            sortingValue,
            GlobalData.filterHash));
      }
      scrollController.addListener(pagination);
    } else {
      // show network dialog here
    }
  }

  Future<void> fetchPaginationData(List<String> values) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      log('MAP DATA${widget.mapData}');
      if (widget.mapData[fromHomePageKey]) {
        _catalogBloc?.add(FetchHomePageCatalogEvent(
            widget.mapData[categoryIdKey],
            page,
            values.isNotEmpty ? values[0] : null,
            values.length > 1 ? values[1] : null,
            GlobalData.filterHash));
      } else {
        _catalogBloc?.add(FetchCatalogEvent(
            widget.mapData[categoryIdKey],
            widget.mapData[variantIdKey],
            page,
            values.isNotEmpty ? values[0] : null,
            values.length > 1 ? values[1] : null,
            GlobalData.filterHash));
      }
    } else {
      // show network dialog here
    }
  }

  @override
  void dispose() {
    super.dispose();
    GlobalData.filterHash = "";
    _catalogBloc = null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _catalogBloc?.emit(
          CatalogInitialState(),
        );
        return true;
      },
      child: Scaffold(
          backgroundColor: MobikulTheme.lightGreyTest,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppSizes.appBarSize),
            child: commonAppBar(context, false, "", true),
          ),
          body: BlocBuilder<CatalogBloc, CatalogScreenState>(
            builder: (context, currentState) {
              print("current state $currentState");
              if (currentState is CatalogInitialState) {
                isLoading = true;
              } else if (currentState is CatalogFetchState) {
                _categoriesModel = currentState.categoriesModel;
                products?.addAll(_categoriesModel?.productList ?? []);
                total = int.parse(
                    (_categoriesModel?.productParams?.totalItems ?? "0")
                        .toString());
                isLoading = false;
                if (isFilter) {
                  _catalogBloc?.add(
                      FetchFilterEvent(widget.mapData[categoryIdKey] ?? ""));
                  isFilter = false;
                }
              } else if (currentState is CatalogFetchHomeProductState) {
                isLoading = true;
                _categoriesModel = currentState.categoriesModel;
                products?.addAll(
                    _categoriesModel?.homePageProductData?.productList ?? []);

                filters = _categoriesModel?.filters ?? [];
                filterId = filters[0].filterId;
                total = _categoriesModel
                        ?.homePageProductData?.productList?.length ??
                    0;
                isLoading = false;
              } else if (currentState is CatalogScreenErrorState) {
                isLoading = false;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AlertMessage.showError(currentState.message ?? '', context);
                });
              } else if (currentState is FilterInitialState) {
                isLoading = true;
              } else if (currentState is FilterFetchState) {
                _productFiltersModel = currentState.productFilters;
                filters = _productFiltersModel?.filters ?? [];
                filterId = filters[0].filterId;
                isLoading = false;
                _catalogBloc?.emit(IdleState());
              } else if (currentState is FilterScreenErrorState) {
                isLoading = false;
              }
              return buildMainView(context, products!);
            },
          )),
    );
  }

  Widget buildMainView(BuildContext context, List<ProductItem> products) {
    return Stack(
      children: [
        productList(context, products),
        Visibility(visible: isLoading, child: const Loader())
      ],
    );
  }

  Widget productList(BuildContext context, List<ProductItem>? products) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.extraPadding,horizontal: AppSizes.mediumPadding),
      child: Column(
        children: [
          Visibility(
            visible: (GlobalData.filterHash.isNotEmpty) ||
                (products ?? []).isNotEmpty,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(widget.mapData[categoryNameKey],
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  IconButton(
                    onPressed: () {
                      if (filters.isNotEmpty) {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return FractionallySizedBox(
                                heightFactor: 0.9,
                                child: FilterScreen(
                                  categoryId: widget.mapData[categoryIdKey],
                                  variantId: widget.mapData[variantIdKey],
                                  filters: filters,
                                  filterId: filterId,
                                  page: page,
                                  catalogBloc: _catalogBloc,
                                  clearList: () {
                                    products?.clear();
                                  },
                                  onChanged: (list) {
                                    setState(() {
                                      if (list.isNotEmpty) {
                                        selectedFilters = list[0];
                                        currentRange = list[1];
                                      } else {
                                        selectedFilters = {};
                                        currentRange = null;
                                      }
                                    });
                                  },
                                  selectedFilters: selectedFilters,
                                  currentRange: currentRange,
                                  sortBy: sortBy,
                                  sortOrder: sortingValue,
                                  fromHomePage: widget.mapData[fromHomePageKey],
                                ),
                              );
                            });
                      }
                    },
                    icon: Image.asset(
                      AppImages.filterIcon,
                      width: 25,
                      height: 25,
                    ),
                  )
                ]),
          ),

          Expanded(
            child: ((products ?? []).isNotEmpty)
                ? catalogGridView(context, products, true, scrollController,
                    from: "catalog")
                : (isLoading)
                    ? Container()
                    : Center(
                        // alignment: Alignment.center,
                        child: Text(GenericMethods.getStringValue(
                            context, AppStringConstant.noItemFound)),
                      ),
          ),
          // Visibility(
          //     visible: (products ?? []).isEmpty,
          //     child: Center(
          //   child: Text(GenericMethods.getStringValue(context, AppStringConstant.noItemFound) ),
          // ))
        ],
      ),
    );
  }
}
