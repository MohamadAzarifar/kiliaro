part of 'shared_album_bloc.dart';

abstract class SharedAlbumEvent extends Equatable {
  const SharedAlbumEvent();

  @override
  List<Object> get props => [];
}

class SharedAlbumGetEvent extends SharedAlbumEvent {}

class SharedAlbumRefreshEvent extends SharedAlbumEvent {}
