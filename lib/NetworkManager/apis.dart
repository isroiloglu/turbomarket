class Apis {
  static const String products = "/api/api/products.json";
  static const String homePageData = "/api/homepage/{customerId}";
  static const String productPageDataNew = "/api/ProductDetails/{productId}";
  static const String getSubmitProductReviews =
      "/api/Extendedproducts/{productId}";
  static const String cartPageData = "/api/viewcart/{customerId}?view=cart";
  static const String addToCartData = "/api/Addtocart/{customerId}";
  static const String addToWishListData = "/api/Addtowishlist/{customerId}";
  static const String categoryPageData = "/api/Extendedproducts/";
  static const String categoryHomePageProductData =
      "/api/HomepageProducts/{pageId}";
  static const String addToWishList = "/api/Addtowishlist/{customerId}";
  static const String productFilters = "/api/Filters/";
  static const String deleteFromWishList =
      "/api/Addtowishlist/{customerId}?scope=wishlist_product_delete";
  static const String getSubCategoriesById = "/api/CategoriesApi/{categoryId}";
  static const String checkoutBillShippingData =
      "/api/extendedusers/{customerId}?get_user_profiles=Y";
  static const String getShippingMethod = "/api/extendedcheckout/{customerId}";
  static const String getPaymentMethods =
      "/api/Extendedcheckout/{customerId}?view=checkout&edit_step=step_four";
  static const String submitOrder = "/api/Extendedcheckout/";

  // Wishlist APIs
  static const String getWishlistData = "/api/Getwishlistproduct/";
  static const String deleteWishlistItem =
      "/api/Addtowishlist/{customerId}?scope=wishlist_product_delete";
  static const String deleteWishlistItemWhole =
      "/api/Getwishlistproduct/{customerId}";

  // Order APIs
  static const String getOrderDetailData = "/api/extendedorders/{orderId}";
  static const String getOrdersData = "/api/extendedorders/";
  static const String reorder = "/api/extendedorders/";
  static const String getOrderDiscussionDataLatest =
      "/api/ExtendedOrderDiscussion/?view=initiate_discussion";
  static const String getOrderDiscussionData =
      "/api/ExtendedDiscussion/?view=initiate_discussion";

  // Search API
  static const String getSearchSuggestion = "/api/GetSearchSuggestion/";

  //Dashboard APIs
  static const String getDashboardAddressData =
      "/api/extendedusers/{customerId}";

  static const String login = "/api/login";
  static const String forgotPassword = "/api/extendedusers";
  static const String socialLogin = "/api/Sociallogin";

  static const String checkForGuestCheckout = "/api/Extendedcheckout/";
  static const String getCMSPageData = "/api/pages/{pageId}";
  static const String getAccountDetails = "/api/extendedusers/{customerId}";
  static const String saveCustomerDetails = "/api/extendedusers/{customerId}";
  static const String getTrackOrder = "/api/OrderTracker/";
  static const String getNotificationAPI = "/api/Notification";
  static const String googlePlace =
      "/api/place/textsearch/json?query={endPoint}";
  static const String deleteCustomerAccount = "/api/login/{customerId}";

  static const String updateUserProfile = "/api/extendedusers/{profileId}";
  static const String addProfiles = "/api/MultipleProfiles";
  static const String deleteProfiles = "/api/MultipleProfiles/{profileId}";

  // Phase 2 API Details
  static const String validateEmail = "/api/EmailValidation";

  // store front
  static const String storeFronts = "/api/storefronts";

  static const String rewardPoints = "/api/RewardPoints/{user_id}";
  static const String promotionsList = "/api/promotion/";

  // ShippingCountries
  static const String shippingEstimation = '/api/shippingEstimation/';
  static const String shippingEstimationMethodAvailability =
      '/api/shippingEstimation/{user_id}';

  //ProfileData
  static const String getMultipleProfiles = '/api/MultipleProfiles';

  static const String checkoutUpdateProfile =
      "/api/Extendedcheckout/{customerId}";
  static const String getGuestProfileData = "/api/extendedusers/{guestID}";
  static const String updateGuestData = "/api/extendedcheckout/{guestID}";

  static const String promotionProduct = "/api/promotionProducts/{promotionId}";

  //otp
  static const String otp = "/api/otpVerification";

  static const String orderStatus = "/api/GetOrderStatus/{orderId}";

  static const String anorBankGenerateOtp = "/api/AnorBankGenerateOtp";
  static const String anorBankVerifyOtp = "/api/AnorBankSubmitOtp";
}
