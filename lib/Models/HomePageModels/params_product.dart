class ProductParams {
  String? area;
  bool? useCaching;
  List<String>? extend;
  String? pname;
  String? pshort;
  String? pfull;
  String? pkeywords;
  String? type;
  dynamic page;
  String? action;
  String? featuresHash;
  int? limit;
  int? bid;
  String? match;
  bool? getFrontendUrls;
  int? itemsPerPage;
  String? applyDisabledFilters;
  bool? loadProductsExtraData;
  String? companyIds;
  bool? showMasterProductsOnly;
  String? userId;
  String? width;
  String? sortBy;
  String? sortOrder;
  String? langCode;
  String? currencyCode;
  String? status;
  int? runtimeCompanyId;
  bool? hideOutOfStockProducts;
  bool? includeChildVariations;
  bool? groupChildVariations;
  int? parentProductId;
  String? sortOrderRev;
  dynamic totalItems;

  ProductParams(
      {this.area,
      this.useCaching,
      this.extend,
      this.pname,
      this.pshort,
      this.pfull,
      this.pkeywords,
      this.type,
      this.page,
      this.action,
      this.featuresHash,
      this.limit,
      this.bid,
      this.match,
      this.getFrontendUrls,
      this.itemsPerPage,
      this.applyDisabledFilters,
      this.loadProductsExtraData,
      this.companyIds,
      this.showMasterProductsOnly,
      this.userId,
      this.width,
      this.sortBy,
      this.sortOrder,
      this.langCode,
      this.currencyCode,
      this.status,
      this.runtimeCompanyId,
      this.hideOutOfStockProducts,
      this.includeChildVariations,
      this.groupChildVariations,
      this.parentProductId,
      this.sortOrderRev,
      this.totalItems});

  ProductParams.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    useCaching = json['use_caching'];
    extend = json['extend'].cast<String>();
    pname = json['pname'];
    pshort = json['pshort'];
    pfull = json['pfull'];
    pkeywords = json['pkeywords'];
    type = json['type'];
    page = json['page'];
    action = json['action'];
    featuresHash = json['features_hash'];
    limit = json['limit'];
    bid = json['bid'];
    match = json['match'];
    getFrontendUrls = json['get_frontend_urls'];
    itemsPerPage = json['items_per_page'];
    applyDisabledFilters = json['apply_disabled_filters'];
    loadProductsExtraData = json['load_products_extra_data'];
    companyIds = json['company_ids'];
    showMasterProductsOnly = json['show_master_products_only'];
    userId = json['user_id'];
    width = json['width'];
    sortBy = json['sort_by'];
    sortOrder = json['sort_order'];
    langCode = json['lang_code'];
    currencyCode = json['currency_code'];
    status = json['status'];
    runtimeCompanyId = json['runtime_company_id'];
    hideOutOfStockProducts = json['hide_out_of_stock_products'];
    includeChildVariations = json['include_child_variations'];
    groupChildVariations = json['group_child_variations'];
    parentProductId = json['parent_product_id'];
    sortOrderRev = json['sort_order_rev'];
    totalItems = json['total_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['use_caching'] = this.useCaching;
    data['extend'] = this.extend;
    data['pname'] = this.pname;
    data['pshort'] = this.pshort;
    data['pfull'] = this.pfull;
    data['pkeywords'] = this.pkeywords;
    data['type'] = this.type;
    data['page'] = this.page;
    data['action'] = this.action;
    data['features_hash'] = this.featuresHash;
    data['limit'] = this.limit;
    data['bid'] = this.bid;
    data['match'] = this.match;
    data['get_frontend_urls'] = this.getFrontendUrls;
    data['items_per_page'] = this.itemsPerPage;
    data['apply_disabled_filters'] = this.applyDisabledFilters;
    data['load_products_extra_data'] = this.loadProductsExtraData;
    data['company_ids'] = this.companyIds;
    data['show_master_products_only'] = this.showMasterProductsOnly;

    data['user_id'] = this.userId;
    data['width'] = this.width;
    data['sort_by'] = this.sortBy;
    data['sort_order'] = this.sortOrder;
    data['lang_code'] = this.langCode;
    data['currency_code'] = this.currencyCode;
    data['status'] = this.status;
    data['runtime_company_id'] = this.runtimeCompanyId;
    data['hide_out_of_stock_products'] = this.hideOutOfStockProducts;
    data['include_child_variations'] = this.includeChildVariations;
    data['group_child_variations'] = this.groupChildVariations;
    data['parent_product_id'] = this.parentProductId;
    data['sort_order_rev'] = this.sortOrderRev;
    data['total_items'] = this.totalItems;
    return data;
  }
}
