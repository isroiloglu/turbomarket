import 'package:equatable/equatable.dart';
import '../../../../../Models/MultipleProfilesModel/response/multipleProfileResponse.dart';
import '../../../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../../../../../Models/baseResponse/base_response.dart';


abstract class MultipleProfileState extends Equatable {
  const MultipleProfileState();

  @override
  List<Object> get props => [];
}

class MultipleProfileInitialState extends MultipleProfileState{}

class MultipleProfileLoadingState extends MultipleProfileState{}
class MultipleProfileCompleteState extends MultipleProfileState{}

class MultipleProfileSuccessState extends MultipleProfileState{
  final MultipleProfilesResponse data;
  const MultipleProfileSuccessState(this.data);
}

class MultipleProfileReloadState extends MultipleProfileState{
  MultipleProfilesResponse? accountDetailResponse;
  MultipleProfileReloadState(this.accountDetailResponse);
}

class MultipleProfileSaveSuccessState extends MultipleProfileState{
  ShippingMethodModel shippingMethods;
  MultipleProfileSaveSuccessState(this.shippingMethods);

}

class MultipleProfileErrorState extends MultipleProfileState{
  final String message;
  const MultipleProfileErrorState(this.message);
}

class EmptyState extends MultipleProfileState{
  @override
  List<Object> get props => [];
}



