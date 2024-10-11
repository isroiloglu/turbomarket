import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/commonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/login_textfield.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Request/shippingAvailabilityRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/request/shippingEstimateRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/request/submitShippingDetails.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/shippingCitiesModel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/shippingStatesModel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/shippingCostEstimationBloc/shippingCostEstimationBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/shippingCostEstimationBloc/shippingCostEstimationEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/shippingCostEstimationBloc/shippingCostEstimationStates.dart';
import '../../../CustomWidgets/commonTextField.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/loader.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shippingStoreModel.dart';
import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';
import '../../../Models/shippingEstimateModel/response/shippingEstimateResponse.dart';
import '../../../Models/shippingEstimateModel/shippingCountriesModel.dart';

class CalculateShippingCostWidget extends StatefulWidget {
  const CalculateShippingCostWidget({Key? key}) : super(key: key);

  @override
  _CalculateShippingCostWidgetState createState() =>
      _CalculateShippingCostWidgetState();
}

class _CalculateShippingCostWidgetState
    extends State<CalculateShippingCostWidget> {
  late TextEditingController stateTextEditingController;
  late TextEditingController cityTextEditingController;
  late TextEditingController zipCodeTextEditingController;
  final _formKey = GlobalKey<FormState>();
  ShippingCostEstimationScreenBloc? _costEstimationScreenBloc;
  bool isLoading = false;
  ShippingEstimateRequest? shippingEstimateRequest;
  ShippingEstimateResponse? shippingEstimateResponse;
  ShippingCountriesModel? selectedCountry;
  ShippingStatesModel? selectedState;
  ShippingCitiesModel? selectedCity;
  List<ShippingStatesModel>? states = [];
  List<ShippingCitiesModel>? cities = [];
  ShippingMethodModel? shippingMethodData;
  ShippingStoreModel? selectedStore;
  shippingMethods? selectedMethod;

  @override
  void initState() {
    stateTextEditingController = TextEditingController();
    cityTextEditingController = TextEditingController();
    zipCodeTextEditingController = TextEditingController();
    _costEstimationScreenBloc =
        context.read<ShippingCostEstimationScreenBloc>();
    fetchShippingEstimationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShippingCostEstimationScreenBloc,
        ShippingCostEstimationState>(builder: (context, currentState) {
      if (currentState is ShippingCostEstimationLoadingState) {
        isLoading = true;
      } else if (currentState is ShippingCostEstimationSuccessState) {
        isLoading = false;
        shippingEstimateResponse = currentState.data;

        if (shippingEstimateResponse?.countries?.isNotEmpty ?? false) {
          selectedCountry = shippingEstimateResponse?.countries![0];
          states = selectedCountry?.states;
          if (selectedCountry?.states?.isNotEmpty ?? false) {
            selectedState = selectedCountry?.states![0];
            cities = selectedState?.cities;
          }
          if (selectedState?.cities?.isNotEmpty ?? false) {
            selectedCity = selectedState?.cities![0];
          }
        }
      } else if (currentState is ShippingCostEstimationErrorState) {
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      } else if (currentState
          is ShippingCostEstimationCountryBasedSuccessState) {
        isLoading = false;
        shippingMethodData = currentState.data;

        if (shippingMethodData?.shipping?.shippingMethodList.isNotEmpty ??
            false) {
          selectedMethod = shippingMethodData?.shipping?.shippingMethodList[0];
          if (selectedMethod?.stores?.isNotEmpty ?? false) {
            selectedStore = selectedMethod?.stores?[0];
          }
        }
      } else if (currentState is ShippingMethodSelectionState) {
        isLoading = false;
        selectedMethod = currentState.selectedMethod;
        if (selectedMethod?.stores?.isNotEmpty ?? false) {
          selectedStore = selectedMethod?.stores?[0];
        }
      } else if (currentState is ShippingMethodDetailsSuccessState) {
        isLoading = false;
        if (currentState.data.success ?? false) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AlertMessage.showSuccess(currentState.data.msg ?? '', context);
          });
          Navigator.pop(context, true);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AlertMessage.showSuccess(currentState.data.msg ?? '', context);
          });
        }
      }
      return shippingEstimateResponse == null ? const Loader() : buildDialog();
    });
  }

  buildDialog() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.calculateShippingCost),
                        style: AppTheme.lightTheme.textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: AppSizes.maximumPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppSizes.mediumPadding),
                        child: DropdownButtonFormField<ShippingCountriesModel>(
                          isExpanded: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF-Pro-Display',
                              fontSize: 15),
                          decoration: InputDecoration(
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Text(
                                GenericMethods.getStringValue(
                                    context, AppStringConstant.country),
                              ),
                            ),
                            labelStyle: const TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            filled: true,
                            fillColor: MobikulTheme.lightGreyTest,
                            border: const OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: BorderSide(color: AppColors.darkGray),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            enabled: true,
                          ),
                          hint: const Text('--Select Country--'),
                          value: shippingEstimateResponse?.countries![0],
                          items: shippingEstimateResponse?.countries
                              ?.map(
                                (e) => DropdownMenuItem<ShippingCountriesModel>(
                                  value: e,
                                  child: Text(
                                    e.country ?? "",
                                    style: const TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedCountry = val!;
                            });
                            if ((selectedCountry?.states ?? []).isNotEmpty) {
                              states = selectedCountry?.states;
                              if (states?.isNotEmpty ?? false) {
                                selectedState = selectedCountry?.states?[0];
                                cities = selectedState?.cities;
                                if (cities?.isNotEmpty ?? false) {
                                  selectedCity = cities?[0];
                                } else {
                                  selectedCity = null;
                                }
                              } else {
                                selectedState = null;
                                selectedCity = null;
                              }
                            }
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              bottom: AppSizes.mediumPadding),
                          child: states != null && (states ?? []).isNotEmpty
                              ? DropdownButtonFormField<ShippingStatesModel>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF-Pro-Display',
                                      fontSize: 15),
                                  decoration: InputDecoration(
                                    label: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Text(
                                        GenericMethods.getStringValue(
                                            context, AppStringConstant.region),
                                      ),
                                    ),
                                    labelStyle: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    filled: true,
                                    fillColor: AppColors.white,
                                    border: const OutlineInputBorder(
                                      gapPadding: 0,
                                      borderSide:
                                          BorderSide(color: AppColors.darkGray),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    enabled: true,
                                  ),
                                  value: selectedState,
                                  hint: const Text('--Select State--'),
                                  items: states
                                      ?.map(
                                        (e) => DropdownMenuItem<
                                            ShippingStatesModel>(
                                          value: e,
                                          child: SizedBox(
                                            width: AppSizes.width / 2.5,
                                            child: Text(
                                              e.state ?? "",
                                              style: const TextStyle(
                                                color: AppColors.black,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      selectedState = val!;
                                    });
                                    if ((selectedState?.cities ?? [])
                                        .isNotEmpty) {
                                      cities = selectedState?.cities;
                                      if (cities?.isNotEmpty ?? false) {
                                        selectedCity = cities?[0];
                                      } else {
                                        selectedCity = null;
                                      }
                                      if (cities?.last !=
                                          ShippingCitiesModel(
                                              city: '--Another City--')) {
                                        cities?.add(ShippingCitiesModel(
                                            city: '--Another City--'));
                                      }
                                    }
                                    print(
                                        "====> ${jsonEncode(selectedState?.cities).toString()}");
                                  })
                              : SizedBox(
                                  child: TextFormField(
                                    controller: stateTextEditingController,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'SF-Pro-Display',
                                        fontSize: 15),
                                    decoration: InputDecoration(
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0),
                                        child: Text(
                                          GenericMethods.getStringValue(context,
                                              AppStringConstant.region),
                                        ),
                                      ),
                                      labelStyle: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                      filled: true,
                                      fillColor: AppColors.white,
                                      border: const OutlineInputBorder(
                                        gapPadding: 0,
                                        borderSide: BorderSide(
                                            color: AppColors.darkGray),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      enabled: true,
                                    ),
                                    validator: (value) {},
                                  ),
                                )),
                      cities != null && (cities!.isNotEmpty)
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  bottom: AppSizes.mediumPadding),
                              child: DropdownButtonFormField<
                                      ShippingCitiesModel>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF-Pro-Display',
                                      fontSize: 15),
                                  decoration: InputDecoration(
                                    label: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Text(
                                        GenericMethods.getStringValue(
                                            context, AppStringConstant.city),
                                      ),
                                    ),
                                    labelStyle: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    filled: true,
                                    fillColor: AppColors.white,
                                    border: const OutlineInputBorder(
                                      gapPadding: 0,
                                      borderSide:
                                          BorderSide(color: AppColors.darkGray),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    enabled: true,
                                  ),
                                  hint: const Text('--Select City--'),
                                  value: cities?[0],
                                  items: cities
                                      ?.map((e) =>
                                          DropdownMenuItem<ShippingCitiesModel>(
                                              value: e,
                                              child: Text(
                                                (e.city ?? "").trim(),
                                                style: const TextStyle(
                                                    color: AppColors.black,
                                                    fontSize: 12),
                                              )))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      selectedCity = val!;
                                    });
                                    print(selectedCity?.city);
                                  }))
                          : const SizedBox(),
                      selectedCity?.city == "--Another City--"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  bottom: AppSizes.mediumPadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppSizes.width / 4,
                                    child: Text(GenericMethods.getStringValue(
                                        context,
                                        AppStringConstant.anotherCity)),
                                  ),
                                  SizedBox(
                                      width: AppSizes.width / 2.5,
                                      child: TextFormField(
                                        controller: cityTextEditingController,
                                        onSaved: (val) {
                                          selectedCity?.city = val;
                                        },
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'SF-Pro-Display',
                                            fontSize: 15),
                                        decoration: InputDecoration(
                                          label: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0),
                                            child: Text(
                                              GenericMethods.getStringValue(
                                                  context,
                                                  AppStringConstant.city),
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                            color: AppColors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                          filled: true,
                                          fillColor: AppColors.white,
                                          border: const OutlineInputBorder(
                                            gapPadding: 0,
                                            borderSide: BorderSide(
                                                color: AppColors.darkGray),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                          enabled: true,
                                        ),
                                        validator: (value) {},
                                      )),
                                ],
                              ))
                          : const SizedBox(),
                      Padding(
                          padding: const EdgeInsets.only(
                              bottom: AppSizes.mediumPadding),
                          child: TextFormField(
                            controller: zipCodeTextEditingController,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SF-Pro-Display',
                                fontSize: 15),
                            decoration: InputDecoration(
                              label: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Text(
                                  GenericMethods.getStringValue(
                                      context, AppStringConstant.region),
                                ),
                              ),
                              labelStyle: const TextStyle(
                                color: AppColors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              filled: true,
                              fillColor: AppColors.white,
                              border: const OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    BorderSide(color: AppColors.darkGray),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              enabled: true,
                            ),
                            validator: (value) {},
                          )),
                      (shippingMethodData != null)
                          ? showShippingMethods()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonButton(
                                  context,
                                  () {
                                    ShippingMethodAvailabilityRequest request =
                                        ShippingMethodAvailabilityRequest(
                                            storageController
                                                .getCurrentLanguage(),
                                            selectedCountry?.code,
                                            selectedState?.code,
                                            selectedCity?.city,
                                            storageController
                                                .getCurrentCurrency(),
                                            storageController
                                                .getStoreData()
                                                ?.storefrontId);
                                    _costEstimationScreenBloc?.add(
                                        ShippingCostEstimationCountryBasedEvent(
                                            request));
                                  },
                                  GenericMethods.getStringValue(
                                      context, AppStringConstant.recalculate),
                                  height: 50.0,
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black),
                                  width: AppSizes.width * 0.45,
                                  backgroundColor: MobikulTheme.lightGreyTest,
                                  borderRadius: 12,
                                  borderSideColor: MobikulTheme.lightGreyTestA,
                                  textColor: Colors.white,
                                ),
                                commonButton(
                                  context,
                                  () {
                                    ShippingMethodAvailabilityRequest request =
                                        ShippingMethodAvailabilityRequest(
                                            storageController
                                                .getCurrentLanguage(),
                                            selectedCountry?.code,
                                            selectedState?.code,
                                            selectedCity?.city,
                                            storageController
                                                .getCurrentCurrency(),
                                            storageController
                                                .getStoreData()
                                                ?.storefrontId);
                                    _costEstimationScreenBloc?.add(
                                        ShippingCostEstimationCountryBasedEvent(
                                            request));
                                  },
                                  GenericMethods.getStringValue(
                                      context, AppStringConstant.getRates),
                                  height: 50.0,
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                                  width: AppSizes.width * 0.45,
                                  backgroundColor:
                                      MobikulTheme.clientPrimaryColorA,
                                  borderRadius: 12,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Visibility(visible: isLoading, child: const Loader())
            ],
          ),
        );
      },
    );
  }

  showShippingMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          GenericMethods.getStringValue(
              context, AppStringConstant.chooseShippingMethods),
          style: AppTheme.lightTheme.textTheme.bodyLarge,
        ),
        Column(
          children: shippingMethodData?.shipping!.shippingMethodList
                  .map(
                    (e) => shippingMethodsWidget(
                        shippingMethodData?.shipping!.shippingMethodList
                                .indexOf(e) ??
                            0,
                        shippingMethodData?.shipping?.shippingMethodList[
                            shippingMethodData?.shipping!.shippingMethodList
                                    .indexOf(e) ??
                                0]),
                  )
                  .toList() ??
              [],
          // shippingMethodData?.shipping?.shippingMethodList.length ?? 0,
          // itemBuilder: (context, index) {
          //   return Column(
          //     children: [
          // shippingMethodsWidget(
          //     index, shippingMethodData?.shipping?.shippingMethodList[index]),
          //     ],
          //   );
          // },
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonButton(
              context,
              () {
                ShippingMethodAvailabilityRequest request =
                    ShippingMethodAvailabilityRequest(
                        storageController.getCurrentLanguage(),
                        selectedCountry?.code,
                        selectedState?.code,
                        selectedCity?.city,
                        storageController.getCurrentCurrency(),
                        storageController.getStoreData()?.storefrontId);
                _costEstimationScreenBloc
                    ?.add(ShippingCostEstimationCountryBasedEvent(request));
              },
              GenericMethods.getStringValue(
                  context, AppStringConstant.recalculate),
              height: 50.0,
              textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
              width: AppSizes.width * 0.45,
              backgroundColor: MobikulTheme.lightGreyTest,
              borderRadius: 12,
              borderSideColor: MobikulTheme.lightGreyTestA,
              textColor: Colors.white,
            ),
            const SizedBox(
              width: AppSizes.mediumPadding,
            ),
            commonButton(
              context,
              () {
                SubmitShippingDetails request = SubmitShippingDetails(
                    storageController.getCurrentLanguage(),
                    selectedCountry?.code,
                    selectedState?.code,
                    selectedCity?.city,
                    storageController.getCurrentCurrency(),
                    storageController.getStoreData()?.storefrontId,
                    selectedMethod?.shippingId,
                    selectedStore?.storeLocationId);
                _costEstimationScreenBloc
                    ?.add(SubmitShippingDetailsEvent(request));
              },
              GenericMethods.getStringValue(context, AppStringConstant.select),
              height: 50.0,
              textStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
              width: AppSizes.width * 0.45,
              backgroundColor: MobikulTheme.clientPrimaryColor,
              borderRadius: 12,
              borderSideColor: MobikulTheme.lightGreyTestA,
              textColor: Colors.white,
            ),
          ],
        )
      ],
    );
  }

  Widget shippingMethodsWidget(int index, shippingMethods? methods) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
                value: methods ?? shippingMethods.empty(),
                groupValue: selectedMethod,
                onChanged: (shippingMethods? val) {
                  selectedMethod = val;
                  if (selectedMethod?.stores?.isNotEmpty ?? false) {
                    selectedStore = selectedMethod?.stores?[0];
                  }
                  _costEstimationScreenBloc
                      ?.add(ShippingMethodSelectionEvent(selectedMethod!));
                },
                fillColor: MaterialStateProperty.all<Color>(
                    MobikulTheme.clientPrimaryColor)),
            Text(methods?.shipping ?? ''),
          ],
        ),
        Visibility(
          visible: (methods?.stores?.isNotEmpty ?? false) &&
              (selectedMethod?.shippingId == methods?.shippingId),
          child: Container(
            width: AppSizes.width * 0.7,
            child: DropdownButtonFormField<ShippingStoreModel>(
                style: AppTheme.lightTheme.textTheme.bodySmall,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                isExpanded: true,
                hint: const Text('--Select Store--'),
                value: selectedStore,
                items: methods?.stores
                    ?.map((e) => DropdownMenuItem<ShippingStoreModel>(
                        value: e, child: Text(e.name ?? "")))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedStore = val!;
                  });
                }),
          ),
        )
      ],
    );
  }

  Future<void> fetchShippingEstimationData() async {
    shippingEstimateRequest = ShippingEstimateRequest(
      isCountry: true,
      languageCode: storageController.getCurrentLanguage(),
    );
    _costEstimationScreenBloc
        ?.add(ShippingCostEstimationFinalEvent(shippingEstimateRequest!));
    _costEstimationScreenBloc?.emit(ShippingCostEstimationInitialState());
  }

  setDefaultState() {
    shippingEstimateResponse?.countries?.forEach((element) {
      if (element.country == selectedCountry?.country) {
        states = element.states;
      }
    });
    return states;
  }
}
