import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/media_entity.dart';
import '../repositories/shared_media_repository.dart';

class GetMediaListUseCase
    implements UseCase<List<MediaEntity>, GetMediaListUseCaseParams> {
  final SharedMediaRepository repository;

  GetMediaListUseCase(this.repository);

  @override
  Future<Either<Failure, List<MediaEntity>>> call(
          GetMediaListUseCaseParams params) async =>
      await repository.getMediaList();
}

class GetMediaListUseCaseParams extends Equatable {
  @override
  List<Object?> get props => [];
}
