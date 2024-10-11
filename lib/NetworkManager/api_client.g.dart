// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://turbomarket.uz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> getproducts(brand) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'brand': brand};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/api/products.json',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<HomeScreenModels> getHomePageData(
    customerId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HomeScreenModels>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/homepage/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HomeScreenModels.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductDetailModel> getProductDataNew(
    productId,
    userId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': userId,
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ProductDetailModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ProductDetails/${productId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductDetailModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryProductsDataModel> getCategoryData(
    categoryId,
    variantId,
    userId,
    width,
    page,
    sort_by,
    sort_order,
    features_hash,
    langCode,
    currencyCode,
    storeFrontId,
    itemsPerPage,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'cid': categoryId,
      r'variant_id': variantId,
      r'user_id': userId,
      r'width': width,
      r'page': page,
      r'sort_by': sort_by,
      r'sort_order': sort_order,
      r'features_hash': features_hash,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
      r'items_per_page': itemsPerPage,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryProductsDataModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Extendedproducts/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryProductsDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryProductsDataModel> getCountryProductData(
    storeFrontId,
    currencyCode,
    langCode,
    countryId,
    itemsPerPage,
    page,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'storefront_id': storeFrontId,
      r'currency_code': currencyCode,
      r'lang_code': langCode,
      r'country_id': countryId,
      r'items_per_page': itemsPerPage,
      r'page': page,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryProductsDataModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Extendedproducts/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryProductsDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryProductsDataModel> getHomePageProductData(
    customerId,
    userId,
    width,
    page,
    sort_by,
    sort_order,
    features_hash,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': userId,
      r'width': width,
      r'page': page,
      r'sort_by': sort_by,
      r'sort_order': sort_order,
      r'features_hash': features_hash,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryProductsDataModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/HomepageProducts/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryProductsDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReviewsData> getProductReviewData(
    productId,
    pageNo,
    scope,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': pageNo,
      r'scope': scope,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ReviewsData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Extendedproducts/${productId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReviewsData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WishListResponseModel> addtoWishlistPut(
    authkey,
    contentType,
    customerId,
    width,
    langCode,
    currencyCode,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WishListResponseModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/Addtowishlist/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WishListResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WishListResponseModel> addtoWishlistPost(
    authkey,
    contentType,
    customerId,
    width,
    langCode,
    currencyCode,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WishListResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/Addtowishlist/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WishListResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddToCartResponseModel> addToCartPut(
    customerId,
    width,
    langCode,
    currencyCode,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddToCartResponseModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Addtocart/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddToCartResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddToCartResponseModel> addToCartPost(
    customerId,
    width,
    langCode,
    currencyCode,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddToCartResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Addtocart/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddToCartResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartModel> getCartData(
    customerId,
    width,
    giftCode,
    walletSystem,
    totalCash,
    subtotal,
    formatedSubtotal,
    walletCartId,
    rechargeAmount,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'gc': giftCode,
      r'wallet_system': walletSystem,
      r'total_cash': totalCash,
      r'display_subtotal': subtotal,
      r'format_display_subtotal': formatedSubtotal,
      r'wallet_cart_id': walletCartId,
      r'recharge_amount': rechargeAmount,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CartModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/viewcart/${customerId}?view=cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartModel> applyRewardPoint(
    customerId,
    width,
    giftCode,
    walletSystem,
    totalCash,
    subtotal,
    formatedSubtotal,
    walletCartId,
    rechargeAmount,
    langCode,
    currencyCode,
    storeFrontId,
    points,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'gc': giftCode,
      r'wallet_system': walletSystem,
      r'total_cash': totalCash,
      r'display_subtotal': subtotal,
      r'format_display_subtotal': formatedSubtotal,
      r'wallet_cart_id': walletCartId,
      r'recharge_amount': rechargeAmount,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
      r'points_to_use': points,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CartModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/viewcart/${customerId}?view=cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartModel> deleteRewardPoint(
    customerId,
    width,
    giftCode,
    walletSystem,
    totalCash,
    subtotal,
    formatedSubtotal,
    walletCartId,
    rechargeAmount,
    langCode,
    currencyCode,
    storeFrontId,
    points,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'gc': giftCode,
      r'wallet_system': walletSystem,
      r'total_cash': totalCash,
      r'display_subtotal': subtotal,
      r'format_display_subtotal': formatedSubtotal,
      r'wallet_cart_id': walletCartId,
      r'recharge_amount': rechargeAmount,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
      r'deleted_points_in_use': points,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CartModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/viewcart/${customerId}?view=cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartModel> deleteItemFromCart(
    customerId,
    width,
    giftCode,
    scope,
    itemId,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'gc': giftCode,
      r'scope': scope,
      r'item_id': itemId,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CartModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/viewcart/${customerId}?view=cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartModel> applyCoupanCode(
    customerId,
    width,
    giftCode,
    langCode,
    currencyCode,
    storeFrontId,
    usedPoint,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'gc': giftCode,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
      r'points_to_use': usedPoint,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CartModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/viewcart/${customerId}?view=cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SubCategoryModel> getCategoryById(
    categoryId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SubCategoryModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/CategoriesApi/${categoryId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubCategoryModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartModel> deleteCart(
    customerId,
    width,
    giftCode,
    scope,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'gc': giftCode,
      r'scope': scope,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CartModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/viewcart/${customerId}?view=cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CartModel> updateCart(
    customerId,
    cartRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(cartRequest);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CartModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/viewcart/${customerId}?view=cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductFiltersModel> getProductFilters(
    scope,
    categoryId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'scope': scope,
      r'cid': categoryId,
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductFiltersModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Filters/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductFiltersModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CheckoutBillingShippingData> getCheckoutBillingShippingData(
    customerId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CheckoutBillingShippingData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/extendedusers/${customerId}?get_user_profiles=Y',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CheckoutBillingShippingData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReviewResponse> submitProductReview(
    authKey,
    productId,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authKey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ReviewResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Extendedproducts/${productId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReviewResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShippingMethodModel> getShippingMethodData(
    customerId,
    requestModel,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShippingMethodModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/extendedcheckout/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShippingMethodModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PaymentMethodResponse> getPaymentMethodData(
    customerId,
    width,
    langCode,
    currencyCode,
    shippingId,
    shipToAnother,
    giftCode,
    afterCoupanCodeTotal,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'shipping_id': shippingId,
      r'ship_to_another': shipToAnother,
      r'gc': giftCode,
      r'after_coupon_code_total': afterCoupanCodeTotal,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PaymentMethodResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Extendedcheckout/${customerId}?view=checkout&edit_step=step_four',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentMethodResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SubmitOrderResponse> submitOrder(
    width,
    langCode,
    currencyCode,
    requestData,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubmitOrderResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Extendedcheckout/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubmitOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderModel> getCustomerOrders(
    customerId,
    pageNumber,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': customerId,
      r'page': pageNumber,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrderModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/extendedorders/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderDetailsModel> getOrderDetails(
    customerId,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrderDetailsModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/extendedorders/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderDetailsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderCommunicationModel> orderDiscussion(
    orderId,
    langCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'order_id': orderId,
      r'lang_code': langCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderCommunicationModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ExtendedDiscussion/?view=initiate_discussion',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderCommunicationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderCommunicationModel> orderDiscussionLatest(
    orderId,
    langCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'order_id': orderId,
      r'lang_code': langCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderCommunicationModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ExtendedOrderDiscussion/?view=initiate_discussion',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderCommunicationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderDiscussionMSGModel> sendOrderDiscussionMsg(msgRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(msgRequest);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderDiscussionMSGModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ExtendedDiscussion/?view=initiate_discussion',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderDiscussionMSGModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderDiscussionMSGModel> sendOrderDiscussionMsgLatest(
      msgRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(msgRequest);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderDiscussionMSGModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ExtendedOrderDiscussion/?view=initiate_discussion',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderDiscussionMSGModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReorderResponse> getReOrderDetails(reorderReq) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reorderReq);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ReorderResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/extendedorders/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReorderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WishlistModel> getWishListProducts(
    customerId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': customerId,
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<WishlistModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Getwishlistproduct/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WishlistModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> deleteWishlistItem(
    customerId,
    itemId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'item_id': itemId,
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Addtowishlist/${customerId}?scope=wishlist_product_delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> deleteWishlistComplete(
    customerId,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'storefront_id': storeFrontId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Getwishlistproduct/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchSuggestionModel> getSearchSuggestion(
    searchKey,
    userId,
    langCode,
    currencyCode,
    storeFrontId,
    featuresHash,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pname': searchKey,
      r'user_id': userId,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
      r'features_hash': featuresHash,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchSuggestionModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/GetSearchSuggestion/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchSuggestionModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> customerLogin(
    userId,
    userPassword,
    guestId,
    chatToken,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_login': userId,
      r'password': userPassword,
      r'g_id': guestId,
      r'chat_token': chatToken,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> customerSocialLogin(
    authkey,
    contentType,
    langCode,
    currencyCode,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/Sociallogin',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> forgotCustomerPassword(
    authkey,
    contentType,
    request,
    langCode,
    currencyCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/extendedusers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> registerAccount(
    authkey,
    contentType,
    request,
    langCode,
    currencyCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CMSPageDetail> getMorePageData(
    pageId,
    width,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'width': width,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CMSPageDetail>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/pages/${pageId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CMSPageDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderTrackModel> setOrderTrack(
    authkey,
    trackId,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'track_data': trackId,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{r'Authorization': authkey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrderTrackModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/OrderTracker/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderTrackModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<NotificationResponse>> getNotificationData(
    authkey,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{r'Authorization': authkey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<NotificationResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Notification',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            NotificationResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ValidateEmailResponse> validateEmailId(
    authkey,
    contentType,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ValidateEmailResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/EmailValidation',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ValidateEmailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StoreSelectionResponse> getStoreFronts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StoreSelectionResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/storefronts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StoreSelectionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MyPointResponse> getRewardsPoints(
    customerId,
    storeFrontId,
    langCode,
    currencyCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'storefront_id': storeFrontId,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MyPointResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/RewardPoints/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyPointResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShippingEstimateResponse> getShippingEstimatedCost(
    langCode,
    currencyCode,
    isCountry,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'countries': isCountry,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShippingEstimateResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/shippingEstimation/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShippingEstimateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShippingMethodModel> getShippingMethodsBasedOnCountry(
    customerId,
    shippingMethodAvailability,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shippingMethodAvailability.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShippingMethodModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/shippingEstimation/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShippingMethodModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> submitShippingMethodDetails(
    customerId,
    shippingMethod,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shippingMethod.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/shippingEstimation/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PromotionResponse> getPromotionList(
    storeFrontId,
    itemsPerPage,
    page,
    langCode,
    currencyCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'storefront_id': storeFrontId,
      r'items_per_page': itemsPerPage,
      r'page': page,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PromotionResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/promotion/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PromotionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MultipleProfilesResponse> getMultipleProfilesData(
    userId,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': userId,
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MultipleProfilesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/MultipleProfiles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MultipleProfilesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AccountDetailResponse> getAccountDetails(
    customerId,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AccountDetailResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/extendedusers/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AccountDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> updateUserProfile(
    authkey,
    contentType,
    profileId,
    profileRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(profileRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/extendedusers/${profileId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> addProfiles(
    authkey,
    contentType,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = request;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/MultipleProfiles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShippingMethodModel> addProfileForCheckout(
    authkey,
    contentType,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShippingMethodModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/MultipleProfiles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShippingMethodModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> deleteProfiles(
    authkey,
    contentType,
    userId,
    profileId,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': userId,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/MultipleProfiles/${profileId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShippingMethodModel> checkoutUpdateProfile(
    authkey,
    contentType,
    customerId,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShippingMethodModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/Extendedcheckout/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShippingMethodModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GuestProfileData> getGuestProfileData(
    authkey,
    contentType,
    guestId,
    langCode,
    currencyCode,
    storeFrontId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang_code': langCode,
      r'currency_code': currencyCode,
      r'storefront_id': storeFrontId,
    };
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GuestProfileData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/extendedusers/${guestId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GuestProfileData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShippingMethodModel> updateGuestData(
    authkey,
    contentType,
    guestID,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShippingMethodModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/extendedcheckout/${guestID}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShippingMethodModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryProductsDataModel> getPromotionProducts(
    promotionId,
    storeFrontId,
    currencyCode,
    langCode,
    page,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'storefront_id': storeFrontId,
      r'currency_code': currencyCode,
      r'lang_code': langCode,
      r'page': page,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryProductsDataModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/promotionProducts/${promotionId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryProductsDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> deleteCustomerAccount(customerId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/login/${customerId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GenerateOtpResponse> generateOtp(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenerateOtpResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/otpVerification',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenerateOtpResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> verifyOtp(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/otpVerification',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderStatusResponse> getOrderStatus(
    orderId,
    langCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang_code': langCode};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderStatusResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/GetOrderStatus/${orderId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderStatusResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AnorGenerateOtpResponse> anorBankGenerateOtp(
    authkey,
    contentType,
    user_id,
    langCode,
    currencyCode,
    cardDetails,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'user_id': user_id,
      'lang_code': langCode,
      'currency_code': currencyCode,
      'cardDetails': cardDetails,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AnorGenerateOtpResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/AnorBankGenerateOtp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AnorGenerateOtpResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> anorBankVerifyOtp(
    authkey,
    contentType,
    card_id,
    otp,
    scope,
    refresh_token,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'card_id': card_id,
      'otp': otp,
      'scope': scope,
      'refresh_token': refresh_token,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/AnorBankSubmitOtp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> anorBankVerifyPaymentOtp(
    authkey,
    contentType,
    orderid,
    billId,
    otp,
    user_id,
    scope,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authkey,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'orderid': orderid,
      'billId': billId,
      'otp': otp,
      'user_id': user_id,
      'scope': scope,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/AnorBankSubmitOtp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
