import '../../domain/entities/media_entity.dart';

enum MediaModelKeys { id, fileName, size, thumbnailUrl, downloadUrl, createdAt }

extension _MediaModelKeysExtension on MediaModelKeys {
  String get key {
    switch (this) {
      case MediaModelKeys.id:
        return 'id';
      case MediaModelKeys.fileName:
        return 'filename';
      case MediaModelKeys.size:
        return 'size';
      case MediaModelKeys.createdAt:
        return 'created_at';
      case MediaModelKeys.thumbnailUrl:
        return 'thumbnail_url';
      case MediaModelKeys.downloadUrl:
        return 'download_url';
    }
  }
}

class MediaModel extends MediaEntity {
  const MediaModel({
    required String id,
    required String fileName,
    required int size,
    required String thumbnailUrl,
    required String downloadUrl,
    required DateTime createdAt,
  }) : super(
          id: id,
          fileName: fileName,
          size: size,
          thumbnailUrl: thumbnailUrl,
          downloadUrl: downloadUrl,
          createdAt: createdAt,
        );

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        id: json[MediaModelKeys.id.key],
        fileName: json[MediaModelKeys.fileName.key] ?? '',
        size: (json[MediaModelKeys.size.key] as num).toInt(),
        thumbnailUrl: json[MediaModelKeys.thumbnailUrl.key],
        downloadUrl: json[MediaModelKeys.downloadUrl.key],
        createdAt: DateTime.parse(json[MediaModelKeys.createdAt.key]),
      );

  Map<String, dynamic> toJson() => {
        MediaModelKeys.id.key: id,
        MediaModelKeys.fileName.key: fileName,
        MediaModelKeys.size.key: size,
        MediaModelKeys.thumbnailUrl.key: thumbnailUrl,
        MediaModelKeys.downloadUrl.key: downloadUrl,
        MediaModelKeys.createdAt.key: createdAt,
      };
}
