import 'dart:core';

class TermDataBackupModel {
  // @SerializedName("sServiceID")
  String? sServiceID;

  // @SerializedName("registFlag")
  bool registFlag = false;

  // @SerializedName("settingFlag")
  bool settingFlag = false;

  // @SerializedName("serviceInfor")
  // var serviceInfor: IUnyou? = null;

  // @SerializedName("termSetupAuth")
  String? termSetupAuth;
  TermDataBackupModel({
    this.sServiceID,
    required this.registFlag,
    required this.settingFlag,
    this.termSetupAuth,
  });

  factory TermDataBackupModel.fromJson(Map<String, dynamic>? json) {
    return TermDataBackupModel(
      registFlag: json != null && json['registFlag'] != null
          ? (json['registFlag'] as bool)
          : false,
      settingFlag: json != null && json['settingFlag'] != null
          ? (json['settingFlag'] as bool)
          : false,
      sServiceID: json != null ? (json['sServiceID'].toString()) : null,
      termSetupAuth: json != null ? (json['termSetupAuth'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'sServiceID': sServiceID,
      'registFlag': registFlag,
      'settingFlag': settingFlag,
      'termSetupAuth': termSetupAuth,
    };
  }
}
