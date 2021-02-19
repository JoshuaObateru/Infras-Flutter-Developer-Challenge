import 'package:dartz/dartz.dart';
import 'package:infras_flutter_developer_challenge/core/failures/failures.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/repositories/expenditure_repository.dart';

class GetExpensesUseCase {
  final ExpenditureRepository repository;

  GetExpensesUseCase({this.repository});

  Future<Either<Failures, dynamic>> call() async {
    return await repository.getExpenses();
  }
}
