// part of 'product_screen_bloc';

import 'package:equatable/equatable.dart';

import '../../../Models/ProductDetailModels/response/reviews_data.dart';


abstract class ReviewScreenState extends Equatable {
  const ReviewScreenState();

  @override
  List<Object> get props => [];
}

class ReviewScreenInitial extends ReviewScreenState {}

class ReviewScreenSuccess extends ReviewScreenState {
  ReviewScreenSuccess(this.reviewsData);

  ReviewsData? reviewsData;

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ReviewScreenError extends ReviewScreenState {
  ReviewScreenError(this._message);

  String? _message;

  // ignore: unnecessary_getters_setters
  String? get message => _message;

  // ignore: unnecessary_getters_setters
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}
