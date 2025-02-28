import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/models/StockDetelsModel.dart';

class StockChart extends StatelessWidget {
  final List<StockDetelsModel> stockData;

  const StockChart({super.key, required this.stockData});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toStringAsFixed(0),
                      style: const TextStyle(fontSize: 12),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index >= 0 && index < stockData.length) {
                      return Text(
                        stockData[index].date, 
                        style: const TextStyle(fontSize: 10),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey, width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: stockData.asMap().entries.map((entry) {
                  int index = entry.key;
                  StockDetelsModel stock = entry.value;
                  return FlSpot(index.toDouble(), stock.close);
                }).toList(),
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
