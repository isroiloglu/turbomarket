import 'package:equatable/equatable.dart';

import '../../../Models/Reviews/reviewResponse.dart';

abstract class AddReviewScreenState extends Equatable {
  const AddReviewScreenState();

  @override
  List<Object> get props => [];
}

class AddReviewInitialState extends AddReviewScreenState{}

class AddReviewLoadingState extends AddReviewScreenState{}
class AddReviewCompleteState extends AddReviewScreenState{}

class AddReviewSuccessState extends AddReviewScreenState{
  final ReviewResponse data;
  const AddReviewSuccessState(this.data);
}

class AddReviewErrorState extends AddReviewScreenState{
  final String message;
  const AddReviewErrorState(this.message);
}

class EmptyState extends AddReviewScreenState{
  @override
  List<Object> get props => [];
}



