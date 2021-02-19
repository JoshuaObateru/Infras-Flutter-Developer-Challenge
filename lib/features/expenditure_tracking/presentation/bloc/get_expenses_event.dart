part of 'get_expenses_bloc.dart';

abstract class GetExpensesEvent extends Equatable {
  const GetExpensesEvent();

  @override
  List<Object> get props => [];
}

class ShowAllExpensesEvent extends GetExpensesEvent {}
