import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/media_entity.dart';
import '../repositories/shared_media_repository.dart';

class FetchMediaFromServerUseCase
    implements UseCase<List<MediaEntity>, FetchMediaFromServerUseCaseParams> {
  final SharedMediaRepository repository;

  FetchMediaFromServerUseCase(this.repository);

  @override
  Future<Either<Failure, List<MediaEntity>>> call(
          FetchMediaFromServerUseCaseParams params) async =>
      await repository.fetchMediaListFromServer();
}

class FetchMediaFromServerUseCaseParams extends Equatable {
  @override
  List<Object?> get props => [];
}
