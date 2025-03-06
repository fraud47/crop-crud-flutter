import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> writeAccessToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  Future<String?> readAccessToken() async {
    return await storage.read(key: 'access_token');
  }

  Future<void> writeRefreshToken(String token) async {
    await storage.write(key: 'refresh_token', value: token);
  }

  Future<String?> readRefreshToken() async {
    return await storage.read(key: 'refresh_token');
  }

// You can add methods for deleting tokens or checking their presence if needed
}