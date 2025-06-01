import 'package:flutter/material.dart';
import '../models/crypto_model.dart';
import '../repositories/crypto_repository.dart';

class CryptoListViewModel extends ChangeNotifier {
  final CryptoRepository _repository;

  List<CryptoModel> cryptos = [];
  bool isLoading = false;
  String errorMessage = '';

  CryptoListViewModel(this._repository);

  static const String _defaultSymbols = 'BTC,ETH,SOL,BNB,BCH,MKR,AAVE,DOT,SUI,ADA,XRP,TIA,NEO,NEAR,PENDLE,RENDER,LINK,TON,XAI,SEI,IMX,ETHFI,UMA,SUPER,FET,USUAL,GALA,PAAL,AERO';

  Future<void> fetchCryptos({String? symbols}) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      final query = (symbols == null || symbols.trim().isEmpty)
          ? _defaultSymbols
          : symbols;

      cryptos = await _repository.getCryptosBySymbols(query);
    } catch (e) {
      errorMessage = 'Erro ao carregar criptomoedas.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
