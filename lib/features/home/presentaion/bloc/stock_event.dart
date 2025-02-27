import 'package:equatable/equatable.dart';

abstract class StockEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStocks extends StockEvent {}

class RefreshStocks extends StockEvent {}
