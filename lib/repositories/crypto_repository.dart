import '../data/crypto_datasource.dart';
import '../models/crypto_model.dart';

class CryptoRepository {
  final CryptoDataSource _dataSource;

  CryptoRepository(this._dataSource);

  Future<List<CryptoModel>> getCryptosBySymbols(String symbols) async {
    return await _dataSource.fetchCryptosBySymbols(symbols);
  }
}
