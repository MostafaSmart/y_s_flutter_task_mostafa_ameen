import 'package:equatable/equatable.dart';
import 'stock_model.dart';

class StockResponse extends Equatable {
  final List<Stock> stocks;

  const StockResponse({required this.stocks});

  factory StockResponse.fromJson(Map<String, dynamic> json) {
    return StockResponse(
      stocks: (json['data'] as List).map((stock) => Stock.fromJson(stock)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': stocks.map((stock) => stock.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [stocks];
}
