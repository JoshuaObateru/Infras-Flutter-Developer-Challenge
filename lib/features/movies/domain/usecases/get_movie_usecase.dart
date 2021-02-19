import 'package:dartz/dartz.dart';
import 'package:infras_flutter_developer_challenge/core/failures/failures.dart';
import 'package:infras_flutter_developer_challenge/features/movies/data/repositories/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase({this.repository});

  Future<Either<Failures, dynamic>> call() async {
    return await repository.getMovies();
  }
}
