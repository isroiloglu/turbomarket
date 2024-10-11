import 'package:equatable/equatable.dart';

import '../../../Models/StoreSelectionModels/storeFronts.dart';

abstract class StoreSelectionScreenEvents extends Equatable{
 const StoreSelectionScreenEvents();

 @override
 List<Object> get props => [];
}

class StoreSelectionScreenFetchEvent extends StoreSelectionScreenEvents{

}

class StoreSelectionLoadingEvent extends StoreSelectionScreenEvents{
 StoreFront? selectedStoreFront;

 StoreSelectionLoadingEvent(this.selectedStoreFront);


}