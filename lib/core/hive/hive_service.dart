import 'package:hive_flutter/hive_flutter.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/models/stock_model.dart';

class HiveService {
  static const String boxName = 'stocksBox';

  Future<void> saveStocks(List<Stock> stocks) async {
    final box = Hive.box(boxName);
    List<Map<String, dynamic>> stocksMap =
        stocks.map((stock) => stock.toJson()).toList();
    await box.put('stocks', stocksMap);
  }

  List<Stock> getStocks() {
    final box = Hive.box(boxName);
    final List<dynamic> rawData = box.get('stocks', defaultValue: []);

    if (rawData.isEmpty) {
      print('No stocks found in Hive');
      return [];
    }

    try {
      List<Stock> stocks = rawData.map<Stock>((data) {
        final dataMap =
            Map<String, dynamic>.from(data as Map<dynamic, dynamic>);
        return Stock.fromJson(dataMap);
      }).toList();

      return stocks;
    } catch (e) {
      print('Error loading stocks from Hive: $e');
      return [];
    }
  }
}
