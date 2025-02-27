import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/models/stock_model.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/domain/usecase/get_top_stock_usescase.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_event.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockUseCase getStockUseCase = GetStockUseCase();
  final List<Stock> allStocks = [];

  StockBloc() : super(StockInitial()) {
    on<FetchStocks>(_onFetchStocks);
    on<RefreshStocks>(_onRefreshStocks);
    on<SearchStocks>(_onSearchStocks);

  }

  Future<void> _onFetchStocks(
      FetchStocks event, Emitter<StockState> emit) async {
    emit(StockLoading());
    try {
      (await getStockUseCase.call()).fold(
        (failure) {
          emit(StockError("Failed to fetch stocks"));
          print(failure);
        },
        (secsses) {
          // AppUtil.showMessage(user.message);
          allStocks
            ..clear()
            ..addAll(secsses.data);

          emit(StockLoaded(secsses.data, lastUpdated: DateTime.now()));
          print(secsses.message);
        },
      );
    } catch (e) {
      emit(StockError("Failed to fetch stocks", errorCode: 500));
      print(e.toString());
    }
  }

  Future<void> _onRefreshStocks(
      RefreshStocks event, Emitter<StockState> emit) async {
    if (state is StockLoaded) {
      final currentStocks = (state as StockLoaded).stocks;
      emit(StockLoaded(currentStocks,
          lastUpdated: DateTime.now(), isRefreshing: true));
    }

    try {
      (await getStockUseCase.call()).fold(
        (failure) {
          emit(StockError("Failed to refresh  stocks"));
        },
        (secsses) {
          // AppUtil.showMessage(user.message);
          allStocks
            ..clear()
            ..addAll(secsses.data);
          emit(StockLoaded(secsses.data, lastUpdated: DateTime.now()));
        },
      );
    } catch (e) {
      emit(StockError("Failed to refresh  stocks", errorCode: 500));
    }
  }

  void _onSearchStocks(SearchStocks event, Emitter<StockState> emit) {
    if (state is StockLoaded) {
      final filteredStocks = allStocks
          .where((stock) =>
              stock.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(StockLoaded(filteredStocks, lastUpdated: DateTime.now()));
    }
  }
}
