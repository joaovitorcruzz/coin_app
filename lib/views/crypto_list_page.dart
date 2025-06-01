import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'crypto_detail_sheet.dart';
import '../viewmodels/crypto_list_viewmodel.dart';
import '../models/crypto_model.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({Key? key}) : super(key: key);

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<CryptoListViewModel>(context, listen: false).fetchCryptos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CryptoListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Criptomoedas'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Buscar por símbolos (ex: BTC,ETH)',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ElevatedButton(
              onPressed: () {
                viewModel.fetchCryptos(symbols: _controller.text);
              },
              child: const Text('Buscar'),
            ),
          ),

          if (viewModel.isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (viewModel.errorMessage.isNotEmpty)
            Expanded(child: Center(child: Text(viewModel.errorMessage)))
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh:
                    () => viewModel.fetchCryptos(symbols: _controller.text),
                child: ListView.builder(
                  itemCount: viewModel.cryptos.length,
                  itemBuilder: (context, index) {
                    final CryptoModel crypto = viewModel.cryptos[index];
                    return ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => CryptoDetailSheet(crypto: crypto),
                        );
                      },
                      title: Text('${crypto.name} (${crypto.symbol})'),
                      subtitle: Text(
                        'USD: \$${crypto.priceUSD.toStringAsFixed(2)}  |  BRL: R\$${crypto.priceBRL.toStringAsFixed(2)}',
                      ),
                      trailing: Text(
                        '${crypto.percentChange24h.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color:
                              crypto.percentChange24h >= 0
                                  ? Colors.green
                                  : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
