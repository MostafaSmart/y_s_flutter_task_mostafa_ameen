import 'package:equatable/equatable.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/models/StockDetelsModel.dart';

class DetelsResponse extends Equatable {
  final List<StockDetelsModel> listStockDetels;

  const DetelsResponse({required this.listStockDetels});

  factory DetelsResponse.fromJson(Map<String, dynamic> json) {
    return DetelsResponse(
      listStockDetels: (json['data'] as List).map((stock) => StockDetelsModel.fromJson(stock)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': listStockDetels.map((stock) => stock.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [listStockDetels];
}
