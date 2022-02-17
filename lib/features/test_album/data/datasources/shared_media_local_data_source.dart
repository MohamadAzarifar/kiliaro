import 'package:hive/hive.dart';
import 'package:kiliaro_test_album/core/error/exceptions.dart';
import 'package:kiliaro_test_album/features/test_album/data/tables/media/media_table.dart';

import '../models/media_model.dart';

abstract class SharedMediaLocalDataSource {
  /// Gets the cached list of [MediaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<MediaTable>> getCachedList();

  /// Update the cached list of [MediaModel] with new
  /// list from internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<void> updateCachedList(List<MediaTable> album);
}

class SharedMediaLocalDataSourceImpl extends SharedMediaLocalDataSource {
  final mediaBoxName = 'MediaBox';

  @override
  Future<List<MediaTable>> getCachedList() async {
    try {
      final mediaBox = await Hive.openBox(mediaBoxName);
      final mediaIds = mediaBox.keys;
      return mediaIds
          .map<MediaTable>((key) => mediaBox.get(key))
          .toList(growable: false);
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<void> updateCachedList(List<MediaTable> album) async {
    try {
      await _invalidateCachedList();
      final entries = {for (var media in album) media.id: media};
      final mediaBox = await Hive.openBox(mediaBoxName);
      await mediaBox.putAll(entries);
    } catch (_) {
      throw CacheException();
    }
  }

  Future<void> _invalidateCachedList() async {
    try {
      final mediaBox = await Hive.openBox(mediaBoxName);
      await mediaBox.deleteAll(mediaBox.keys);
    } catch (error) {
      throw CacheException();
    }
  }
}
