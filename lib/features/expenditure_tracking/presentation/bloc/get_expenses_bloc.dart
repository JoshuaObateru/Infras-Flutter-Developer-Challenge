import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/models/expense_model.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/domain/usecases/get_expenses_usecase.dart';

part 'get_expenses_event.dart';
part 'get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
  final GetExpensesUseCase getExpensesUseCase;
  GetExpensesBloc({this.getExpensesUseCase});

  @override
  GetExpensesState get initialState => GetExpensesInitial();

  @override
  Stream<GetExpensesState> mapEventToState(
    GetExpensesEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is ShowAllExpensesEvent) {
      yield GetExpensesLoading();
      final result = await getExpensesUseCase();
      yield result.fold((error) => GetExpensesError(message: error.message),
          (response) => GetExpensesLoaded(expenses: response));
    }
  }
}
