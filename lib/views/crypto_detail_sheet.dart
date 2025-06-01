import 'package:flutter/material.dart';
import '../models/crypto_model.dart';
import 'package:intl/intl.dart';

class CryptoDetailSheet extends StatelessWidget {
  final CryptoModel crypto;

  const CryptoDetailSheet({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatterBRL = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    final formatterUSD = NumberFormat.currency(locale: 'en_US', symbol: '\$');

    return Container(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          Text(
            '${crypto.name} (${crypto.symbol})',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text('Preço atual: ${formatterUSD.format(crypto.priceUSD)} (USD)'),
          Text('Preço atual: ${formatterBRL.format(crypto.priceBRL)} (BRL)'),
          Text('Variação 24h: ${crypto.percentChange24h.toStringAsFixed(2)}%'),
        ],
      ),
    );
  }
}
