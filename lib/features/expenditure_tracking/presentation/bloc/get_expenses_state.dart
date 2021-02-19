part of 'get_expenses_bloc.dart';

abstract class GetExpensesState extends Equatable {
  const GetExpensesState();

  @override
  List<Object> get props => [];
}

class GetExpensesInitial extends GetExpensesState {}

class GetExpensesLoading extends GetExpensesState {}

class GetExpensesLoaded extends GetExpensesState {
  final List<ExpenseModel> expenses;
  const GetExpensesLoaded({
    this.expenses,
  });
  @override
  List<Object> get props => [
        expenses,
      ];
}

class GetExpensesError extends GetExpensesState {
  final String message;
  const GetExpensesError({this.message});
  @override
  List<Object> get props => [message];
}
