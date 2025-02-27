import 'package:dartz/dartz.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/app_exception.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/failure_class.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/network_info.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/success.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/sources/stock_remote_data_sources.dart';

abstract class StockRepository {
  Future<Either<Failure, Success>> getTopStock();



}

class StockRepositorImpl implements StockRepository {
 StockRemoteDataSources remoteDataSource = StockRemoteDataSourcesImpl();
NetworkInfo networkInfo = NetworkInfoImpl();
  @override
  Future<Either<Failure, Success>> getTopStock() async {
    var result = await _handleErrors(() async {
      return await remoteDataSource.getTopStock();
    });
    return result is Success ? Right(result) : Left(result);
  }
 

 
  Future _handleErrors(Function registerFunc) async {
    try {
      if (await networkInfo.isConnected) {
        return await registerFunc();
      }

      print('connectrion EEEEEEEeeerore');
      return OfflineFailure(message: "offline error");
    } on AppException catch (e) {
      print(">>>>>>>>>>Catch AppException in auth repository: ${e.failure}");
      return (e.failure as ServerFailure);
    } catch (e) {
      print(">>>>>>>>>>Catch Exception in auth repository: $e");
      return NotSpecificFailure(message: e.toString());
    }
  }
  

}


