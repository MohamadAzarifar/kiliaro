import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:kiliaro_test_album/features/test_album/domain/usecases/fetch_media_from_server_usecase.dart';
import 'package:kiliaro_test_album/features/test_album/domain/usecases/get_media_list_usecase.dart';

import '../core/network/api_client.dart';
import '../core/network/network_info.dart';
import '../features/test_album/data/datasources/shared_media_local_data_source.dart';
import '../features/test_album/data/datasources/shared_media_remote_data_source.dart';
import '../features/test_album/data/repositories/shared_media_repository_impl.dart';
import '../features/test_album/domain/repositories/shared_media_repository.dart';
import '../features/test_album/presentation/bloc/bloc/shared_album_bloc.dart';

final di = GetIt.I;

Future init() async {
  //! Features - test album

  //DataSources
  di.registerLazySingleton<SharedMediaRemoteDataSource>(
      () => SharedMediaRemoteDataSourceImpl(di()));
  di.registerLazySingleton<SharedMediaLocalDataSource>(
      () => SharedMediaLocalDataSourceImpl());

  //Repositories
  di.registerLazySingleton<SharedMediaRepository>(() =>
      SharedMediaRepositoryImpl(
          remoteDataSource: di(), localDataSource: di(), networkInfo: di()));

  //UseCases
  di.registerLazySingleton<GetMediaListUseCase>(
      () => GetMediaListUseCase(di()));
  di.registerLazySingleton<FetchMediaFromServerUseCase>(
      () => FetchMediaFromServerUseCase(di()));

  //BLoC
  di.registerFactory(() => SharedAlbumBloc(
        getMediaListUseCase: di(),
        fetchMediaFromServerUseCase: di(),
      ));

  //! Core

  //Network
  di.registerLazySingleton<Client>(() => Client());
  di.registerLazySingleton<ApiClient>(() => ApiClient(di()));
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
