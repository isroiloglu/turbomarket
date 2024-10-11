import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/accountDetailResponse.dart';

import '../../../Models/LoginSignupModels/login_response.dart';
import '../../../Models/baseResponse/base_response.dart';

abstract class AccountScreenState extends Equatable{

}

class AccountScreenInitialState extends AccountScreenState{
  @override
  List<Object?> get props => [];

}

class AccountScreenSuccessState extends AccountScreenState{
  AccountDetailResponse? accountDetailResponse;

  AccountScreenSuccessState(this.accountDetailResponse);

  @override
  List<Object?> get props => [];

}

class AccountScreenReloadState extends AccountScreenState{
  AccountDetailResponse? accountDetailResponse;

  AccountScreenReloadState(this.accountDetailResponse);

  @override
  List<Object?> get props => [];

}

class AccountScreenProfileSuccessState extends AccountScreenState{
  BaseResponse baseResponse;

  AccountScreenProfileSuccessState(this.baseResponse);

  @override
  List<Object?> get props => [];
}

class AccountScreenErrorState extends AccountScreenState{
  AccountScreenErrorState(this._message);
  String? _message;
  String? get message => _message;
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class AccountScreenEmptyState extends AccountScreenState{
  @override
  List<Object?> get props => [];

}
class AccountLoginState extends AccountScreenState {
  AccountLoginState(this.data);

  final LoginResponse data;

  @override
  List<Object> get props => [data];
}

class DeleteAccountSuccess extends AccountScreenState{
  BaseResponse? baseResponse;

  DeleteAccountSuccess(this.baseResponse);

   @override
   List<Object> get props => [];
 }

