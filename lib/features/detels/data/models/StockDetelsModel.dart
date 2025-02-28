import 'package:equatable/equatable.dart';

class StockDetelsModel extends Equatable {
  final String symbol;
  final String exchange;
  final double open;
  final double high;
  final double low;
  final double close;
  final String date;

  const StockDetelsModel({
    required this.symbol,
    required this.exchange,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.date,
  });

  factory StockDetelsModel.fromJson(Map<String, dynamic> json) {
    return StockDetelsModel(
      symbol: json['symbol'] ?? '',
      exchange: json['exchange'] ?? '',
      open: json['open']?.toDouble() ?? 0.0,
      high: json['high']?.toDouble() ?? 0.0,
      low: json['low']?.toDouble() ?? 0.0,
      close: json['close']?.toDouble() ?? 0.0,
      date: json['date']?.substring(0, 10) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'exchange': exchange,
      'open': open,
      'high': high,
      'low': low,
      'close': close,
      'date': date,
    };
  }

  @override
  List<Object?> get props => [symbol, exchange, open, high, low, close, date];
}
