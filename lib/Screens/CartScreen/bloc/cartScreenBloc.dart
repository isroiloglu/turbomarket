import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Helper/storageHelper.dart';
import 'cartScreenEvents.dart';
import 'cartScreenRepository.dart';
import 'cartScreenStates.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenRepository repository;

  CartScreenBloc({required this.repository}) : super(CartScreenInitial()) {
    on<CartScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      CartScreenEvent event,
      Emitter<CartScreenState> emit,
      ) async {
    switch (event.runtimeType) {
      case CartScreenDataFetchEvent:
        try {
          var model = await repository?.getCartData((event as CartScreenDataFetchEvent).request);
          if (model != null) {
            emit(CartScreenSuccess(model));
          } else {
            emit(CartScreenError(""));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;

      case CartScreenRemoveItemEvent:
        try {
          var model = await repository?.removeItemFromCart(
              (event as CartScreenRemoveItemEvent).request);
          if (model != null) {
            emit(RemoveCartItemSuccess(model));
          } else {
            emit(CartScreenError(""));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;

      case CartScreenRemoveEvent:
        try {
          var model = await repository?.removeCart(
              (event as CartScreenRemoveEvent).request);
          if (model != null) {
            emit(RemoveCartSuccess(model));
          } else {
            emit(CartScreenError(""));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;

      case ManageVoucherEvent:
        try {
          var model = await repository.manageVoucher(
              (event as ManageVoucherEvent).applyCoupon);
          if (model != null&& model.success==true) {
            emit(ApplyVoucherSuccess(model));
          } else {
            var set= storageController.getGiftCode();
            set.remove((event as ManageVoucherEvent).voucher);
            storageController.setGiftCode(set);
            emit(ApplyVoucherError(model?.message??""));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;

      case CartScreenUpdateQtyEvent:
        try {
          var model = await repository?.updateCartData((event as CartScreenUpdateQtyEvent).values,(event as CartScreenUpdateQtyEvent).customerId );
          if (model != null) {
            emit(UpdateCartSuccess(model));
          } else {
            emit(CartScreenError(''));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;

      case RemoveVoucherEvent:
        try {
          var model = await repository?.updateCartData((event as RemoveVoucherEvent).values,(event as RemoveVoucherEvent).customerId );
          if (model != null) {
            emit(UpdateCartSuccess(model));
          } else {
            emit(CartScreenError(''));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;
      case CartQuantityIncreaseEvent:
        try {
          var qty = repository.increaseQty((event as CartQuantityIncreaseEvent).qty);
          emit(QuantityEvent(qty));
        } catch (error, _) {
          print(error.toString());
          emit(CartScreenError(error.toString()));
        }
        break;
      case CartQuantityDecreaseEvent:
        try {
          var qty = repository.decreaseQty((event as CartQuantityDecreaseEvent).qty);
          emit(QuantityEvent(qty));
        } catch (error, _) {
          print(error.toString());
          emit(CartScreenError(error.toString()));
        }
        break;
      case ReloadCartEvent:
        emit(LoadingState());
        try {
          var model = await repository.updateCartData((event as ReloadCartEvent).value,(event).customerId );
          if (model != null) {
            emit(CartUpdateState(model));
          } else {
            emit(CartScreenError(''));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;
      case ApplyRewardPointEvent:
        emit(LoadingState());
        try {
          var model = await repository.applyRewardPoint((event as ApplyRewardPointEvent).request,);
          if (model != null) {

            if(model.success ?? false){
              storageController.setUsedPoint((model.cart?.pointsInUse ?? '').toString());
              emit(CartUpdateState(model));
            }

          } else {
            emit(CartScreenError(''));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;

      case RemovePointEvent:
        emit(LoadingState());
        try {
          var model = await repository.deletePoints((event as RemovePointEvent).request);
          if (model != null) {

            if(model.success ?? false){
              storageController.setUsedPoint((model.cart?.pointsInUse ?? '').toString());
              emit(CartUpdateState(model));
            }

          } else {
            emit(CartScreenError(''));
          }
        } catch (error, stack) {
          print(stack.toString());
          emit(CartScreenError(error.toString()));
        }
        break;
      default:
        break;
    }
  }
}