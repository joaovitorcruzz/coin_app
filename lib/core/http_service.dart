import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  static const String _baseUrl = 'https://pro-api.coinmarketcap.com';
  static const String _apiKey = 'SUA_API_KEY_AQUI';

  HttpService() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'Accepts': 'application/json',
        'X-CMC_PRO_API_KEY': _apiKey,
      },
    );

    _dio = Dio(options);
  }

  Dio get client => _dio;
}
