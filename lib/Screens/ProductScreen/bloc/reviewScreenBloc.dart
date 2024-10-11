import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenEvent.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/reviewScreenState.dart';


class ReviewScreenBloc extends Bloc<ProductScreenEvent, ReviewScreenState>{
  ProductScreenRepositoryImp? repository;

  ReviewScreenBloc({this.repository}): super(ReviewScreenInitial()){
    on<ProductScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      ProductScreenEvent event, Emitter<ReviewScreenState> emit) async {
    if (event is ReviewsDataFetchEvent) {
      try {
        var model = await repository?.getProductReview(event.productId);
        if (model != null) {
          emit( ReviewScreenSuccess(model));
        } else {
          emit(ReviewScreenError(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(ReviewScreenError(error.toString()));
      }
    }
  }
}