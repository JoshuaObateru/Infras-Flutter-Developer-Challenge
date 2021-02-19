import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infras_flutter_developer_challenge/features/movies/data/models/film_model.dart';
import 'package:infras_flutter_developer_challenge/features/movies/domain/usecases/get_movie_usecase.dart';

part 'get_movies_event.dart';
part 'get_movies_state.dart';

class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  GetMoviesBloc({this.getMoviesUseCase});

  @override
  GetMoviesState get initialState => GetMoviesInitial();
  @override
  Stream<GetMoviesState> mapEventToState(
    GetMoviesEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetMoviesListEvent) {
      yield GetMoviesLoading();
      final result = await getMoviesUseCase();
      yield result.fold((error) => GetMoviesError(message: error.message),
          (response) => GetMoviesLoaded(movies: response));
    }
  }
}
