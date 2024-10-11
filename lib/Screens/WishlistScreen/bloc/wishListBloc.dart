import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/WishlistScreen/bloc/wishListStates.dart';

class WishlistScreenBloc extends Bloc<WishlistEvent, WishlistState>{
  WishlistRepository repository;
  WishlistScreenBloc({required this.repository}) : super(WishlistInitialState()) {
    on<WishlistEvent>(mapEventToState);
  }

  void mapEventToState(
      WishlistEvent event, Emitter<WishlistState> emit) async {
    if (event is WishlistDataFetchEvent) {
      emit(WishlistInitialState());
      try {
        var model = await repository.getWishlistItems();
        if (model != null) {
          //  storageController.setCompanyId(model.companyId ?? '');
          emit( WishlistScreenSuccessState(model));
        } else {
          emit(WishlistScreenError(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(WishlistScreenError(error.toString()));
      }
    }
    else if(event is RemoveItemEvent){
      try {
        var model = await repository.deleteItemFromWishlist(event.itemId);
        if (model != null) {
          emit(RemoveItemSuccessState(model));
        } else {
          emit(WishlistScreenError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(WishlistScreenError(error.toString()));
      }
    }
  }
}