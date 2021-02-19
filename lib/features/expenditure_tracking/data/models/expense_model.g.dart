// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) {
  return ExpenseModel(
    id: json['id'] as int,
    amount: json['amount'] as int,
    item: json['item'] as String,
    transactionDate: json['transactionDate'] as String,
  );
}

Map<String, dynamic> _$ExpenseModelToJson(ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'item': instance.item,
      'transactionDate': instance.transactionDate,
    };
