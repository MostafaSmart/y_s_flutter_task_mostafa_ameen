import 'package:equatable/equatable.dart';
import 'stock_exchange_model.dart';

class Stock extends Equatable {
  final String name;
  final String symbol;
  final bool hasIntraday;
  final bool hasEod;
  final StockExchange stockExchange;

  const Stock({
    required this.name,
    required this.symbol,
    required this.hasIntraday,
    required this.hasEod,
    required this.stockExchange,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      name: json['name'] ?? 'Unknown Stock',
      symbol: json['symbol'] ?? '',
      hasIntraday: json['has_intraday'] ?? false,
      hasEod: json['has_eod'] ?? false,
      stockExchange: StockExchange.fromJson(json['stock_exchange'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
      'has_intraday': hasIntraday,
      'has_eod': hasEod,
      'stock_exchange': stockExchange.toJson(),
    };
  }

  @override
  List<Object?> get props => [name, symbol, hasIntraday, hasEod, stockExchange];
}
