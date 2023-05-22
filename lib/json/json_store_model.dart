import 'dart:convert';

import 'package:demo/json/term_data_backup_model.dart';

import 'file_manager_model.dart';


class JsonStoreModel {
  static JsonStoreModel? _instance;

  factory JsonStoreModel() {
    return _instance ??= JsonStoreModel._();
  }

  JsonStoreModel._();

  Future<bool> getSettingFlag() async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    return data.settingFlag;
  }

  Future<void> setSettingFlag({bool value = false}) async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    data.settingFlag = value;
    await FileManagerModel().writeJsonFile(jsonEncode(data.toJson()));
  }

  Future<bool> getRegistrationFlag() async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    return data.registFlag;
  }

  Future<void> setRegistrationFlag({bool value = false}) async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    data.registFlag = value;
    await FileManagerModel().writeJsonFile(jsonEncode(data.toJson()));
  }

  Future<String?> getServiceId() async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    return data.sServiceID;
  }

  Future<void> setServiceId(String? value) async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    data.sServiceID = value;
    await FileManagerModel().writeJsonFile(jsonEncode(data.toJson()));
  }

  Future<String?> getTermSetupAuth() async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    return data.termSetupAuth;
  }

  Future<void> setTermSetupAuth({String? value}) async {
    TermDataBackupModel data = TermDataBackupModel.fromJson(
      (await FileManagerModel().readJsonFile())!,
    );

    data.termSetupAuth = value;
    await FileManagerModel().writeJsonFile(jsonEncode(data.toJson()));
  }
}
