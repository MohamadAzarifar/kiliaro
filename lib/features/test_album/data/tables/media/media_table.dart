import 'package:hive/hive.dart';
import 'package:kiliaro_test_album/features/test_album/data/models/media_model.dart';
import 'package:kiliaro_test_album/features/test_album/domain/entities/media_entity.dart';

part 'media_table.g.dart';

@HiveType(typeId: 0)
class MediaTable extends MediaEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String fileName;

  @HiveField(2)
  final int size;

  @HiveField(3)
  final String thumbnailUrl;

  @HiveField(4)
  final String downloadUrl;

  @HiveField(5)
  final DateTime createdAt;

  const MediaTable({
    required this.id,
    required this.fileName,
    required this.size,
    required this.thumbnailUrl,
    required this.downloadUrl,
    required this.createdAt,
  }) : super(
          id: id,
          fileName: fileName,
          size: size,
          thumbnailUrl: thumbnailUrl,
          downloadUrl: downloadUrl,
          createdAt: createdAt,
        );

  factory MediaTable.fromMediaEntity(MediaEntity entity) => MediaTable(
        id: entity.id,
        fileName: entity.fileName,
        size: entity.size,
        thumbnailUrl: entity.thumbnailUrl,
        downloadUrl: entity.downloadUrl,
        createdAt: entity.createdAt,
      );

  factory MediaTable.fromMediaModel(MediaModel model) => MediaTable(
        id: model.id,
        fileName: model.fileName,
        size: model.size,
        thumbnailUrl: model.thumbnailUrl,
        downloadUrl: model.downloadUrl,
        createdAt: model.createdAt,
      );
}
