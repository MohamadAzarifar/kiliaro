import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiliaro_test_album/features/test_album/domain/usecases/fetch_media_from_server_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/media_entity.dart';
import '../../../domain/usecases/get_media_list_usecase.dart';

part 'shared_album_event.dart';
part 'shared_album_state.dart';

class SharedAlbumBloc extends Bloc<SharedAlbumEvent, SharedAlbumState> {
  final GetMediaListUseCase _getMediaListUseCase;
  final FetchMediaFromServerUseCase _fetchMediaFromServerUseCase;

  SharedAlbumBloc(
      {required GetMediaListUseCase getMediaListUseCase,
      required FetchMediaFromServerUseCase fetchMediaFromServerUseCase})
      : _getMediaListUseCase = getMediaListUseCase,
        _fetchMediaFromServerUseCase = fetchMediaFromServerUseCase,
        super(const SharedAlbumState()) {
    on<SharedAlbumGetEvent>(_onGetEvent);
    on<SharedAlbumRefreshEvent>(_onRefreshEvent);
  }

  _onGetEvent(SharedAlbumEvent event, Emitter<SharedAlbumState> emit) async {
    try {
      if (state.status == SharedAlbumStatus.initial) {
        final album =
            await _getMediaListUseCase.call(GetMediaListUseCaseParams());
        album.fold(
          (onFailure) => emit(state.failureState(failure: onFailure)),
          (album) => emit(state.successState(album: album)),
        );
      }
    } catch (error) {
      emit(state.failureState(failure: error as Failure));
    }
  }

  _onRefreshEvent(
      SharedAlbumEvent event, Emitter<SharedAlbumState> emit) async {
    try {
      final album = await _fetchMediaFromServerUseCase
          .call(FetchMediaFromServerUseCaseParams());
      album.fold((onFailure) => emit(state.failureState(failure: onFailure)),
          (album) => emit(state.successState(album: album)));
    } catch (error) {
      emit(state.failureState(failure: error as Failure));
    }
  }
}
