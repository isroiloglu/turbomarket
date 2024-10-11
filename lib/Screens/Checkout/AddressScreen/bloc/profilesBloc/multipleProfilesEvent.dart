import '../../../../../Models/AccountModels/Request/createProfileRequest.dart';
import '../../../../../Models/CheckoutModels/LoginUser/Request/updateProfileCheckoutRequest.dart';

abstract class MultipleProfileEvents {}

class MultipleProfileFetchEvent extends MultipleProfileEvents {

  MultipleProfileFetchEvent();
  @override
  List<Object> get props => [];
}

class MultipleProfileReload extends MultipleProfileEvents {

  MultipleProfileReload();
  @override
  List<Object> get props => [];
}

class MultipleProfileAddProfileEvent extends MultipleProfileEvents{
  CreateProfileRequest request;
  MultipleProfileAddProfileEvent(this.request);

  @override
  List<Object?> get props => [];
}

class MultipleProfileUpdateProfileEvent extends MultipleProfileEvents{
  UpdateProfileCheckoutRequest request;
  MultipleProfileUpdateProfileEvent(this.request);

  @override
  List<Object?> get props => [];
}



