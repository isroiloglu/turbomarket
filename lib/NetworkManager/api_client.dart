import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:retrofit/http.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/createProfileRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/updateProfileRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AnorBank/anor_generate_otp_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CheckoutModels/GuestCheckout/Response/guestProfileData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CheckoutModels/LoginUser/Request/updateProfileCheckoutRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OrderStatus/order_status_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OtpModels/generateOtpRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PromotionsModel/promotionResponse.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/request/submitShippingDetails.dart';

import '../Constants/appConstants.dart';
import '../Models/AccountModels/Response/accountDetailResponse.dart';
import '../Models/CartModel/cart_model.dart';
import '../Models/CategoryProductData/category_product_data_model.dart';
import '../Models/CheckoutModels/GuestCheckout/Request/submitDataRequest.dart';
import '../Models/HomePageModels/home_screen_models.dart';
import '../Models/HomePageModels/product_filters.dart';
import '../Models/LoginSignupModels/Requests/forgot_password_request.dart';
import '../Models/LoginSignupModels/Requests/register_request.dart';
import '../Models/LoginSignupModels/Requests/social_login_request.dart';
import '../Models/LoginSignupModels/login_response.dart';
import '../Models/MultipleProfilesModel/response/multipleProfileResponse.dart';
import '../Models/MyPointsModel/myPointsResponse.dart';
import '../Models/NotificationModel/notification_list_response.dart';
import '../Models/OrderDetailModel/order_communication_model.dart';
import '../Models/OrderDetailModel/order_details_model.dart';
import '../Models/OrderDetailModel/order_discussion_msg_model.dart';
import '../Models/OrderListModel/order_model.dart';
import '../Models/OrderReorderModel/Response/reorder_response.dart';
import '../Models/OrderTrackModel/orderTrackModel.dart';
import '../Models/OtpModels/generateOtpResponse.dart';
import '../Models/PaymentMethodModels/payment_method_response.dart';
import '../Models/PlaceOrderRequest/placeOrderRequest.dart';
import '../Models/ProductDetailModels/response/add_to_cart_response_model.dart';
import '../Models/ProductDetailModels/response/cms_page_detail.dart';
import '../Models/ProductDetailModels/response/product_detail_model.dart';
import '../Models/ProductDetailModels/response/reviews_data.dart';
import '../Models/Reviews/reviewResponse.dart';
import '../Models/SearchModel/search_suggestion_model.dart';
import '../Models/ShippingModel/Request/shippingAvailabilityRequest.dart';
import '../Models/ShippingModel/Request/shipping_method_request.dart';
import '../Models/ShippingModel/Request/submit_order_request.dart';
import '../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../Models/ShippingModel/checkout_billing_shipping_data.dart';
import '../Models/StoreSelectionModels/storeSelectionResponse.dart';
import '../Models/SubcategoryModel/subcategory_model.dart';
import '../Models/SubmitOrderModel/submit_order_response.dart';
import '../Models/ValidateEmailModel/Request/validate_email_request.dart';
import '../Models/ValidateEmailModel/validate_email_response.dart';
import '../Models/WishlistModel/wishlist_model.dart';
import '../Models/WishlistModels/response/wishlisht_response_model.dart';
import '../Models/baseResponse/base_response.dart';
import '../Models/shippingEstimateModel/response/shippingEstimateResponse.dart';
import 'apis.dart';
import 'dio_exceptions.dart';
import 'interceptor.dart';

part 'api_client.g.dart';

// class IgnoreCertificateErrorOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
//         return true;
//       });
//   }
// }

