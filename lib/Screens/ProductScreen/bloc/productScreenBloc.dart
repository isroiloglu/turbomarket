import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenEvent.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ProductScreen/bloc/productScreenStates.dart';

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState>{
  ProductScreenRepositoryImp? repository;

  ProductScreenBloc({this.repository}): super(ProductScreenInitial()){
    on<ProductScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      ProductScreenEvent event, Emitter<ProductScreenState> emit) async {
    switch (event.runtimeType) {
      case ProductScreenDataFetchEvent:
        try {
          var model = await repository?.getProductData((event as ProductScreenDataFetchEvent).productId);
          if (model != null) {
            emit(ProductScreenSuccess(model));
          } else {
            emit(ProductScreenError(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(ProductScreenError(error.toString()));
        }
        break;
      case AddToCartEvent:
        try {
          var model = await repository?.addToCartPost((event as AddToCartEvent).request);
          if (model != null&&model.error==false) {
            emit(AddToCartSuccess(model));
          } else {
            emit(ProductScreenError(model?.msg??""));
          }
        } catch (error, stacktrace) {
          print(stacktrace.toString());
          emit(ProductScreenError(error.toString()));
        }
        //emit(ProductCompleteState());
        break;
      case BuyNowEvent:
        try {
          var model = await repository?.addToCartPost((event as BuyNowEvent).request);
          if (model != null) {
            emit(BuyNowSuccess(model));
          } else {
            emit(ProductScreenError(''));
          }
        } catch (error, stacktrace) {
          print(stacktrace.toString());
          emit(ProductScreenError(error.toString()));
        }
        //emit(ProductCompleteState());
        break;
      case AddToWishListEvent:
        try {
          var model = await repository?.addToWishListPost((event as AddToWishListEvent).request);
          if (model != null) {
            emit(AddToWishListSuccess(model));
          } else {
            emit(ProductScreenError(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(ProductScreenError(error.toString()));
        }
        break;
      case RemoveItemEvent:
        try {
          var model = await repository?.deleteItemFromWishlist((event as RemoveItemEvent).itemId);
          if (model != null) {
            emit(RemoveItemSuccess(model));
          } else {
            emit(ProductScreenError(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(ProductScreenError(error.toString()));
        }
        break;
      case QuantityIncreaseEvent:
        try {
          var qty = repository?.increaseQty((event as QuantityIncreaseEvent).qty);
          emit(QuantityEvent(qty!));
        } catch (error, _) {
          print(error.toString());
          print(_);

          emit(ProductScreenError(error.toString()));
        }
        break;
      case QuantityDecreaseEvent:
        try {
          var qty = repository?.decreaseQty((event as QuantityDecreaseEvent).qty);
          emit(QuantityEvent(qty!));
        } catch (error, _) {
          print(error.toString());
          emit(ProductScreenError(error.toString()));
        }
        break;
    }
  }
}