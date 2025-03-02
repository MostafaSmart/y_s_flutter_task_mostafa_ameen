import 'package:equatable/equatable.dart';

abstract class StockEvent extends Equatable {
  @override
  List<Object?> get props => [];
  
}

class FetchStocks extends StockEvent {}

class RefreshStocks extends StockEvent {}
class SearchStocks extends StockEvent {
  final String query;
  SearchStocks(this.query);

  @override
  List<Object?> get props => [query];
}
class FetchDetails extends StockEvent {
  final String stockSymbol;

  FetchDetails(this.stockSymbol);

  @override
  List<Object?> get props => [stockSymbol];
}