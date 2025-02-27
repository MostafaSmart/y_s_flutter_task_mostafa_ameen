import 'package:dartz/dartz.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/failure_class.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/success.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/repository/stock_Repository.dart';

class GetStockUseCase {
  final StockRepository repository = StockRepositorImpl();

  GetStockUseCase();
  Future<Either<Failure, Success>> call() async {
    return await repository.getTopStock();
  }
}
