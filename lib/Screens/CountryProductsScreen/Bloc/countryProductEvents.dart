import 'package:equatable/equatable.dart';

abstract class CountryProductScreenEvent extends Equatable {}

class FetchCountryProductEvent extends CountryProductScreenEvent {
  String? id;
  int? page;
  String? sortBy;
  String? sortOrder;
  String? featuresHash;

  FetchCountryProductEvent(
      this.id, this.page, this.sortBy, this.sortOrder, this.featuresHash);

  @override
  List<Object?> get props => [id, page, sortBy, sortOrder, featuresHash];
}

class FetchPromotionProducts extends CountryProductScreenEvent {
  String? id;
  int? page;
  String? sortBy;
  String? sortOrder;
  String? featuresHash;

  FetchPromotionProducts(
      this.id, this.page, this.sortBy, this.sortOrder, this.featuresHash);

  @override
  List<Object?> get props => [id, page, sortBy, sortOrder, featuresHash];
}
