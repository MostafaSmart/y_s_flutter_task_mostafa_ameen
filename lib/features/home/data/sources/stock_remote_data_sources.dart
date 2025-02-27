import 'package:dio/dio.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/api_conset.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/app_exception.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/failure_class.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/success.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/models/stock_response.dart';

abstract class StockRemoteDataSources {
  Future<Success> getTopStock();
}

class StockRemoteDataSourcesImpl implements StockRemoteDataSources {
  final Dio dio = Dio();

  @override
  Future<Success> getTopStock() async {
    final url = ApiConstants.getTopStocks;

    final response = await _getHandleErrors(urlEndPoind: url);

    return response;
  }

  Future<Success> _getHandleErrors({required String urlEndPoind}) async {
    final response = await dio.get(urlEndPoind);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('respoonse :   ${response.data}');
      final s_list = StockResponse.fromJson(response.data);

      return ServerSuccess(
          message: 'done!', code: response.statusCode.toString(), data: s_list);


    } else {
      print('Error remote :   ${response.statusMessage}');

      throw AppException(ServerFailure(
          message: 'Error',
          code: response.statusCode.toString(),
          errors: response.statusMessage));
    }
  }
}
