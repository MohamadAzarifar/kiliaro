import 'package:dartz/dartz.dart';
import 'package:kiliaro_test_album/features/test_album/data/tables/media/media_table.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/media_entity.dart';
import '../../domain/repositories/shared_media_repository.dart';
import '../datasources/shared_media_local_data_source.dart';
import '../datasources/shared_media_remote_data_source.dart';

class SharedMediaRepositoryImpl implements SharedMediaRepository {
  final SharedMediaRemoteDataSource remoteDataSource;
  final SharedMediaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  SharedMediaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<MediaEntity>>> fetchMediaListFromServer() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteList = await remoteDataSource.getSharedMediaList();
        await localDataSource.updateCachedList(remoteList
            .map((model) => MediaTable.fromMediaModel(model))
            .toList());
        return Right(remoteList);
      } on ServerException {
        return const Left(ServerFailure(type: ServerFailureType.response));
      } on CacheException {
        return Left(CacheFailure());
      } on Exception {
        return const Left(ServerFailure(type: ServerFailureType.unknown));
      }
    } else {
      return const Left(ServerFailure(type: ServerFailureType.connection));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getMediaList() async {
    try {
      final localList = await localDataSource.getCachedList();
      if (localList.isEmpty) {
        final remoteList = await fetchMediaListFromServer();
        return remoteList;
      } else {
        return Right(localList);
      }
    } on CacheException {
      return Left(CacheFailure());
    } on Exception {
      return const Left(ServerFailure(type: ServerFailureType.unknown));
    }
  }
}
