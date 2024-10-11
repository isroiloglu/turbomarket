import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/itemCardBloc/itemCardEvent.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/itemCardBloc/itemCardRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/HomeScreen/Widgets/itemCardBloc/itemCardState.dart';

class ItemCardBloc extends Bloc<ItemCardEvent, ItemCardState> {
  ItemCardRepositoryImp? repository;

  ItemCardBloc({this.repository}) : super(ItemCardAddToWishlistInitial()) {
    on<ItemCardEvent>(mapEventToState);
  }

  void mapEventToState(ItemCardEvent event, Emitter<ItemCardState> emit) async {
    emit(ItemCardAddToWishlistLoading());
    switch (event.runtimeType) {
      // case AddToCartEvent:
      //   try {
      //     var model = await repository?.addToCartPost((event as AddToCartEvent).request);
      //     if (model != null) {
      //       emit(AddToCartSuccess(model));
      //     } else {
      //       emit(ProductScreenError(''));
      //     }
      //   } catch (error, stacktrace) {
      //     print(stacktrace.toString());
      //     emit(ProductScreenError(error.toString()));
      //   }
      //   break;
      case AddToWishListItemCardEvent:
        // isLoading = 1;

        try {
          var model = await repository?.addToWishListPost(
              (event as AddToWishListItemCardEvent).request);
          if (model != null) {
            emit(ItemCardAddToWishlistSuccess(
                model, (event as AddToWishListItemCardEvent).productId));
          } else {
            emit(ItemCardAddToWishlistError(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(ItemCardAddToWishlistError(error.toString()));
        }
        break;
      case AddToCartEvent:
        try {
          var model = await repository
              ?.addToCartPost((event as AddToCartEvent).request);
          if (model != null && model.error == false) {
            emit(AddToCartSuccess(model));
          } else {
            print('stacktrace.toString()');
          }
        } catch (error, stacktrace) {
          print(stacktrace.toString());
        }
        //emit(ProductCompleteState());
        break;
      case RemoveItemEvent:
        try {
          var model = await repository
              ?.deleteItemFromWishlist((event as RemoveItemEvent).itemId);
          if (model != null) {
            emit(RemoveItemSuccess(model, (event as RemoveItemEvent).itemId));
          } else {
            emit(ItemCardAddToWishlistError(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(ItemCardAddToWishlistError(error.toString()));
        }
        break;
    }
  }
}
