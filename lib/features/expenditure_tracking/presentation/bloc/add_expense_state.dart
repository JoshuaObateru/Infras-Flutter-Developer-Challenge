part of 'add_expense_bloc.dart';

abstract class AddExpenseState extends Equatable {
  const AddExpenseState();

  @override
  List<Object> get props => [];
}

class AddExpenseInitial extends AddExpenseState {}

class AddExpenseLoading extends AddExpenseState {}

class AddExpenseLoaded extends AddExpenseState {
  final String addExpenseMessage;
  const AddExpenseLoaded({
    this.addExpenseMessage,
  });
  @override
  List<Object> get props => [
        addExpenseMessage,
      ];
}

class AddExpenseError extends AddExpenseState {
  final String message;
  const AddExpenseError({this.message});
  @override
  List<Object> get props => [message];
}
