import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../Constants/arguments_map.dart';
import '../../Constants/imagesConstant.dart';
import '../../Constants/routeConstant.dart';
import '../../CustomWidgets/CommonButton.dart';
import '../../CustomWidgets/commonViewAllButton.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/loader.dart';
import '../../Models/CategoryProductData/category_product_data_model.dart';
import '../../Models/SubcategoryModel/subcategory_model.dart';
import '../CategoryScreen/Widgets/categoryTile.dart';
import 'bloc/subCategoryBloc.dart';
import 'bloc/subCategoryEvents.dart';
import 'bloc/subCategoryStates.dart';

class SubCategoriesScreen extends StatefulWidget {
  Map<String, dynamic> arguments;

  SubCategoriesScreen(this.arguments, {Key? key}) : super(key: key);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  SubCategoryModel? _subCategoryModel;
  SubCategoryBloc? _subCategoriesBloc;
  CategoryProductsDataModel? _subCategoryProductData;

  bool isLoading = false;

  @override
  void initState() {
    _subCategoriesBloc = context.read<SubCategoryBloc>();
    _subCategoriesBloc
        ?.add(FetchSubCategoriesEvent(widget.arguments[idKey] ?? ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarSize),
        child: commonAppBar(context, true, '', true),
      ),
      body: BlocBuilder<SubCategoryBloc, SubCategoriesScreenState>(
        builder: (context, state) {
          if (state is SubCategoriesInitialState) {
            isLoading = true;
            _subCategoryModel = null;
          } else if (state is SubCategoriesScreenErrorState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(state.message ?? '', context);
            });
          } else if (state is SubCategoriesFetchState) {
            isLoading = false;
            _subCategoryModel = state.subCategoryModel;
            // _subCategoryProductData = state.subCategoryProductModel;
          }
          return buildMainUI();
        },
      ),
    );
  }

  Widget buildMainUI() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.extraPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.arguments[subcategoryNameKey],
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: AppSizes.extraPadding,
              ),
              Text(
                GenericMethods.getStringValue(
                    context, AppStringConstant.selectSubcategory),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: AppSizes.extraPadding,
              ),
              categoryTile(
                  context,
                  GenericMethods.getStringValue(
                      context, AppStringConstant.viewAllProducts),
                  '', () {
                Navigator.pushNamed(context, catalogPage,
                    arguments: getCatalogMap(widget.arguments[idKey] ?? '', "",
                        widget.arguments[subcategoryNameKey] ?? '', false));
              }, false),
              Divider(),
              categoryListView(context, _subCategoryModel?.categories ?? [],
                  isShowImage: false)
            ],
          ),
        ),
        Visibility(visible: isLoading, child: const Loader())
      ],
    );
  }
}
