import 'dart:convert';
import 'dart:io';

class FileManagerModel {
  static FileManagerModel? _instance;

  /// Constructor
  FileManagerModel._();

  factory FileManagerModel() {
    return _instance ??= FileManagerModel._();
  }

  void destroyInstance() {
    //インスタンス破棄
    _instance = null;
  }

  Future<File> get _jsonFile async {
    Directory path = Directory('/storage/emulated/0/Android/data.json');

    return File(path.path);
  }

  Future<void> createJsonFile() async {
    File file = await _jsonFile;
    if (!file.existsSync()) {
      try {
        String initJsonData =
            '{"TermDataBackup":{"registFlag": false, "settingFlag": false}}';
        file.writeAsStringSync(initJsonData);
      } catch (e) {
      }
    }
  }

  Future<Map<String, dynamic>?> readJsonFile() async {
    File file = await _jsonFile;
    if (file.existsSync()) {
      try {
        final fileContent = file.readAsStringSync();

        return jsonDecode(fileContent) as Map<String, dynamic>;
      } catch (e) {
      }
    }

    return null;
  }

  Future<void> writeJsonFile(String data) async {
    File file = await _jsonFile;
    if (file.existsSync()) {
      try {
        file.writeAsStringSync(data);
      } catch (e) {
      }
    }
  }

  Future<void> deleteJsonFile() async {
    File file = await _jsonFile;
    if (file.existsSync()) {
      try {
        file.deleteSync();
      } catch (e) {
      }
    }
  }
}
