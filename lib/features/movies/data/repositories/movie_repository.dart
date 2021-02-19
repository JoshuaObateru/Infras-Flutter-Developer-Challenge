import 'package:dartz/dartz.dart';
import 'package:infras_flutter_developer_challenge/core/exceptions/exceptions.dart';
import 'package:infras_flutter_developer_challenge/core/failures/failures.dart';
import 'package:infras_flutter_developer_challenge/features/movies/data/datasources/movie_remote_datasource.dart';
import 'package:infras_flutter_developer_challenge/features/movies/data/models/film_model.dart';

class MovieRepository {
  final MovieRemoteDatasource datasource;

  MovieRepository({this.datasource});

  Future<Either<Failures, List<FilmModel>>> getMovies() async {
    try {
      return Right(await datasource.getMovies());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    } on MovieException catch (e) {
      return Left(MovieFailure(message: e.message));
    } catch (e) {
      return Left(MovieFailure(message: e.toString()));
    }
  }
}
