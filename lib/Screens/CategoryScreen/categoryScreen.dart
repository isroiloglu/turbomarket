import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/categories.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CategoryScreen/bloc/categoryScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/search_bar.dart';
import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import '../../Constants/imagesConstant.dart';
import 'Widgets/categoryTile.dart';
import 'bloc/categoryScreenStates.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Categories>? categories;
  bool isSearching = false;
  TextEditingController? searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    categories = GlobalData.homeScreenModels?.categoryList;
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
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.size73),
          child: commonAppBar(
              context,
              true,
              GenericMethods.getStringValue(context, AppStringConstant.catalog),
              true),
        ),
        body: BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
          builder: (context, state) {
            return buildMainUI();
          },
        ),
      ),
    );
  }

  Widget buildMainUI() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.extraPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Text(
          //   GenericMethods.getStringValue(
          //       context, AppStringConstant.chooseCategory),
          //   style: Theme.of(context)
          //       .textTheme
          //       .labelMedium
          //       ?.copyWith(color: AppColors.lightGray),
          // ),
          CustomSearch(),
          const SizedBox(
            height: AppSizes.extraPadding*2,
          ),
          categoryListView(context, categories ?? [])
        ],
      ),
    );
  }
}
