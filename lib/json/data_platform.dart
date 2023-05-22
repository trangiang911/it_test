import 'file_manager_model.dart';
import 'json_store_model.dart';

class DataPlatformModel {
  JsonStoreModel jsonStoreModel = JsonStoreModel();
  FileManagerModel fileManagerModel = FileManagerModel();

  Future<void> createJsonFile() => fileManagerModel.createJsonFile();

  Future<Map<String, dynamic>?> readJsonFile() =>
      fileManagerModel.readJsonFile();


}