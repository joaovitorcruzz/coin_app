import 'package:dio/dio.dart';
import '../core/http_service.dart';
import '../models/crypto_model.dart';

class CryptoDataSource {
  final HttpService _httpService;

  CryptoDataSource(this._httpService);

  Future<List<CryptoModel>> fetchCryptosBySymbols(String symbols) async {
    try {
      // Requisição para USD
      final responseUSD = await _httpService.client.get(
        '/v1/cryptocurrency/quotes/latest',
        queryParameters: {'symbol': symbols, 'convert': 'USD'},
      );

      // Requisição para BRL
      final responseBRL = await _httpService.client.get(
        '/v1/cryptocurrency/quotes/latest',
        queryParameters: {'symbol': symbols, 'convert': 'BRL'},
      );

      final Map<String, dynamic> dataUSD = responseUSD.data['data'];
      final Map<String, dynamic> dataBRL = responseBRL.data['data'];

      List<CryptoModel> cryptos = [];

      for (final symbol in dataUSD.keys) {
        final usd = dataUSD[symbol];
        final brl = dataBRL[symbol];

        final crypto = CryptoModel(
          id: usd['id'],
          name: usd['name'],
          symbol: usd['symbol'],
          priceUSD: usd['quote']['USD']['price'].toDouble(),
          priceBRL: brl['quote']['BRL']['price'].toDouble(),
          percentChange24h:
              usd['quote']['USD']['percent_change_24h'].toDouble(),
        );

        cryptos.add(crypto);
      }

      return cryptos;
    } on DioException catch (e) {
      print('Erro ao buscar criptos: ${e.message}');
      throw Exception('Erro ao buscar criptomoedas.');
    }
  }
}
