import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/http_service.dart';
import 'data/crypto_datasource.dart';
import 'repositories/crypto_repository.dart';
import 'viewmodels/crypto_list_viewmodel.dart';
import 'views/crypto_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Instanciando as camadas necessárias
    final httpService = HttpService();
    final cryptoDataSource = CryptoDataSource(httpService);
    final cryptoRepository = CryptoRepository(cryptoDataSource);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CryptoListViewModel(cryptoRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Criptomoedas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CryptoListPage(),
      ),
    );
  }
}
