// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyItem _$CurrencyItemFromJson(Map<String, dynamic> json) => CurrencyItem(
      title: json['title'] as String? ?? '',
      code: json['code'] as String? ?? '',
      cbPrice: json['cb_price'] as String? ?? '',
      buyPrice: json['nbu_buy_price'] as String? ?? '',
      cellPrice: json['nbu_cell_price'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );

Map<String, dynamic> _$CurrencyItemToJson(CurrencyItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'cb_price': instance.cbPrice,
      'nbu_buy_price': instance.buyPrice,
      'nbu_cell_price': instance.cellPrice,
      'date': instance.date,
    };
