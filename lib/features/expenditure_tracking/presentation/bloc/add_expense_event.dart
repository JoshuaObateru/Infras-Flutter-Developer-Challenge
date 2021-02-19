part of 'add_expense_bloc.dart';

abstract class AddExpenseEvent extends Equatable {
  const AddExpenseEvent();

  @override
  List<Object> get props => [];
}

class GetAddExpenseEvent extends AddExpenseEvent {
  final ExpenseModel expense;
  const GetAddExpenseEvent({this.expense});
  @override
  List<Object> get props => [expense];
}
