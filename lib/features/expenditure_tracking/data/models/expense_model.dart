import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'expense_model.g.dart';

@JsonSerializable()
class ExpenseModel {
  final int id;
  final int amount;
  final String item;
  final String transactionDate;

  ExpenseModel({this.id, this.amount, this.item, this.transactionDate});

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);

  static List<ExpenseModel> expenseModelsParser(
          List<Map<String, dynamic>> response) =>
      response.map((token) => ExpenseModel.fromJson(token)).toList();
}
