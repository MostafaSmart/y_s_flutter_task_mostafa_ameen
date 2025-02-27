import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/domain/usecase/get_top_stock_usescase.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_event.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockUseCase getStockUseCase = GetStockUseCase();

  StockBloc() : super(StockInitial()) {
    on<FetchStocks>(_onFetchStocks);
    on<RefreshStocks>(_onRefreshStocks);
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

          emit(StockLoaded(secsses.data, lastUpdated: DateTime.now()));
        },
      );
    } catch (e) {
      emit(StockError("Failed to refresh  stocks", errorCode: 500));
    }
  }
}
