import 'package:equatable/equatable.dart';

abstract class PromotionScreenEvent extends Equatable{}



class PromotionScreenFetchEvent extends PromotionScreenEvent{
  int pageNumber;
  PromotionScreenFetchEvent(this.pageNumber);

  @override
  List<Object?> get props => [];
}