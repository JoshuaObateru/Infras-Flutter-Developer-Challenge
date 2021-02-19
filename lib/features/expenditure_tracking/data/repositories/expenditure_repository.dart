import 'package:infras_flutter_developer_challenge/core/exceptions/exceptions.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/datasource/expenditure_local_datasource.dart';

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:infras_flutter_developer_challenge/core/failures/failures.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/models/expense_model.dart';

class ExpenditureRepository {
  final ExpenditureLocalDatasource datasource;

  ExpenditureRepository({this.datasource});

  @override
  Future<Either<Failures, String>> addExpense(ExpenseModel expense) async {
    try {
      return Right(await datasource.addExpense(expense));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, dynamic>> getExpenses() async {
    try {
      return Right(await datasource.getExpenses());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
