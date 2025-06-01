import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  static const String _baseUrl = 'https://pro-api.coinmarketcap.com';
  static const String _apiKey = '406cb1f3-0a44-4330-a966-f9c4585730d2';

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
