import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/models/expense_model.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/domain/usecases/add_expense_usecase.dart';

part 'add_expense_event.dart';
part 'add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final AddExpenseUseCase addExpenseUseCase;
  AddExpenseBloc({this.addExpenseUseCase});

  @override
  AddExpenseState get initialState => AddExpenseInitial();

  @override
  Stream<AddExpenseState> mapEventToState(
    AddExpenseEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetAddExpenseEvent) {
      yield AddExpenseLoading();
      final result = await addExpenseUseCase(event.expense);
      yield result.fold((error) => AddExpenseError(message: error.message),
          (response) => AddExpenseLoaded(addExpenseMessage: response));
    }
  }
}
