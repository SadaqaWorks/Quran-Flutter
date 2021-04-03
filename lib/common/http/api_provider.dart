import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<APIProvider>((ref) => APIProvider());

class APIProvider {
  late Dio _dio;
  APIProvider() {
    _dio = Dio();
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
  }

  Future<Map<String, dynamic>?> get(String url) async {
    try {
      var response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
