import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  /// Request permissions for a single permission.
  Future<PermissionStatus> request(Permission permission) {
    return permission.request();
  }

  /// Check the status of a shouldShowRequestRationale [Permission]
  Future<bool> shouldShowRequestRationale(Permission permission) async {
    return permission.shouldShowRequestRationale;
  }
}
