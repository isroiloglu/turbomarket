import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/createProfileRequest.dart';

import '../../../Models/AccountModels/Request/updateProfileRequest.dart';

abstract class AccountScreenEvents extends Equatable{

}

class AccountScreenFetchEvent extends AccountScreenEvents{
  @override
  List<Object?> get props => [];

}

class AccountScreenReloadEvent extends AccountScreenEvents{
  @override
  List<Object?> get props => [];

}

class AccountScreenAddProfileEvent extends AccountScreenEvents{
  CreateProfileRequest request;
  AccountScreenAddProfileEvent(this.request);

  @override
  List<Object?> get props => [];
}

class AccountScreenDeleteProfileEvent extends AccountScreenEvents{
  String profileId;

  AccountScreenDeleteProfileEvent(this.profileId);
  @override
  List<Object?> get props => [];
}

class AccountScreenUpdateProfile extends AccountScreenEvents{
  String profileId;
  UpdateProfileRequest updateProfileRequest;
  AccountScreenUpdateProfile(this.profileId,this.updateProfileRequest);
  @override
  List<Object?> get props => [];
}

class AccountScreenSaveEvent extends AccountScreenEvents{
  @override
  List<Object?> get props => [];

}

class AccountLoginEvent extends AccountScreenEvents {
  AccountLoginEvent(this.userId,this.userPassword);

  final String userId;
  final String userPassword;

  @override
  List<Object> get props => [userId,userPassword];
}
class AccountDeleteEvent extends AccountScreenEvents{

  final String customerId;


  AccountDeleteEvent(this.customerId);

  @override
  List<Object> get props => [];
}