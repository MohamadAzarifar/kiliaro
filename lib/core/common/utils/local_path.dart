import 'package:path_provider/path_provider.dart' as path_provider;

class LocalPath {
  LocalPath._();
  static Future<String> pathAppDocumentDirectory() async {
    final document = await path_provider.getApplicationSupportDirectory();
    return document.path;
  }
}
