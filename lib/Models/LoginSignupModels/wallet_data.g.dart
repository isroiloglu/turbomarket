// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletData _$WalletDataFromJson(Map<String, dynamic> json) => WalletData(
      enableWalletTransfer: json['enable_wallet_transfer'] as String?,
      walletAmount: json['wallet_amount'],
      formatWalletAmount: json['format_wallet_amount'] as String?,
      addWalletMoney: json['addWalletMoney'] as String?,
    );

Map<String, dynamic> _$WalletDataToJson(WalletData instance) =>
    <String, dynamic>{
      'enable_wallet_transfer': instance.enableWalletTransfer,
      'wallet_amount': instance.walletAmount,
      'format_wallet_amount': instance.formatWalletAmount,
      'addWalletMoney': instance.addWalletMoney,
    };
