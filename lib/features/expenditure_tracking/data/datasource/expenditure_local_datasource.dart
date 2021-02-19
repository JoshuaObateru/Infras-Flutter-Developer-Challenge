import 'package:infras_flutter_developer_challenge/core/data/db_helper.dart';
import 'package:infras_flutter_developer_challenge/core/exceptions/exceptions.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/models/expense_model.dart';

class ExpenditureLocalDatasource {
  final DBHelper expensesDB;

  ExpenditureLocalDatasource({this.expensesDB});

  @override
  Future<String> addExpense(ExpenseModel expense) async {
    try {
      await expensesDB.addExpense(expense);
      return 'Successful';
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    final expenses = await expensesDB.getExpenses();
    if (expenses.length > 0) {
      return expenses;
    } else {
      throw CacheException(message: 'No item found');
    }
  }
}
