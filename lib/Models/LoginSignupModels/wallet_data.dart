import 'package:json_annotation/json_annotation.dart';

part 'wallet_data.g.dart';

@JsonSerializable()
class WalletData {
  @JsonKey(name:"enable_wallet_transfer")
  String? enableWalletTransfer;

  @JsonKey(name:"wallet_amount")
  Object? walletAmount;
  @JsonKey(name:"format_wallet_amount")
  String? formatWalletAmount;
  @JsonKey(name:"addWalletMoney")
  String? addWalletMoney;

  WalletData(
      {
        this.enableWalletTransfer,
        this.walletAmount,
        this.formatWalletAmount,this.addWalletMoney});

  factory WalletData.fromJson(Map<String, dynamic> json) =>
      _$WalletDataFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDataToJson(this);
}