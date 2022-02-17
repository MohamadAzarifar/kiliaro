import 'package:equatable/equatable.dart';

class MediaEntity extends Equatable {
  final String id;
  final String fileName;
  final int size;
  final String thumbnailUrl;
  final String downloadUrl;
  final DateTime createdAt;

  const MediaEntity({
    required this.id,
    required this.fileName,
    required this.size,
    required this.thumbnailUrl,
    required this.downloadUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, fileName];

  @override
  bool? get stringify => true;
}
