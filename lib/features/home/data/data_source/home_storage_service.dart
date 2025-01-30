import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petadoption/core/constants/constants.dart';

class HomeStorageService {
  FlutterSecureStorage fss;
  HomeStorageService(this.fss);
  Future<List<String>> getAccount() async {
    final token = await fss.read(key: storageToken);
    final type_token = await fss.read(key: storageTypeToken);
    if (token == null && type_token == null) {
      return [];
    } else {
      return [token!, type_token!];
    }
  }
}
