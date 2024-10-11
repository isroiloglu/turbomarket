import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/FilterScreen/widgets/filterCheckBox.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/FilterScreen/widgets/filterItem.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/FilterScreen/widgets/rangeWidget.dart';

import '../../Constants/appConstants.dart';
import '../../CustomWidgets/CommonButton.dart';
import '../../Helper/globalData.dart';
import '../../Helper/storageHelper.dart';
import '../../Models/HomePageModels/product_filters.dart';
import '../CatalogScreen/bloc/catalogScreenEvents.dart';
import '../CatalogScreen/bloc/ccatalogScreenBloc.dart';

class FilterScreen extends StatefulWidget {
  String? categoryId;
  String? variantId;
  List<Filters>? filters = [];
  String? filterId;
  CatalogBloc? catalogBloc;
  int? page;
  VoidCallback? clearList;
  ValueChanged<dynamic> onChanged;
  RangeValues? currentRange;
  String? sortOrder = "";
  String? sortBy = "";
  Map<String, Set> selectedFilters = {};
  bool fromHomePage = false;

  FilterScreen(
      {Key? key,
      this.categoryId,
      this.variantId,
      this.filters,
      this.filterId,
      this.catalogBloc,
      this.page,
      this.clearList,
      required this.onChanged,
      this.currentRange,
      required this.selectedFilters,
      this.sortBy,
      this.sortOrder,
      this.fromHomePage = false})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Range? rangePrice;
  Range? initialPriceRange;
  bool isLoading = false;
  bool isFirst = true;
  String? filterDescription;
  Map<int?, String?> variantIdFilterId = {};
  String featuresHash = "";

