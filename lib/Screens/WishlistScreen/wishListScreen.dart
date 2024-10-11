import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListBloc.dart';
import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../CommonWidgets/productAvailabilityWidget.dart';
import '../../CommonWidgets/productdiscountWidget.dart';
import '../../Config/theme.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/arguments_map.dart';
import '../../Constants/imagesConstant.dart';
import '../../Constants/routeConstant.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/dialogHelper.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/globalData.dart';
import '../../Helper/imageView.dart';
import '../../Helper/loader.dart';
import '../../Models/WishlistModel/wishlist_data.dart';
import '../../Models/WishlistModel/wishlist_model.dart';
import 'Widgets/emptyWishlistView.dart';
import 'bloc/wishListEvents.dart';
import 'bloc/wishListStates.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  bool isLoading = false;
  WishlistModel? wishlistData;
  bool isAction = false;
  WishlistScreenBloc? wishlistScreenBloc;

  @override
  void initState() {
    wishlistScreenBloc = context.read<WishlistScreenBloc>();
    wishlistScreenBloc?.add(WishlistDataFetchEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        GlobalData.selectedIndex = 0;
        Navigator.pushNamedAndRemoveUntil(context, bottomNavigation, (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize),
          child: commonAppBar(context, false,
              '',true),
        ),



        body: BlocBuilder<WishlistScreenBloc, WishlistState>(
            builder: (context, currentState) {
              if (currentState is WishlistInitialState) {
                isLoading = true;
              } else if (currentState is WishlistScreenSuccessState) {
                isLoading = false;
                isAction = false;
                wishlistData = currentState.wishlistModel;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {

                  });
                });
              } else if (currentState is WishlistActionState) {
                isAction = true;
              } else if (currentState is RemoveItemSuccessState) {
                isLoading = false;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AlertMessage.showSuccess(
                      currentState.baseModel?.message ?? '', context);
                });
                wishlistScreenBloc?.add(WishlistDataFetchEvent());
              } else if (currentState is RemoveCompleteWishlistSuccess) {
                isLoading = false;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AlertMessage.showSuccess(
                      currentState.baseModel?.message ?? '', context);
                });
                wishlistScreenBloc?.add(WishlistDataFetchEvent());
              } else if (currentState is WishlistScreenError) {
                isLoading = false;
                if(currentState.message=="type 'String' is not a subtype of type 'List<dynamic>?' in type cast" || currentState.message=="type '_OneByteString' is not a subtype of type 'List<dynamic>?' in type cast"){
                  wishlistData =WishlistModel.empty();
                }else{
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AlertMessage.showError(currentState.message ?? '', context);
                  });
                }

              }
              return buildUI(wishlistData?.wishlistData, context);
            }),
      ),
    );
  }

  Widget buildUI(List<WishlistData>? items, BuildContext context) {
    return isLoading
        ? const Loader()
        : Visibility(
        visible: wishlistData != null,
        child: (wishlistData?.wishlistData ?? []).isEmpty ||
            wishlistData?.wishListSize == 0
            ? emptyWishlistView(context)
            : Padding(
            padding: const EdgeInsets.all(AppSizes.normalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(GenericMethods.getStringValue(context, AppStringConstant.myFavorite,), style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.lightGray, fontWeight: FontWeight.w100),),
                const SizedBox(
                  height: AppSizes.extraPadding,
                ),
                Expanded(child: buildWishlistView(items, context)),
              ],
            )));
  }
  Widget buildWishlistView(List<WishlistData>? items, BuildContext context) {
    return Stack(children: [

      GridView.builder(
        padding: EdgeInsets.zero,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            mainAxisExtent: (AppSizes.width / 2) - ( AppSizes.normalPadding ) + 80,
            //   childAspectRatio:(1 - (100 / (AppSizes.width )))
          ),
          itemCount: items?.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Stack(children: [
              GestureDetector(
                onTap:(){
                  Navigator.pushNamed(context, productDetailPage,arguments:items?[index].productId.toString() ?? '');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Theme.of(context).dividerColor),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(AppSizes.linePadding))),
                  // margin: const EdgeInsets.only(right: AppSizes.normalPadding/2, left: AppSizes.normalPadding/2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppSizes.linePadding), topRight: Radius.circular(AppSizes.linePadding)),
                            child: ImageView(
                              url: items?[index].imagePath,
                              width: (AppSizes.width / 2) - ( AppSizes.normalPadding ),
                              height: (AppSizes.width / 2) - ( AppSizes.normalPadding),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              bottom: 5,
                              left: 5,
                              child: ProductAvailabilityWidget(isInStock: items?[index].inStock ?? false, isOnRequest: items?[index].backOrder?? false, isOutStock: items?[index].outOfStock ??false,)),

                          Visibility(
                            visible: (items?[index].listPrice ?? 0) > 0,
                            child: Positioned(
                                top: 5,
                                right: 5,
                                child: productDiscountView(context, items?[index].discount.toString() ??'')),
                          )
                        ],
                      ),
                      Container(
                        // width: (AppSizes.width / 2) - (AppSizes.normalPadding + 2*AppSizes.extraPadding),
                        padding: const EdgeInsets.all(AppSizes.normalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(items?[index].formatPrice ?? '',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.lightGray, fontWeight: FontWeight.w100),
                            ),
                            // const SizedBox(
                            //   height: AppSizes.normalPadding,
                            // ),
                            Visibility(
                              visible: (items?[index].listPrice ?? 0) != 0,
                              child: Text((items?[index].formatListPrice ??'').toString(),
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).colorScheme.primary,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ),
                            const Visibility(
                              // visible: (items?[index].listPrice ?? 0) != 0,
                              child: SizedBox(
                                height: AppSizes.normalPadding,
                              ),
                            ),
                            Text(items?[index].product ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        DialogHelper.confirmationDialog(
                            GenericMethods.getStringValue(context, AppStringConstant.removeItemFromWishlist),
                            context,
                            onConfirm: () {
                          wishlistScreenBloc?.emit(WishlistActionState());
                          wishlistScreenBloc?.add(RemoveItemEvent(
                              items?[index].itemId ?? ""));
                        });
                      },
                      child: const Icon(Icons.favorite,
                          size: 26, color: MobikulTheme.clientPrimaryColor),
                    ),
                  )),
                // ProductAvailabilityWidget(
                //   isInStock: widget.detailModel?.inStock ?? true,
                // ),

            ]);
          }),
      Center(
          child: Visibility(
            visible: isAction,
            child: const Loader(),
          )),
    ]);
  }

}
