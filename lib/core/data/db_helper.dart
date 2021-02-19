import 'package:dartz/dartz.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/models/expense_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'infrasChallenge.db'),
        onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE expenses(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            amount  integer,
            item text,
            transactionDate text
            
          )
        ''');
    }, version: 1);
  }

  // add expenses to the local database
  Future<int> addExpense(ExpenseModel expense) async {
    final db = await database;
    // final result = await db.delete("expenses");
    int res = await db.insert('expenses', expense.toJson());

    return res;
  }

//this return list of Expenses from the local db sqflite
  Future<List<ExpenseModel>> getExpenses() async {
    final db = await database;

    List<Map<String, dynamic>> result =
        await db.query('expenses', orderBy: "transactionDate DESC");

    // List<ExpenseModel> expenses = [];
    // if (result.length > 0) {
    //   for (int i = 0; i < result.length; i++) {
    //     expenses.add(ExpenseModel.fromJson(result[i]));
    //   }
    // }
    print(result);
    return ExpenseModel.expenseModelsParser(result);
  }

  Future<bool> deleteExpenses() async {
    final db = await database;

    await db.delete('expenses');

    return true;
  }
}
