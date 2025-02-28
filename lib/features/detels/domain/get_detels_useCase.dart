import 'package:dartz/dartz.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/failure_class.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/success.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/repository/Detels_Repository.dart';

class GetDetelsStockUseCase {
  final DetelsRepository repository = DetelsRepositorImpl();

  GetDetelsStockUseCase();
  Future<Either<Failure, Success>> call(String symbol) async {
    return await repository.getStockDetels(symbol);
  }
}
