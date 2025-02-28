import 'package:dio/dio.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/api_conset.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/app_exception.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/failure_class.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/api/success.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/hive/hive_service.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/models/detels_response.dart';

abstract class DetelsRemoteDataSources {
  Future<Success> getStockDetels(String symbol);
}

class DetelsRemoteDataSourcesImpl implements DetelsRemoteDataSources {
  final Dio dio = Dio();
    HiveService hiveService = HiveService();

  @override
  Future<Success> getStockDetels(String symbol) async {
    final url = "${ApiConstants.getHistoricalStockPrices}$symbol&limit=5";
    print(url);

    final response = await _getHandleErrors(urlEndPoind: url);

    return response;
  }

  Future<Success> _getHandleErrors({required String urlEndPoind}) async {
    final response = await dio.get(urlEndPoind);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('respoonse :   ${response.data}');
      final s_list = DetelsResponse.fromJson(response.data);

      print('respoonse listStockDetels :   ${s_list.listStockDetels}');

      // await hiveService.saveStocks(s_list.stocks);

      return ServerSuccess(
          message: 'done!',
          code: response.statusCode.toString(),
          data: s_list.listStockDetels);
    } else {
      print('Error remote :   ${response.statusMessage}');

      throw AppException(ServerFailure(
          message: 'Error',
          code: response.statusCode.toString(),
          errors: response.statusMessage));
    }
  }
}

// https://api.marketstack.com/v1/eod?access_key=fe999907b556243b584c87671db653b9&symbols=AAPL&limit=5
// https://api.marketstack.com/v1/tickers?access_key=dc1d98bdc76c383df34c82d4bca85d9dMSFT&limit=5
