import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '../entities/media_entity.dart';

abstract class SharedMediaRepository {
  Future<Either<Failure, List<MediaEntity>>> fetchMediaListFromServer();
  Future<Either<Failure, List<MediaEntity>>> getMediaList();
}
