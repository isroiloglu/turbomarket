import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/starRatingWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/CommonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';

import '../../Config/theme.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/storageHelper.dart';
import '../../Models/Reviews/reviewRequest.dart';
import '../../Models/Reviews/reviewRequestData.dart';
import 'bloc/addReviewScreenBloc.dart';
import 'bloc/addReviewScreenEvent.dart';
import 'bloc/addReviewScreenState.dart';

class WriteAReviewDialog extends StatefulWidget {
  final String productName;
  final int productId;

  const WriteAReviewDialog(
      {Key? key, required this.productName, required this.productId})
      : super(key: key);

  @override
  _WriteAReviewDialogState createState() => _WriteAReviewDialogState();
}

class _WriteAReviewDialogState extends State<WriteAReviewDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? reviewCustomerName;
  TextEditingController? reviewDesc;
  AddReviewScreenBloc? _addReviewScreenBloc;
  bool isLoading = false;
  double rating = 0.0;

  @override
  void initState() {
    reviewCustomerName = TextEditingController();
    reviewDesc = TextEditingController();
    _addReviewScreenBloc = context.read<AddReviewScreenBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productName = Text("${GenericMethods.getStringValue(context, AppStringConstant.reviewOf)} ${widget.productName}",
        style: AppTheme.lightTheme.textTheme.bodyLarge);
    textFieldLabel(String label) => Text(
          label,
          style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        );
    return BlocBuilder<AddReviewScreenBloc, AddReviewScreenState>(
        builder: (context, currentState) {
      if (currentState is AddReviewLoadingState) {
        isLoading = true;
      } else if (currentState is AddReviewSuccessState) {
        isLoading = false;
        if (!(currentState.data.error ?? false) || currentState.data.error == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AlertMessage.showSuccess(currentState.data.msg ?? '', context);
          });
          Future.delayed(Duration.zero, () {
            _addReviewScreenBloc?.emit(EmptyState());
            Navigator.pop(context);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AlertMessage.showError(currentState.data.msg ?? '', context);
          });
        }
      } else if (currentState is AddReviewErrorState) {
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }
      return Stack(
        children: [
          Dialog(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        productName,
                        const SizedBox(
                          height: AppSizes.normalPadding,
                        ),
                        StarRating(
                            rating: rating,
                            onRatingChanged: (val) {
                                rating = val;
                            },
                            size: 24.0),
                        const SizedBox(
                          height: AppSizes.maximumPadding,
                        ),
                        textFieldLabel(GenericMethods.getStringValue(
                            context, AppStringConstant.reviewTitle)),
                        const SizedBox(
                          height: AppSizes.normalPadding,
                        ),
                        TextFormField(
                          controller: reviewCustomerName,
                          cursorColor: MobikulTheme.clientPrimaryColor,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "${GenericMethods.getStringValue(context, AppStringConstant.yourName)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                            }
                          },
                          style: AppTheme.lightTheme.textTheme.bodySmall,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(AppSizes.normalPadding),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                          ),
                        ),
                        const SizedBox(
                          height: AppSizes.maximumPadding,
                        ),
                        textFieldLabel(GenericMethods.getStringValue(
                            context, AppStringConstant.yourReview)),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          controller: reviewDesc,
                          cursorColor: MobikulTheme.clientPrimaryColor,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "${GenericMethods.getStringValue(context, AppStringConstant.yourName)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                            }
                          },
                          style: AppTheme.lightTheme.textTheme.bodySmall,
                          decoration: InputDecoration(
                            labelStyle: AppTheme.lightTheme.textTheme.bodySmall,
                            contentPadding: const EdgeInsets.all(AppSizes.normalPadding),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: AppSizes.size45,
                        ),
                        SizedBox(
                            height: 50.0,
                            width: AppSizes.width,
                            child: commonButton(context, () {
                              if (_formKey.currentState!.validate() &&
                                  rating != 0.0) {
                                SubmitReviewRequest reviewRequest =
                                    SubmitReviewRequest();
                                ReviewRequestData requestData = ReviewRequestData();
                                requestData.name = reviewCustomerName?.text;
                                requestData.message = reviewDesc?.text;
                                requestData.ratingValue = rating;
                                requestData.selectGdprAgreement = "Y";
                                if (storageController.getLoginStatus() != false) {
                                  requestData.customerId = ((storageController.getUserData()?.userId??""))??"";
                                }
                                reviewRequest.setReviewData(requestData);
                                reviewRequest.languageCode =
                                    storageController.getCurrentLanguage();
                                _addReviewScreenBloc?.add(
                                  AddReviewSaveEvent(
                                      reviewRequest, widget.productId.toString()),
                                );
                              } else if (rating == 0.0) {
                                AlertMessage.showError(
                                    GenericMethods.getStringValue(
                                        context, AppStringConstant.selectRating),
                                    context);
                              }
                            },
                                GenericMethods.getStringValue(
                                    context, AppStringConstant.submitReview),
                                height: 50.0,
                                width: AppSizes.width,
                                backgroundColor: MobikulTheme.clientPrimaryColor,
                                textColor: AppColors.white))
                      ],
                    ),
                  ),
                ),
              )),
          Visibility(
              visible: isLoading,
              child: Loader())
        ],
      );
    });
  }
}
