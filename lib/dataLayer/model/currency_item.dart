import 'package:json_annotation/json_annotation.dart';

part 'currency_item.g.dart';

@JsonSerializable()
class CurrencyItem {
  @JsonKey(defaultValue: "", name: "title")
  String title;

  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "cb_price")
  String cbPrice;

  @JsonKey(defaultValue: "", name: "nbu_buy_price")
  String buyPrice;

  @JsonKey(defaultValue: "", name: "nbu_cell_price")
  String cellPrice;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  CurrencyItem({
    required this.title,
    required this.code,
    required this.cbPrice,
    required this.buyPrice,
    required this.cellPrice,
    required this.date,
  });

  factory CurrencyItem.fromJson(Map<String, dynamic> json) => _$CurrencyItemFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyItemToJson(this);
}
