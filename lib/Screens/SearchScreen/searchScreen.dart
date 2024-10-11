import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/SearchItem/searchItem.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/itemCardBloc/itemCardBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/itemCardBloc/itemCardRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/search_bar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/widgets/searchScreenFilter.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/widgets/searchTile.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/database/databaseHelper.dart';

import '../../Config/theme.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/imagesConstant.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/globalData.dart';
import '../../Models/HomePageModels/home_screen_models.dart';
import '../../Models/HomePageModels/product_filters.dart';
import '../../Models/SearchModel/search_suggestion_model.dart';
import '../../database/database.dart';
import '../HomeScreen/Widgets/homeProductCart.dart';
import 'bloc/searchScreenEvents.dart';
import 'bloc/searchScreenStates.dart';
import 'bloc/searchSreenBloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isChanged = false;
  bool isLoading = false;
  bool isSearchEmpty = false;
  bool isFirst = true;
  SearchScreenBloc? searchScreenBloc;
  SearchSuggestionModel? searchModel;
  TextEditingController textEditingController = TextEditingController();
  HomeScreenModels? homeResponse;
  Timer? textTimer;
  List<SearchItems>? searchedItems;
  Map<String, Set> selectedFilters = {};
  RangeValues? currentRange;
  ValueChanged<dynamic>? onChanged;
  List<Filters> filters = [];
  String? filterId;

  @override
  void dispose() {
    if (textTimer != null) {
      textTimer!.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    searchScreenBloc = context.read<SearchScreenBloc>();
    fetchData(true);
    super.initState();
  }

  Future<void> fetchData(bool isInit, {bool isUpdate = true}) async {
    await (await AppDatabase.getDatabase())
        .searchDao
        .findAllSearchedItems()
        .then((value) {
      searchedItems = value;
      searchedItems = searchedItems?.reversed.toList();
      print("SEARCHED 11111----------> $searchedItems");
    }).then((value) {
      // setState(() {
      if (isInit) {
        isFirst = true;
      }
      if (isUpdate) {
        searchScreenBloc?.add(UpdateSearchHistoryEvent([]));
        print("SEARCHED 2222----------> $searchedItems");
      }
    });

    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchState>(
        builder: (context, currentState) {
      print(currentState);
      homeResponse = GlobalData.homeScreenModels;
      if (currentState is SearchInitialState) {
        // if (!isFirst) {
        isLoading = true;
        // }
        isFirst = false;
        searchScreenBloc?.emit(SearchActionState());
      } else if (currentState is SearchScreenSuccess) {
        isLoading = false;
        if (isSearchEmpty) {
          searchModel = null;
        } else if (!isSearchEmpty) {
          searchModel = currentState.searchSuggestionModel;
          filters = searchModel?.filterList ?? [];
        }
        isLoading = false;
        searchScreenBloc?.emit(SearchActionState());
      } else if (currentState is SearchScreenError) {
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message ?? '', context);
        });
      } else if (currentState is UpdateSearchHistoryState) {
        isLoading = false;
        // fetchData(false, isUpdate: false).then((value) {
        //   print('  ------------  history list ${jsonDecode(searchedItems.toString())}');
        // });
      }
      return Scaffold(
          backgroundColor: MobikulTheme.lightGreyTest,
          appBar: PreferredSize(
            preferredSize: Size(AppSizes.width, 80),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 58.0,
                  left: AppSizes.extraPadding,
                  right: AppSizes.extraPadding),
              child: CustomSearchBar(
                // onTap: () {
                //   Navigator.pushNamed(context, searchScreen);
                // },
                controller: textEditingController,
                onChanged: (searchKey) {
                  if (textTimer != null) {
                    textTimer!.cancel();
                  }
                  textTimer = Timer(const Duration(seconds: 1), () {
                    if (searchKey.trim().isNotEmpty && searchKey.length > 2) {
                      isSearchEmpty = false;
                      isLoading = true;
                      searchScreenBloc
                          ?.add(SearchSuggestionEvent(searchKey.trim()));
                      searchScreenBloc?.emit(SearchInitialState());
                      var rng = Random();
                      if (searchedItems?.isNotEmpty ?? false) {
                        searchedItems?.forEach((element) {
                          if (element.searchKey == searchKey.trim()) {
                            DataBaseHelper.deleteFromDataBase(SearchItems(
                                id: element.id, searchKey: element.searchKey));
                          }
                        });
                        DataBaseHelper.addProducts(SearchItems(
                            id: rng.nextInt(100), searchKey: searchKey.trim()));
                        fetchData(false);
                      } else {
                        DataBaseHelper.addProducts(SearchItems(
                            id: rng.nextInt(100), searchKey: searchKey));
                      }
                    }
                    if (searchKey.isEmpty) {
                      isSearchEmpty = true;
                      searchModel = null;
                      selectedFilters = {};
                      currentRange = null;
                      searchScreenBloc?.emit(SearchEmptyState());
                    }
                    if (searchKey.length > 1) {
                      return;
                    }
                  });
                },
                onTap: () {
                  if ((searchModel?.filterList ?? []).isNotEmpty) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.9,
                          child: SearchScreenFilter(
                            filters: filters,
                            filterId: filterId,
                            searchScreenBloc: searchScreenBloc,
                            clearList: () {
                              searchModel?.searchData?.clear();
                            },
                            onChanged: (list) {
                              setState(
                                () {
                                  if (list.isNotEmpty) {
                                    selectedFilters = list[0];
                                    currentRange = list[1];
                                  } else {
                                    selectedFilters = {};
                                    currentRange = null;
                                  }
                                },
                              );
                            },
                            selectedFilters: selectedFilters,
                            currentRange: currentRange,
                            searchedText: textEditingController.text,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              // child: AppBar(
              //   elevation: 0,
              //   leading: IconButton(
              //     onPressed: () {
              //       GenericMethods.hideSoftKeyBoard();
              //       Navigator.of(context).pop();
              //     },
              //     icon: const Icon(
              //       Icons.arrow_back_ios_outlined,
              //     ),
              //   ),
              //   title: SizedBox(
              //     height: 45,
              //     child: TextFormField(
              //       controller: textEditingController,
              //       onChanged: (searchKey) {
              //         if (textTimer != null) {
              //           textTimer!.cancel();
              //         }
              //         textTimer = Timer(const Duration(seconds: 1), () {
              //           if (searchKey.trim().isNotEmpty &&
              //               searchKey.length > 2) {
              //             isSearchEmpty = false;
              //             isLoading = true;
              //             searchScreenBloc
              //                 ?.add(SearchSuggestionEvent(searchKey.trim()));
              //             searchScreenBloc?.emit(SearchInitialState());
              //             var rng = Random();
              //             if (searchedItems?.isNotEmpty ?? false) {
              //               searchedItems?.forEach((element) {
              //                 if (element.searchKey == searchKey.trim()) {
              //                   DataBaseHelper.deleteFromDataBase(SearchItems(
              //                       id: element.id,
              //                       searchKey: element.searchKey));
              //                 }
              //               });
              //               DataBaseHelper.addProducts(SearchItems(
              //                   id: rng.nextInt(100),
              //                   searchKey: searchKey.trim()));
              //               fetchData(false);
              //             } else {
              //               DataBaseHelper.addProducts(SearchItems(
              //                   id: rng.nextInt(100), searchKey: searchKey));
              //             }
              //           }
              //           if (searchKey.isEmpty) {
              //             isSearchEmpty = true;
              //             searchModel = null;
              //             selectedFilters = {};
              //             currentRange = null;
              //             searchScreenBloc?.emit(SearchEmptyState());
              //           }
              //           if (searchKey.length > 1) {
              //             return;
              //           }
              //         });
              //       },
              //       style: Theme.of(context)
              //           .textTheme
              //           .bodySmall
              //           ?.copyWith(color: AppColors.lightGray),
              //       decoration: InputDecoration(
              //           contentPadding: const EdgeInsets.fromLTRB(
              //               AppSizes.extraPadding,
              //               AppSizes.linePadding,
              //               AppSizes.extraPadding,
              //               AppSizes.linePadding),
              //           border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(25.0),
              //               borderSide:
              //                   BorderSide(color: Colors.grey.shade300)),
              //           enabled: true,
              //           suffixIcon: (textEditingController.text.isNotEmpty)
              //               ? IconButton(
              //                   onPressed: () async {
              //                     isSearchEmpty = true;
              //                     searchModel = null;
              //                     selectedFilters = {};
              //                     currentRange = null;
              //                     textEditingController.text = '';
              //                     searchedItems =
              //                         await (await AppDatabase.getDatabase())
              //                             .searchDao
              //                             .findAllSearchedItems();
              //                     GenericMethods.hideSoftKeyBoard();
              //                     searchScreenBloc?.emit(SearchEmptyState());
              //                   },
              //                   icon: const Icon(
              //                     Icons.close,
              //                     size: AppSizes.iconSize,
              //                   ),
              //                 )
              //               : const SizedBox(
              //                   width: 0,
              //                   height: 0,
              //                 ),
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(25.0),
              //               borderSide:
              //                   BorderSide(color: Colors.grey.shade300)),
              //           focusedBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(25.0),
              //               borderSide:
              //                   BorderSide(color: Colors.grey.shade300)),
              //           hintText: GenericMethods.getStringValue(
              //               context, AppStringConstant.searchByProductName),
              //           hintStyle: AppTheme.lightTheme.textTheme.bodySmall
              //               ?.copyWith(color: Colors.grey.shade500)),
              //     ),
              //   ),
              // ),
            ),
          ),
          body: buildUI(searchModel, context));
    });
  }

  Widget buildUI(
      SearchSuggestionModel? searchSuggestionModel, BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppSizes.extraPadding,
                horizontal: AppSizes.mediumPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: AppSizes.mediumPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                          visible: (textEditingController.text.isNotEmpty) &&
                              (textEditingController.text.length > 2),
                          child: Flexible(
                            child: Text(
                              "${GenericMethods.getStringValue(context, AppStringConstant.searchResult)} : ${textEditingController.text}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )),
                      // Visibility(
                      //   visible: (searchSuggestionModel?.filterList ?? [])
                      //           .isNotEmpty &&
                      //       (textEditingController.text.isNotEmpty) &&
                      //       (textEditingController.text.length > 2),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //         left: AppSizes.linePadding,
                      //         bottom: AppSizes.mediumPadding),
                      //     child: IconButton(
                      //       onPressed: () {
                      //         if ((searchSuggestionModel?.filterList ?? [])
                      //             .isNotEmpty) {
                      //           showModalBottomSheet(
                      //             context: context,
                      //             isScrollControlled: true,
                      //             builder: (context) {
                      //               return FractionallySizedBox(
                      //                 heightFactor: 0.9,
                      //                 child: SearchScreenFilter(
                      //                   filters: filters,
                      //                   filterId: filterId,
                      //                   searchScreenBloc: searchScreenBloc,
                      //                   clearList: () {
                      //                     searchSuggestionModel?.searchData
                      //                         ?.clear();
                      //                   },
                      //                   onChanged: (list) {
                      //                     setState(
                      //                       () {
                      //                         if (list.isNotEmpty) {
                      //                           selectedFilters = list[0];
                      //                           currentRange = list[1];
                      //                         } else {
                      //                           selectedFilters = {};
                      //                           currentRange = null;
                      //                         }
                      //                       },
                      //                     );
                      //                   },
                      //                   selectedFilters: selectedFilters,
                      //                   currentRange: currentRange,
                      //                   searchedText: textEditingController.text,
                      //                 ),
                      //               );
                      //             },
                      //           );
                      //         }
                      //       },
                      //       icon: Image.asset(
                      //         AppImages.filterIcon,
                      //         width: 25,
                      //         height: 25,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Visibility(
                    visible: ((searchedItems?.length ?? 0) > 0) &&
                        (textEditingController.text.isEmpty),
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: AppSizes.linePadding),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Theme.of(context).dividerColor))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            GenericMethods.getStringValue(
                              context,
                              AppStringConstant.recentSearch,
                            ),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ((searchedItems?.length ?? 0) > 5)
                                ? 5
                                : (searchedItems?.length ?? 0),
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true,
                                horizontalTitleGap: 16,
                                contentPadding: EdgeInsets.zero,
                                onTap: () {
                                  isSearchEmpty = false;
                                  textEditingController.text =
                                      searchedItems?[index].searchKey ?? '';
                                  searchScreenBloc?.add(SearchSuggestionEvent(
                                      textEditingController.text));
                                  searchScreenBloc?.emit(SearchInitialState());
                                },
                                title: Text(
                                  searchedItems?[index].searchKey ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                leading: const Icon(Icons.update),
                                trailing: IconButton(
                                  onPressed: () {
                                    DataBaseHelper.deleteFromDataBase(
                                        SearchItems(
                                            id: searchedItems?[index].id ?? 0,
                                            searchKey: searchedItems?[index]
                                                    .searchKey ??
                                                ''));
                                    fetchData(false);
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ],
                      ),
                    )),
                Center(
                  child: Visibility(
                    visible:
                        ((searchSuggestionModel?.searchData ?? []).isEmpty) &&
                            (textEditingController.text.isNotEmpty) &&
                            !(isLoading),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(GenericMethods.getStringValue(
                          context, AppStringConstant.noItemFound)),
                    ),
                  ),
                ),
                Visibility(
                    visible: textEditingController.text.isEmpty,
                    child:
                        searchTile(context, homeResponse?.categoryList ?? [])),
                Visibility(
                  visible: (searchSuggestionModel?.searchData ?? []).isNotEmpty,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 4.0,
                        mainAxisExtent: (AppSizes.width / 2) -
                            (AppSizes.extraPadding + AppSizes.normalPadding) +
                            185,
                        //   childAspectRatio:(1 - (100 / (AppSizes.width )))
                      ),
                      itemCount: searchSuggestionModel?.searchData?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BlocProvider<ItemCardBloc>(
                          create: (context) => ItemCardBloc(
                            repository: ItemCardRepositoryImp(),
                          ),
                          child: HomeProductCart(
                            searchSuggestionModel?.searchData?[index],
                          ),
                        );

                        // return BlocProvider(
                        //   create: (context) => ItemCardBloc(),
                        //
                        //   child: HomeProductCart(
                        //     searchSuggestionModel?.searchData?[index],
                        //   ),
                        // );
                      }),
                )
              ],
            ),
          ),
        ),
        Visibility(visible: isLoading, child: const Loader())
      ],
    );
  }
}
