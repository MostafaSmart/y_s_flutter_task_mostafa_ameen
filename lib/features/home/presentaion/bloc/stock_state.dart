import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/models/StockDetelsModel.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/models/stock_model.dart';

import 'package:equatable/equatable.dart';

abstract class StockState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<Stock> stocks;
  final DateTime lastUpdated;
  final bool isRefreshing;

  StockLoaded(this.stocks,
      {required this.lastUpdated, this.isRefreshing = false});

  @override
  List<Object?> get props => [stocks, lastUpdated, isRefreshing];
}

class StockError extends StockState {
  final String message;
  final int errorCode;

  StockError(this.message, {this.errorCode = 0});

  @override
  List<Object?> get props => [message, errorCode];
}

class StockDetailsLoaded extends StockState {
  final List<StockDetelsModel> stockDetails;

  StockDetailsLoaded(this.stockDetails);

  @override
  List<Object?> get props => [stockDetails];
}