// Future<void> myNonSecurityCriticalApiCall() async {
//   await HttpOverrides.runWithHttpOverrides(() async {
//     String url = 'https://api.example.com/non/security/critical/service';
//     Response response = await get(url);
//
//     // ... do something with the response ...
//   }, IgnoreCertificateErrorOverrides());
// }

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiClient {
  factory ApiClient({String? baseUrl}) {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveTimeout: 90000,
        connectTimeout: 90000,
        baseUrl: ApiConstant.baseUrl);
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Authorization"] = ApiConstant.authToken;
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (b) {
          log(b.toString());
        }));
    RequestOptions? reqOptions;
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      reqOptions = options;
      return handler.next(options);
    }, onResponse: (response, handler) async {
      log("Response::: $response");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      DioExceptions.fromDioError(e)
          .retryApiFromClient(e, reqOptions, dio, handler);
      // return handler.next(e);
    }));
    dio.interceptors.add(EncodingInterceptor());
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET(Apis.products)
  Future<dynamic> getproducts(@Query("brand") String brand);

  @GET(Apis.homePageData)
  Future<HomeScreenModels> getHomePageData(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.productPageDataNew)
  Future<ProductDetailModel> getProductDataNew(
      @Path("productId") String productId,
      @Query("user_id") String userId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.categoryPageData)
  Future<CategoryProductsDataModel> getCategoryData(
      @Query("cid") String categoryId,
      @Query("variant_id") String variantId,
      @Query("user_id") String userId,
      @Query("width") int width,
      @Query("page") int page,
      @Query("sort_by") String sort_by,
      @Query("sort_order") String sort_order,
      @Query("features_hash") String features_hash,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId,
      @Query("items_per_page") int itemsPerPage);

  @GET(Apis.categoryPageData)
  Future<CategoryProductsDataModel> getCountryProductData(
    @Query("storefront_id") String storeFrontId,
    @Query("currency_code") String currencyCode,
    @Query("lang_code") String langCode,
    @Query("country_id") String countryId,
    @Query("items_per_page") int itemsPerPage,
    @Query("page") int page,
  );

  @GET(Apis.categoryHomePageProductData)
  Future<CategoryProductsDataModel> getHomePageProductData(
      @Path("pageId") String customerId,
      @Query("user_id") String userId,
      @Query("width") int width,
      @Query("page") int page,
      @Query("sort_by") String sort_by,
      @Query("sort_order") String sort_order,
      @Query("features_hash") String features_hash,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getSubmitProductReviews)
  Future<ReviewsData> getProductReviewData(
      @Path("productId") int productId,
      @Query("page") int pageNo,
      @Query("scope") String scope,
      @Query("storefront_id") String storeFrontId);

