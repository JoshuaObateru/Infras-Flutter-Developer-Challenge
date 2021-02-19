part of 'get_movies_bloc.dart';

abstract class GetMoviesState extends Equatable {
  const GetMoviesState();

  @override
  List<Object> get props => [];
}

class GetMoviesInitial extends GetMoviesState {}

class GetMoviesLoading extends GetMoviesState {}

class GetMoviesLoaded extends GetMoviesState {
  final List<FilmModel> movies;
  const GetMoviesLoaded({
    this.movies,
  });
  @override
  List<Object> get props => [
        movies,
      ];
}

class GetMoviesError extends GetMoviesState {
  final String message;
  const GetMoviesError({this.message});
  @override
  List<Object> get props => [message];
}
