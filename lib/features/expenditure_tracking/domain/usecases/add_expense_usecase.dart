import 'package:dartz/dartz.dart';
import 'package:infras_flutter_developer_challenge/core/failures/failures.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/models/expense_model.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/repositories/expenditure_repository.dart';

class AddExpenseUseCase {
  final ExpenditureRepository repository;

  AddExpenseUseCase({this.repository});

  Future<Either<Failures, String>> call(ExpenseModel expense) async {
    return await repository.addExpense(expense);
  }
}
