import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/appLocalization.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AnorBank/anor_generate_otp_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OrderStatus/order_status_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PaymentMethodModels/payment_method_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Request/submit_order_request.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/SubmitOrderModel/submit_order_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/OrderSuccessScreen/orderSuccessScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/Widgets/AnorInstallmentOptionWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/Widgets/AnorSavedCardOptionWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/Widgets/paymentOptionsWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/bloc/paymentScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/bloc/paymentScreenStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/checkoutRequestHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/paymentWebview.dart';

import '../../../CommonWidgets/AppBar/checkoutAppBar.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../CustomWidgets/CommonButton.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/loader.dart';
import '../../../Models/PaymentMethodModels/payment_methods.dart';
import '../Widgets/horizontalCustomStepper.dart';
import 'bloc/paymentScreenEvents.dart';

class PaymentScreen extends StatefulWidget {
  Map<String, dynamic>? mapData;

  PaymentScreen({Key? key, required this.mapData}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isLoading = false;
  bool isCheckout = false;
  bool isAnorRefresh = false;
  final _formKey = GlobalKey<FormState>();
  PaymentScreenBloc? paymentScreenBloc;
  PaymentMethodResponse? paymentMethodResponse;
  AnorGenerateOtpResponse? anorGenerateOtpResponse;
  String paymentId = "";
  SubmitOrderRequestData submitOrderRequestData =
      SubmitOrderRequestData.empty();
  List<String>? shippingId = [];
  PaymentMethod? selectedPaymentMethod;
  CreditCardModel? creditCardModel;
  TextEditingController otpController = TextEditingController();
  TextEditingController paymentOtpController = TextEditingController();
  SavedCard? anorSavedCard;
  String? selectedVendorRecipientId;

  final List<String> titles = [
    AppStringConstant.customer,
    AppStringConstant.delivery,
    AppStringConstant.payment
  ];
  final List<String> activeIcons = [
    'assets/Images/profile.png',
    'assets/Images/truck-fast.png',
    'assets/Images/empty-wallet.png'
  ];
  final List<String> inactiveIcons = [
    'assets/Images/customer-inactive.png',
    'assets/Images/delivery-inactive.png',
    'assets/Images/payment-inactive.png'
  ];

  final int _curStep = 2;

  @override
  void initState() {
    shippingId = widget?.mapData?["shippingIds"];
    paymentScreenBloc = context.read<PaymentScreenBloc>();

    if (storageController.getLoginStatus() == true) {
      paymentScreenBloc?.add(PaymentScreenFetchEvent(
          shippingId, (GlobalData.updateProfileRequest.shipToAnother ?? 0)));
    } else {
      paymentScreenBloc?.add(PaymentScreenFetchEvent(
          shippingId, GlobalData.guestUserData?.shipToAnother ?? 0));
    }

    super.initState();
  }

  void onChanged(PaymentMethod value) {
    setState(() {
      selectedPaymentMethod = value;
    });
  }

  void onCardChanged(SavedCard card) {
    setState(() {
      anorSavedCard = card;
    });
  }

  void onInstallmentChanged(String value) {
    setState(() {
      selectedVendorRecipientId = value;
    });
  }

  void validateSubmitRequest() {
    if (selectedPaymentMethod != null &&
        selectedPaymentMethod?.paymentProcessor != null &&
        selectedPaymentMethod?.paymentProcessor?.toLowerCase() ==
            "Anor Bank Payment".toLowerCase()) {
      showAddCardDialog();
    } else {
      paymentScreenBloc?.add(PaymentScreenCheckoutEvents(
          CheckoutRequestHelper.getRequestData(
              paymentMethodResponse,
              selectedPaymentMethod,
              shippingId ?? [],
              anorSavedCard,
              selectedVendorRecipientId)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarSize+20),
        child: checkoutAppbar(
          context,
          GenericMethods.getStringValue(context, AppStringConstant.ordering),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<PaymentScreenBloc, PaymentScreenState>(
            builder: (context, currentState) {
          if (currentState is PaymentScreenInitialState) {
            if (paymentMethodResponse != null) {
              isLoading = false;
            } else {
              isLoading = true;
            }
            isAnorRefresh = false;
          } else if (currentState is PaymentScreenFetchPaymentMethodState) {
            paymentMethodResponse = currentState.paymentMethodResponse;
            if (paymentMethodResponse?.paymentMethod != null &&
                (paymentMethodResponse?.paymentMethod ?? []).isNotEmpty &&
                !isAnorRefresh) {
              selectedPaymentMethod = paymentMethodResponse?.paymentMethod[0];
            }
            if (isAnorRefresh) {
              showSavedCardDialog();
            }

            isLoading = false;
            isAnorRefresh = false;
          } else if (currentState is PaymentScreenErrorState) {
            isLoading = false;
            isCheckout = false;
            isAnorRefresh = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message ?? '', context);
            });
          } else if (currentState is PaymentScreenCheckoutState) {
            isLoading = false;
            isCheckout = false;
            isAnorRefresh = false;
            if (!currentState.submitOrderResponse.error) {
              if (currentState.submitOrderResponse.url != null &&
                  currentState.submitOrderResponse.url!.payment != null &&
                  currentState.submitOrderResponse.url!.payment!.isNotEmpty) {
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentWebview(
                        url: currentState.submitOrderResponse.url,
                        callBack: (resultUrl) {
                          DialogHelper.loaderDialog(
                              AppStringConstant.loadingMessage,
                              AppStringConstant.fetchingPaymentStatus,
                              context,
                              AppLocalizations.of(context));

                          processWebviewResult(
                              currentState.submitOrderResponse);
                        },
                      ),
                    ),
                  );
                });
              } else if ((currentState.submitOrderResponse.anorVerify ??
                  false)) {
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.pop(context);
                  showPaymentOtpDialog(currentState.submitOrderResponse);
                });
              } else {
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderSuccessScreen(
                        orderId:
                            currentState.submitOrderResponse.orderId.toString(),
                      ),
                    ),
                  );
                });
              }
            } else {
              GenericMethods.showErrorAlertMessages(
                  context, currentState.submitOrderResponse.msg ?? "");
            }
          } else if (currentState is AnorBankGenerateOtpSuccess) {
            isLoading = false;
            isCheckout = false;
            isAnorRefresh = false;
            anorGenerateOtpResponse = currentState.model;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pop(context);
              showVerifyCardOTPDialog();
            });
          } else if (currentState is AnorBankVerifyOtpSuccess) {
            isLoading = false;
            isCheckout = false;
            isAnorRefresh = true;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pop(context);
              paymentScreenBloc?.add(PaymentScreenFetchEvent(shippingId,
                  (GlobalData.updateProfileRequest.shipToAnother ?? 0)));
            });
          } else if (currentState is AnorBankVerifyPaymentOtpSuccess) {
            isLoading = false;
            isCheckout = false;
            isAnorRefresh = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderSuccessScreen(
                    orderId:
                        currentState.submitOrderResponse!.orderId.toString(),
                  ),
                ),
              );
            });
          } else if (currentState is DismissDialogState) {
            isLoading = false;
            isCheckout = false;
            isAnorRefresh = false;
          }
          paymentScreenBloc?.emit(PaymentCompleteState());
          return buildMainUI();
        }),
      ),
    );
  }

  Widget buildMainUI() {
    return Stack(
      children: [
        Column(
          children: [
            HorizontalCustomStepper(
              curStep: _curStep,
              titles: titles,
              color: Colors.black,
              activeImages: activeIcons,
              inactiveImages: inactiveIcons,
            ),
            isLoading
                ? Container()
                : (paymentMethodResponse?.paymentMethod ?? []).isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(GenericMethods.getStringValue(
                              context, AppStringConstant.noPaymentMethodFound)),
                        ),
                      )
                    : Expanded(
                        child: PaymentOptionWidget(
                        allPaymentMethod: paymentMethodResponse?.paymentMethod,
                        onChanged: onChanged,
                      ))
          ],
        ),
        Visibility(
          child: Positioned(
            bottom: AppSizes.sidePadding,
            right: AppSizes.sidePadding,
            left: AppSizes.sidePadding,
            child: commonButton(context, () {
              validateSubmitRequest();
              isCheckout = true;
            }, GenericMethods.getStringValue(context, AppStringConstant.save),
                textColor: AppColors.white,
                textStyle: const TextStyle(
                    fontFamily: 'SF-Pro-Display',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
                borderRadius: 12,
                fontWeight: FontWeight.w600,
                height: AppSizes.width / 7),
          ),
        ),
        Visibility(visible: isLoading || isCheckout, child: const Loader())
      ],
    );
  }

  void processWebviewResult(SubmitOrderResponse submitOrderResponse) async {
    OrderStatusResponse model =
        await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
            .getOrderStatus(
      submitOrderResponse.orderId.toString(),
      storageController.getCurrentLanguage(),
    );
    if (model.isSuccess) {
      debugPrint("Success hua");
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OrderSuccessScreen(
                orderId: submitOrderResponse.orderId.toString(),
              )));
    } else {
      debugPrint("Fail hua");
      Navigator.of(context).pop();
      DialogHelper.showExceptionDialog(
        AppLocalizations.of(context)!
            .translate(AppStringConstant.paymentFailed),
        context,
        buttonText:
            AppLocalizations.of(context)!.translate(AppStringConstant.ok),
        onConfirm: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    }
  }

  void showAddCardDialog() async {
    bool? result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => Dialog(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(AppSizes.sidePadding),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!
                      .translate(AppStringConstant.addNewCard)),
                  CreditCardForm(
                    cardNumber: "",
                    expiryDate: "",
                    cardHolderName: "",
                    cvvCode: "",
                    onCreditCardModelChange: (cardModel) {
                      creditCardModel = cardModel;
                    },
                    themeColor: Colors.red,
                    formKey: _formKey,
                    enableCvv: false,
                  ),
                  const SizedBox(
                    height: AppSizes.sidePadding,
                  ),
                  commonButton(
                    context,
                    () {
                      if (_formKey.currentState!.validate() &&
                          creditCardModel != null &&
                          creditCardModel!.cardHolderName.isNotEmpty) {
                        paymentScreenBloc
                            ?.add(AnorBankGenerateOtpEvent(creditCardModel));
                      } else {
                        GenericMethods.showErrorAlertMessages(
                            context,
                            AppLocalizations.of(context)!.translate(
                                AppStringConstant.pleaseEnterValidCardDetails));
                      }
                    },
                    GenericMethods.getStringValue(
                        context, AppStringConstant.generateOTP),
                    textColor: AppColors.white,
                    width: AppSizes.width / 2,
                    textStyle: const TextStyle(
                        fontFamily: 'SF-Pro-Display',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                    borderRadius: 12,
                    fontWeight: FontWeight.w600,
                    height: AppSizes.width / 10,
                  ),
                  Visibility(
                    visible: (selectedPaymentMethod?.savedCard != null &&
                        selectedPaymentMethod!.savedCard!.length > 0),
                    child: Container(
                      padding: const EdgeInsets.all(AppSizes.sidePadding),
                      child: Column(children: [
                        Text(GenericMethods.getStringValue(
                            context, AppStringConstant.or)),
                        const SizedBox(
                          height: AppSizes.sidePadding,
                        ),
                        commonButton(
                          context,
                          () {
                            Navigator.pop(context);
                            showSavedCardDialog();
                          },
                          GenericMethods.getStringValue(
                              context, AppStringConstant.useSavedCard),
                          textColor: AppColors.white,
                          width: AppSizes.width / 2,
                          textStyle: const TextStyle(
                              fontFamily: 'SF-Pro-Display',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                          borderRadius: 12,
                          fontWeight: FontWeight.w600,
                          height: AppSizes.width / 10,
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (result == null) {
      paymentScreenBloc?.add(DismissDialogEvent());
    }
  }

  void showVerifyCardOTPDialog() async {
    bool? result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => Dialog(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSizes.sidePadding),
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!
                    .translate(AppStringConstant.verifyOTP)),
                const SizedBox(
                  height: AppSizes.sidePadding,
                ),
                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  obscureText: false,
                  maxLength: 6,
                  validator: (value) {
                    if (value!.isEmpty || value.length != 6) {
                      return AppLocalizations.of(context)!
                          .translate(AppStringConstant.pleaseEnterValidOTP);
                    }
                    return null;
                  },
                  onChanged: (value) {
                    debugPrint("OTP: $value");
                  },
                ),
                const SizedBox(
                  height: AppSizes.sidePadding,
                ),
                commonButton(
                  context,
                  () {
                    if (otpController.text.isNotEmpty &&
                        otpController.text.length == 6) {
                      paymentScreenBloc?.add(AnorBankVerifyOtpEvent(
                          otpController.text, anorGenerateOtpResponse));
                    } else {
                      GenericMethods.showErrorAlertMessages(
                          context,
                          AppLocalizations.of(context)!.translate(
                              AppStringConstant.pleaseEnterValidOTP));
                    }
                  },
                  GenericMethods.getStringValue(
                      context, AppStringConstant.verify),
                  textColor: AppColors.white,
                  textStyle: const TextStyle(
                      fontFamily: 'SF-Pro-Display',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                  width: AppSizes.width / 2,
                  borderRadius: 12,
                  fontWeight: FontWeight.w600,
                  height: AppSizes.width / 10,
                ),
              ],
            ),
          ),
        ),
      )),
    );
    if (result == null) {
      paymentScreenBloc?.add(DismissDialogEvent());
    }
  }

  void showSavedCardDialog() async {
    anorSavedCard = selectedPaymentMethod?.savedCard?.first;
    selectedVendorRecipientId =
        selectedPaymentMethod?.vendorRecipient?.simpleRecipientId ?? "";
    bool? result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => Dialog(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(AppSizes.sidePadding),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!
                      .translate(AppStringConstant.savedCardDetails)),
                  const SizedBox(
                    height: AppSizes.sidePadding,
                  ),
                  Visibility(
                    visible: selectedPaymentMethod?.savedCard != null &&
                        selectedPaymentMethod!.savedCard!.length == 1,
                    child: Column(
                      children: [
                        Text(selectedPaymentMethod!.savedCard![0].account!),
                        Text(selectedPaymentMethod!.savedCard![0].cardnumber!),
                        Text(selectedPaymentMethod!.savedCard![0].exp!),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: selectedPaymentMethod?.savedCard != null &&
                        selectedPaymentMethod!.savedCard!.length > 1,
                    child: AnorSavedCardOptionWidget(
                      allSavedCard: selectedPaymentMethod!.savedCard!,
                      onChanged: onCardChanged,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.sidePadding,
                  ),
                  Text(AppLocalizations.of(context)!
                      .translate(AppStringConstant.installmentOptions)),
                  const SizedBox(
                    height: AppSizes.sidePadding,
                  ),
                  AnorInstallmentOptionWidget(
                    vendorRecipient: selectedPaymentMethod!.vendorRecipient!,
                    onChanged: onInstallmentChanged,
                  ),
                  commonButton(
                    context,
                    () {
                      paymentScreenBloc?.add(PaymentScreenCheckoutEvents(
                          CheckoutRequestHelper.getRequestData(
                              paymentMethodResponse,
                              selectedPaymentMethod,
                              shippingId ?? [],
                              anorSavedCard,
                              selectedVendorRecipientId)));
                    },
                    GenericMethods.getStringValue(
                        context, AppStringConstant.generateOTP),
                    textColor: AppColors.white,
                    width: AppSizes.width / 2,
                    fontWeight: FontWeight.w600,
                    height: AppSizes.width / 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    if (result == null) {
      paymentScreenBloc?.add(DismissDialogEvent());
    }
  }

  void showPaymentOtpDialog(SubmitOrderResponse submitOrderResponse) async {
    bool? result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => Dialog(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(AppSizes.sidePadding),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!
                      .translate(AppStringConstant.verifyOTP)),
                  const SizedBox(
                    height: AppSizes.sidePadding,
                  ),
                  TextFormField(
                    controller: paymentOtpController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    obscureText: false,
                    maxLength: 6,
                    validator: (value) {
                      if (value!.isEmpty || value.length != 6) {
                        return AppLocalizations.of(context)!
                            .translate(AppStringConstant.pleaseEnterValidOTP);
                      }
                      return null;
                    },
                    onChanged: (value) {
                      debugPrint("OTP: $value");
                    },
                  ),
                  const SizedBox(
                    height: AppSizes.sidePadding,
                  ),
                  commonButton(
                    context,
                    () {
                      if (paymentOtpController.text.isNotEmpty &&
                          paymentOtpController.text.length == 6) {
                        paymentScreenBloc?.add(AnorBankVerifyPaymentOtpEvent(
                            paymentOtpController.text, submitOrderResponse));
                      } else {
                        GenericMethods.showErrorAlertMessages(
                            context,
                            AppLocalizations.of(context)!.translate(
                                AppStringConstant.pleaseEnterValidOTP));
                      }
                    },
                    GenericMethods.getStringValue(
                        context, AppStringConstant.verify),
                    textColor: AppColors.white,
                    width: AppSizes.width / 2,
                    fontWeight: FontWeight.w600,
                    height: AppSizes.width / 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (result == null) {
      paymentScreenBloc?.add(DismissDialogEvent());
    }
  }
}
