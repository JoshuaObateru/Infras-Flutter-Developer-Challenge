import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:infras_flutter_developer_challenge/core/data/db_helper.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/datasource/expenditure_local_datasource.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/repositories/expenditure_repository.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/domain/usecases/add_expense_usecase.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/domain/usecases/get_expenses_usecase.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/bloc/add_expense_bloc.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/bloc/get_expenses_bloc.dart';
import 'package:infras_flutter_developer_challenge/features/movies/data/datasources/movie_remote_datasource.dart';
import 'package:infras_flutter_developer_challenge/features/movies/data/repositories/movie_repository.dart';
import 'package:infras_flutter_developer_challenge/features/movies/domain/usecases/get_movie_usecase.dart';
import 'package:infras_flutter_developer_challenge/features/movies/presentation/bloc/get_movies_bloc.dart';

import 'core/network/network_info_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => AddExpenseBloc(
        addExpenseUseCase: sl(),
      ));
  sl.registerFactory(() => GetExpensesBloc(
        getExpensesUseCase: sl(),
      ));

  sl.registerFactory(() => GetMoviesBloc(
        getMoviesUseCase: sl(),
      ));

  sl.registerLazySingleton(() => AddExpenseUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetExpensesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetMoviesUseCase(repository: sl()));

  sl.registerLazySingleton(() => ExpenditureRepository(datasource: sl()));
  sl.registerLazySingleton(() => MovieRepository(datasource: sl()));

  // sl.registerLazySingleton(() => TestRepository(datasource: sl()));

  sl.registerLazySingleton(() => ExpenditureLocalDatasource(
        expensesDB: sl(),
      ));
  sl.registerLazySingleton(() => MovieRemoteDatasource(
        networkInfo: sl(),
        dio: sl(),
        client: sl(),
      ));

  final db = DBHelper.db;
  sl.registerLazySingleton(() => db);

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: sl()));

  // sl.registerLazySingleton(() => TestRemoteDatasource(
  //     client: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
