part of 'get_expenses_bloc.dart';

abstract class GetExpensesState extends Equatable {
  const GetExpensesState();

  @override
  List<Object> get props => [];
}

class GetExpensesInitial extends GetExpensesState {}

class GetExpensesLoading extends GetExpensesState {}

class GetExpensesLoaded extends GetExpensesState {
  // final List<ExpenseModel> expenses;
  final Map<String, dynamic> response;
  const GetExpensesLoaded({
    this.response,
  });
  @override
  List<Object> get props => [
        response,
      ];
}

class GetExpensesError extends GetExpensesState {
  final String message;
  const GetExpensesError({this.message});
  @override
  List<Object> get props => [message];
}
