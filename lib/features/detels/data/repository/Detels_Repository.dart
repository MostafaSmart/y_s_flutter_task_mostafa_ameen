import 'package:dartz/dartz.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/app_exception.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/failure_class.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/network_info.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/success.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/hive/hive_service.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/sources/Detels_remote_data_sources.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/sources/stock_remote_data_sources.dart';

abstract class DetelsRepository {
  Future<Either<Failure, Success>> getStockDetels(String symbol);
}

class DetelsRepositorImpl implements DetelsRepository {
  HiveService hiveService = HiveService();

  DetelsRemoteDataSources remoteDataSource = DetelsRemoteDataSourcesImpl();


  NetworkInfo networkInfo = NetworkInfoImpl();
  @override
  Future<Either<Failure, Success>> getStockDetels(String symbol) async {
    var result = await _handleErrors(() async {
      return await remoteDataSource.getStockDetels(symbol);
    });
    return result is Success ? Right(result) : Left(result);
  }

  Future _handleErrors(Function registerFunc) async {
    try {
      if (await networkInfo.isConnected) {
        return await registerFunc();
      } else {
        final datas = await hiveService.getStocks();
        print('connectrion offline get from cach');

        return ServerSuccess(
            message: 'offline!', code: "from offline ", data: datas);
      }

      // return OfflineFailure(message: "offline error");
    } on AppException catch (e) {
      print(">>>>>>>>>>Catch AppException in auth repository: ${e.failure}");
      return (e.failure as ServerFailure);
    } catch (e) {
      print(">>>>>>>>>>Catch Exception in auth repository: $e");
      return NotSpecificFailure(message: e.toString());
    }
  }
}
