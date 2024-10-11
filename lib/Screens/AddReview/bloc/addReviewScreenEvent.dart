import 'package:equatable/equatable.dart';

import '../../../Models/Reviews/reviewRequest.dart';
abstract class AddReviewEvent extends Equatable{
  const AddReviewEvent();
  @override
  List<Object> get props => [];
}


class AddReviewSaveEvent extends AddReviewEvent{
  final SubmitReviewRequest reviewRequest;
  final String productId;

  const AddReviewSaveEvent(this.reviewRequest,this.productId);
}
