part of 'shared_album_bloc.dart';

enum SharedAlbumStatus { initial, success, failure }

class SharedAlbumState extends Equatable {
  final SharedAlbumStatus status;
  final List<MediaEntity> album;
  final Failure? failure;

  const SharedAlbumState({
    this.status = SharedAlbumStatus.initial,
    this.album = const <MediaEntity>[],
    this.failure,
  });

  SharedAlbumState successState({List<MediaEntity>? album}) => SharedAlbumState(
        status: SharedAlbumStatus.success,
        album: album ?? this.album,
        failure: null,
      );

  SharedAlbumState failureState({required Failure failure}) => SharedAlbumState(
      status: SharedAlbumStatus.failure, album: album, failure: failure);

  @override
  String toString() =>
      '''SharedAlbumState {status: $status, album count: ${album.length}}''';

  @override
  List<Object?> get props => [status, album];
}
