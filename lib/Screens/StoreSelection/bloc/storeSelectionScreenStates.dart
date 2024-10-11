import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeSelectionResponse.dart';

import '../../../Models/StoreSelectionModels/storeFronts.dart';

abstract class StoreSelectionScreenStates extends Equatable{

  const StoreSelectionScreenStates();

  @override
  List<Object> get props => [];

}

class StoreSelectionScreenInitialState extends StoreSelectionScreenStates{

}


class StoreSelectionScreenSuccessState extends StoreSelectionScreenStates{

  StoreSelectionResponse? selectionResponse;

  StoreSelectionScreenSuccessState(this.selectionResponse);

}

class StoreSelectionScreenErrorState extends StoreSelectionScreenStates{
  StoreSelectionScreenErrorState(this._message);

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

class StoreSelectionCompleteState extends StoreSelectionScreenStates{
  StoreFront? selectedStoreFront;
  StoreSelectionCompleteState(this.selectedStoreFront);
}

class StoreSelectionScreenEmptyState extends StoreSelectionScreenStates{

}