import 'package:equatable/equatable.dart';
import 'package:kiliaro_test_album/core/presentation/messages.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

enum ServerFailureType { connection, response, unknown }

class ServerFailure extends Failure {
  final ServerFailureType type;

  const ServerFailure({required this.type});
  @override
  List<Object?> get props => [type];

  @override
  String toString() {
    switch (type) {
      case ServerFailureType.connection:
        return Messages.serverConnectionFailure;
      case ServerFailureType.response:
        return Messages.serverResponseFailure;
      case ServerFailureType.unknown:
        return Messages.serverUnknownFailure;
    }
  }
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return Messages.cacheFailure;
  }
}