  void onFilterItemSelected(
      bool isSelected, String variantId, String filterId) {
    if (isSelected == true) {
      setState(() {
        if (widget.selectedFilters.containsKey(filterId)) {
          var data = widget.selectedFilters[filterId];
          data?.add(variantId);
          widget.selectedFilters[filterId] = data!;
        } else {
          widget.selectedFilters[filterId] = {variantId};
        }
      });
    } else {
      setState(() {
        var data = widget.selectedFilters[filterId];
        data?.remove(variantId);
        if ((data ?? {}).isEmpty) {
          widget.selectedFilters.remove(filterId);
        } else {
          widget.selectedFilters[filterId] = data ?? {};
        }
      });
    }
    print("widget.selectedFilters ---> ${widget.selectedFilters}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            AppSizes.extraPadding,
            AppSizes.extraPadding,
            AppSizes.extraPadding,
            AppSizes.extraPadding),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                  GenericMethods.getStringValue(
                      context, AppStringConstant.filter),
                  style: Theme.of(context).textTheme.titleMedium),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context, [true, initialPriceRange]);
                  },
                  child: const Icon(Icons.close))
            ]),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.filters?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          widget.filterId = widget.filters?[index].filterId;
                          rangePrice = widget.filters?[index].range;
                          if (isFirst &&
                              (widget.filters?[index].range != null &&
                                  (widget.filters?[index].range?.fieldType ??
                                          "")
                                      .isNotEmpty) &&
                              (widget.filters?[index].range?.fieldType ?? "") ==
                                  "P") {
                            initialPriceRange = widget.filters?[index].range;
                            storageController.setPriceFilter(
                                [rangePrice?.min, rangePrice?.max]);
                            isFirst = false;
                          }
                          filterDescription =
                              widget.filters?[index].description;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0,
                                    AppSizes.extraPadding,
                                    AppSizes.normalPadding,
                                    AppSizes.normalPadding),
                                child: Text(
                                    widget.filters?[index].description ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600)),
                              ),
                              (
                                  (widget.filters?[index].range != null &&
                                      (widget.filters?[index].range?.fieldType ??
                                          "")
                                          .isNotEmpty) &&
                                  (widget.filters?[index].range?.fieldType ?? "") ==
                                      "P")
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          // horizontal: AppSizes.size10,
                                          vertical: 0),
                                      child: PriceRange(
                                          initialRange: rangePrice,
                                          currentRange: RangeValues(
                                              double.parse(widget
                                                      .currentRange?.start
                                                      .toString() ??
                                                  "${rangePrice?.min}"),
                                              double.parse(widget
                                                      .currentRange?.end
                                                      .toString() ??
                                                  "${rangePrice?.max}")),
                                          onChanged: (rangeValue) {
                                            setState(() {
                                              widget.selectedFilters[widget
                                                      .filters?[index]
                                                      .filterId ??
                                                  "0"] = {
                                                rangeValue.start,
                                                rangeValue.end,
                                                storageController.getCurrentCurrency()
                                              };
                                              widget.currentRange = rangeValue;
                                            });
                                          }),
                                    )
                                  :
                              ((widget.filters?[index].fieldType ?? '') == "A")
                                  ? FilterCheckBox(widget.selectedFilters[widget.filters?[index]?.filterId]?.contains(
                                  widget.filters?[index]?.variants?[index].variantId.toString()) ??
                                  false, (value){
                                setState(() {
                                  if((widget.filters?[index]?.variants?[index].isSelected ?? false)==false){
                                    widget.filters?[index]?.variants?[index].isSelected=true;
                                  }else{
                                    widget.filters?[index]?.variants?[index].isSelected=false;
                                  }
                                });
                                onFilterItemSelected(
                                    (widget.filters?[index]?.variants?[index].isSelected ?? false),
                                    (widget.filters?[index]?.variants?[index].variantId).toString(),
                                    widget.filters?[index]?.filterId ?? "");
                              })


                                  : getVariants(widget.filters?[index]),

                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: commonButton(context, () {
                    var data = storageController.getPriceFilter();
                    print(data.toString());
                    setState(() {
                      widget.selectedFilters.clear();
                      rangePrice = initialPriceRange;
                      storageController.setPriceFilter([initialPriceRange?.min, initialPriceRange?.max]);
                      widget.currentRange = RangeValues(
                          double.parse(initialPriceRange?.min ?? "0.0"),
                          double.parse(initialPriceRange?.max ?? "0.0"));
                      print("gjsdhf$initialPriceRange");
                      GlobalData.filterHash = "";
                      widget.clearList?.call();
                      widget.onChanged([]);
                      if (widget.fromHomePage) {
                        widget.catalogBloc?.add(FetchHomePageCatalogEvent(
                            widget.categoryId,
                            widget.page,
                            widget.sortBy,
                            widget.sortOrder,
                            featuresHash));
                      } else {
                        widget.catalogBloc?.add(FetchCatalogEvent(
                            widget.categoryId,
                            '',
                            widget.page,
                            widget.sortBy,
                            widget.sortOrder,
                            ""));
                      }
                      Navigator.pop(context, [true, initialPriceRange]);
                    });
                  },
                      GenericMethods.getStringValue(
                          context, AppStringConstant.clearFilter),
                      textColor: AppColors.white,
                      height: AppSizes.width / 8),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppSizes.size10),
                    child: commonButton(context, () {

                      storageController.setPriceFilter(
                          [widget.currentRange?.start, widget.currentRange?.end]);
                      var val = "";
                      widget.selectedFilters.forEach((key, value) {
                        if (value.isNotEmpty) {
                          val += "$key-${value.join("-")}";
                          val += "_";
                        } else {}
                      });
                      if (val.isNotEmpty) {
                        val = val.substring(0, val.length - 1);
                      }

                      featuresHash = val;
                      widget.clearList?.call();
                      widget.onChanged([widget.selectedFilters, widget.currentRange]);
                      GlobalData.filterHash = featuresHash;
                      if (widget.fromHomePage) {
                        widget.catalogBloc?.add(FetchHomePageCatalogEvent(
                            widget.categoryId,
                            widget.page,
                            widget.sortBy,
                            widget.sortOrder,
                            featuresHash));
                      } else {
                        widget.catalogBloc?.add(FetchCatalogEvent(
                            widget.categoryId,
                            widget.variantId,
                            widget.page,
                            widget.sortBy,
                            widget.sortOrder,
                            featuresHash));
                      }
                      Navigator.pop(context);

                    },
                        GenericMethods.getStringValue(
                            context, AppStringConstant.applyFilter),
                        textColor: AppColors.white,
                        height: AppSizes.width / 8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getVariants(Filters? filter) {
    Set? selectedVariant = widget.selectedFilters[filter?.filterId];
    return SizedBox(
      height: AppSizes.width/6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filter?.variants?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return filterItemChips(context,
                    () {
              setState(() {
                if((filter?.variants?[index].isSelected ?? false)==false){
                  filter?.variants?[index].isSelected=true;
                }else{
                  filter?.variants?[index].isSelected=false;
                }
              });
              onFilterItemSelected(
                  (filter?.variants?[index].isSelected ?? false),
                  (filter?.variants?[index].variantId).toString(),
                  filter?.filterId ?? "");
            },
                filter?.variants?[index].variant ?? "",
                selectedVariant?.contains(
                        filter?.variants?[index].variantId.toString()) ??
                    false);
          }),
    );
  }
}