//
//
  @PUT(Apis.addToWishList)
  Future<WishListResponseModel> addtoWishlistPut(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Body() Map<String, dynamic> request);

  @POST(Apis.addToWishList)
  Future<WishListResponseModel> addtoWishlistPost(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Body() Map<String, dynamic> request);

  @PUT(Apis.addToCartData)
  Future<AddToCartResponseModel> addToCartPut(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Body() Map<String, dynamic> request);

  @POST(Apis.addToCartData)
  Future<AddToCartResponseModel> addToCartPost(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Body() Map<String, dynamic> request);

  @GET(Apis.cartPageData)
  Future<CartModel> getCartData(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("gc") String giftCode,
      @Query("wallet_system") int walletSystem,
      @Query("total_cash") String totalCash,
      @Query("display_subtotal") double subtotal,
      @Query("format_display_subtotal") String formatedSubtotal,
      @Query("wallet_cart_id") String walletCartId,
      @Query("recharge_amount") String rechargeAmount,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.cartPageData)
  Future<CartModel> applyRewardPoint(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("gc") String giftCode,
      @Query("wallet_system") int walletSystem,
      @Query("total_cash") String totalCash,
      @Query("display_subtotal") double subtotal,
      @Query("format_display_subtotal") String formatedSubtotal,
      @Query("wallet_cart_id") String walletCartId,
      @Query("recharge_amount") String rechargeAmount,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId,
      @Query("points_to_use") String points);

  @GET(Apis.cartPageData)
  Future<CartModel> deleteRewardPoint(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("gc") String giftCode,
      @Query("wallet_system") int walletSystem,
      @Query("total_cash") String totalCash,
      @Query("display_subtotal") double subtotal,
      @Query("format_display_subtotal") String formatedSubtotal,
      @Query("wallet_cart_id") String walletCartId,
      @Query("recharge_amount") String rechargeAmount,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId,
      @Query("deleted_points_in_use") String points);

  @GET(Apis.cartPageData)
  Future<CartModel> deleteItemFromCart(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("gc") String giftCode,
      @Query("scope") String scope,
      @Query("item_id") String itemId,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.cartPageData)
  Future<CartModel> applyCoupanCode(
    @Path("customerId") String customerId,
    @Query("width") int width,
    @Query("gc", encoded: false) String giftCode,
    @Query("lang_code") String langCode,
    @Query("currency_code") String currencyCode,
    @Query("storefront_id") String storeFrontId,
    @Query("points_to_use") String usedPoint,
  );

  @GET(Apis.getSubCategoriesById)
  Future<SubCategoryModel> getCategoryById(
      @Path("categoryId") String categoryId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.cartPageData)
  Future<CartModel> deleteCart(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("gc") String giftCode,
      @Query("scope") String scope,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  //    @FormUrlEncoded
  @PUT(Apis.cartPageData)
  Future<CartModel> updateCart(@Path("customerId") String customerId,
      @Body() Map<String, dynamic> cartRequest);

  @GET(Apis.productFilters)
  Future<ProductFiltersModel> getProductFilters(
      @Query("scope") String scope,
      @Query("cid") String categoryId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.checkoutBillShippingData)
  Future<CheckoutBillingShippingData> getCheckoutBillingShippingData(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @PUT(Apis.getSubmitProductReviews)
  Future<ReviewResponse> submitProductReview(
      @Header("Authorization") String authKey,
      @Path("productId") String productId,
      @Body() Map<String, dynamic> request);

  @PUT(Apis.getShippingMethod)
  Future<ShippingMethodModel> getShippingMethodData(
      @Path("customerId") String customerId,
      @Body() ShippingMethodRequest requestModel);

  @GET(Apis.getPaymentMethods)
  Future<PaymentMethodResponse> getPaymentMethodData(
      @Path("customerId") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("shipping_id") List<String> shippingId,
      @Query("ship_to_another") String shipToAnother,
      @Query("gc") String giftCode,
      @Query("after_coupon_code_total") String afterCoupanCodeTotal,
      @Query("storefront_id") String storeFrontId);

  @POST(Apis.submitOrder)
  Future<SubmitOrderResponse> submitOrder(
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Body() PlaceOrderRequest requestData);

  @GET(Apis.getOrdersData)
  Future<OrderModel> getCustomerOrders(
      @Query("user_id") String customerId,
      @Query("page") int pageNumber,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getOrderDetailData)
  Future<OrderDetailsModel> getOrderDetails(
      @Path("orderId") String customerId,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getOrderDiscussionData)
  Future<OrderCommunicationModel> orderDiscussion(
      @Query("order_id") String orderId,
      @Query("lang_code") String langCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getOrderDiscussionDataLatest)
  Future<OrderCommunicationModel> orderDiscussionLatest(
      @Query("order_id") String orderId,
      @Query("lang_code") String langCode,
      @Query("storefront_id") String storeFrontId);

  @POST(Apis.getOrderDiscussionData)
  Future<OrderDiscussionMSGModel> sendOrderDiscussionMsg(
      @Body() Map<String, dynamic> msgRequest);

  @POST(Apis.getOrderDiscussionDataLatest)
  Future<OrderDiscussionMSGModel> sendOrderDiscussionMsgLatest(
      @Body() Map<String, dynamic> msgRequest);

  @POST(Apis.reorder)
  Future<ReorderResponse> getReOrderDetails(
      @Body() Map<String, dynamic> reorderReq);

  @GET(Apis.getWishlistData)
  Future<WishlistModel> getWishListProducts(
      @Query("user_id") String customerId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.deleteWishlistItem)
  Future<BaseResponse> deleteWishlistItem(
      @Path("customerId") String customerId,
      @Query("item_id") String itemId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.deleteWishlistItemWhole)
  Future<BaseResponse> deleteWishlistComplete(
      @Path("customerId") String customerId,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getSearchSuggestion)
  Future<SearchSuggestionModel> getSearchSuggestion(
      @Query("pname") String searchKey,
      @Query("user_id") String userId,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId,
      @Query("features_hash") String featuresHash);

  @GET(Apis.login)
  Future<LoginResponse> customerLogin(
      @Query("user_login") String userId,
      @Query("password") String userPassword,
      @Query("g_id") String guestId,
      @Query("chat_token") String chatToken,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @POST(Apis.socialLogin)
  Future<LoginResponse> customerSocialLogin(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Body() SocialLoginRequest request);

  @POST(Apis.forgotPassword)
  Future<LoginResponse> forgotCustomerPassword(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Body() ForgotPasswordRequest request,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode);

  @POST(Apis.login)
  Future<LoginResponse> registerAccount(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Body() RegisterAccountRequest request,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode);

  @GET(Apis.getCMSPageData)
  Future<CMSPageDetail> getMorePageData(
      @Path("pageId") String pageId,
      @Query("width") int width,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getTrackOrder)
  Future<OrderTrackModel> setOrderTrack(
      @Header("Authorization") String authkey,
      @Query("track_data") String trackId,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getNotificationAPI)
  Future<List<NotificationResponse>> getNotificationData(
      @Header("Authorization") String authkey,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @POST(Apis.validateEmail)
  Future<ValidateEmailResponse> validateEmailId(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Body() ValidateEmailRequest request);

  @GET(Apis.storeFronts)
  Future<StoreSelectionResponse> getStoreFronts();

  @GET(Apis.rewardPoints)
  Future<MyPointResponse> getRewardsPoints(
    @Path("user_id") String customerId,
    @Query("storefront_id") String storeFrontId,
    @Query("lang_code") String langCode,
    @Query("currency_code") String currencyCode,
  );

  @GET(Apis.shippingEstimation)
  Future<ShippingEstimateResponse> getShippingEstimatedCost(
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("countries") bool isCountry,
      @Query("storefront_id") String storeFrontId);

  @PUT(Apis.shippingEstimationMethodAvailability)
  Future<ShippingMethodModel> getShippingMethodsBasedOnCountry(
      @Path("user_id") String customerId,
      @Body() ShippingMethodAvailabilityRequest shippingMethodAvailability);

  @PUT(Apis.shippingEstimationMethodAvailability)
  Future<BaseResponse> submitShippingMethodDetails(
      @Path("user_id") String customerId,
      @Body() SubmitShippingDetails shippingMethod);

  @GET(Apis.promotionsList)
  Future<PromotionResponse> getPromotionList(
    @Query("storefront_id") String storeFrontId,
    @Query("items_per_page") int itemsPerPage,
    @Query("page") int page,
    @Query("lang_code") String langCode,
    @Query("currency_code") String currencyCode,
  );

  @GET(Apis.getMultipleProfiles)
  Future<MultipleProfilesResponse> getMultipleProfilesData(
      @Query("user_id") String userId,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @GET(Apis.getAccountDetails)
  Future<AccountDetailResponse> getAccountDetails(
      @Path("customerId") String customerId,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @PUT(Apis.updateUserProfile)
  Future<BaseResponse> updateUserProfile(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Path("profileId") String profileId,
      @Body() UpdateProfileRequest profileRequest);

  @POST(Apis.addProfiles)
  Future<BaseResponse> addProfiles(@Header("Authorization") String authkey,
      @Header("Content-Type") String contentType, @Body() String request);

  @POST(Apis.addProfiles)
  Future<ShippingMethodModel> addProfileForCheckout(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Body() CreateProfileRequest request);

  @DELETE(Apis.deleteProfiles)
  Future<BaseResponse> deleteProfiles(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Query("user_id") String userId,
      @Path("profileId") String profileId,
      @Query("storefront_id") String storeFrontId);

  @PUT(Apis.checkoutUpdateProfile)
  Future<ShippingMethodModel> checkoutUpdateProfile(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Path("customerId") String customerId,
      @Body() UpdateProfileCheckoutRequest request);

  @GET(Apis.getGuestProfileData)
  Future<GuestProfileData> getGuestProfileData(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Path("guestID") String guestId,
      @Query("lang_code") String langCode,
      @Query("currency_code") String currencyCode,
      @Query("storefront_id") String storeFrontId);

  @PUT(Apis.updateGuestData)
  Future<ShippingMethodModel> updateGuestData(
      @Header("Authorization") String authkey,
      @Header("Content-Type") String contentType,
      @Path("guestID") String guestID,
      @Body() SubmitUserDataRequest request);

  @GET(Apis.promotionProduct)
  Future<CategoryProductsDataModel> getPromotionProducts(
    @Path("promotionId") String promotionId,
    @Query("storefront_id") String storeFrontId,
    @Query("currency_code") String currencyCode,
    @Query("lang_code") String langCode,
    @Query("page") int page,
  );

  @DELETE(Apis.deleteCustomerAccount)
  Future<BaseResponse> deleteCustomerAccount(
      @Path("customerId") String customerId);

  @POST(Apis.otp)
  Future<GenerateOtpResponse> generateOtp(
    @Body() GenerateOtpRequest request,
  );

  @POST(Apis.otp)
  Future<LoginResponse> verifyOtp(
    @Body() GenerateOtpRequest request,
  );

  @GET(Apis.orderStatus)
  Future<OrderStatusResponse> getOrderStatus(
    @Path("orderId") String orderId,
    @Query("lang_code") String langCode,
  );

  @POST(Apis.anorBankGenerateOtp)
  Future<AnorGenerateOtpResponse> anorBankGenerateOtp(
    @Header("Authorization") String authkey,
    @Header("Content-Type") String contentType,
    @Field("user_id") String user_id,
    @Field("lang_code") String langCode,
    @Field("currency_code") String currencyCode,
    @Field("cardDetails") Map<String, dynamic> cardDetails,
  );

  @POST(Apis.anorBankVerifyOtp)
  Future<BaseResponse> anorBankVerifyOtp(
    @Header("Authorization") String authkey,
    @Header("Content-Type") String contentType,
    @Field("card_id") String card_id,
    @Field("otp") String otp,
    @Field("scope") String scope,
    @Field("refresh_token") String refresh_token,
  );

  @POST(Apis.anorBankVerifyOtp)
  Future<BaseResponse> anorBankVerifyPaymentOtp(
    @Header("Authorization") String authkey,
    @Header("Content-Type") String contentType,
    @Field("orderid") String orderid,
    @Field("billId") String billId,
    @Field("otp") String otp,
    @Field("user_id") String user_id,
    @Field("scope") String scope,
  );
}
