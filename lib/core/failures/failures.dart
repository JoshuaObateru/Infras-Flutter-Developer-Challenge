import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final String message;
  const Failures({this.message});
  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failures {
  final String message;
  const CacheFailure({this.message});

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failures {
  final String message;

  const NetworkFailure({this.message});

  @override
  List<Object> get props => [message];
}

class MovieFailure extends Failures {
  final String message;

  const MovieFailure({this.message});

  @override
  List<Object> get props => [message];
}
