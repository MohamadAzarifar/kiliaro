import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';
import '../models/media_model.dart';

abstract class SharedMediaRemoteDataSource {
  /// Calls the /shared/{sharedKey}/media endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MediaModel>> getSharedMediaList();
}

class SharedMediaRemoteDataSourceImpl extends SharedMediaRemoteDataSource {
  final ApiClient _client;

  SharedMediaRemoteDataSourceImpl(this._client);

  @override
  Future<List<MediaModel>> getSharedMediaList() async {
    const path = 'shared/${ApiConstants.key}/media';
    final response = await _client.get(path) as List;
    return response.map((e) => MediaModel.fromJson(e)).toList(growable: false);
  }
}
