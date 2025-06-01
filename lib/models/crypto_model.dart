class CryptoModel {
  final int id;
  final String name;
  final String symbol;
  final double priceUSD;
  final double priceBRL;
  final double percentChange24h;

  CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUSD,
    required this.priceBRL,
    required this.percentChange24h,
  });

  factory CryptoModel.fromMap(Map<String, dynamic> map) {
    return CryptoModel(
      id: map['id'],
      name: map['name'],
      symbol: map['symbol'],
      priceUSD: map['quote']['USD']['price'].toDouble(),
      priceBRL: map['quote']['BRL'] != null ? map['quote']['BRL']['price'].toDouble() : 0.0,
      percentChange24h: map['quote']['USD']['percent_change_24h'].toDouble(),
    );
  }
}
