import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/theme/theme_cubit.dart';

import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/models/StockDetelsModel.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/presentaion/widgets/heder.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/presentaion/widgets/stock_chart.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/models/stock_model.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_bloc.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_state.dart';

class StockDetailsScreen extends StatelessWidget {
  final Stock stackItem;

  StockDetailsScreen({required this.stackItem});
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView( 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadrDetails(stackItem: stackItem),
          Container(
            margin: const EdgeInsets.only(right: 16, top: 16, left: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stock Chart 5 Days",
                    style: Theme.of(context).textTheme.titleLarge),
                const Icon(Icons.trending_up, color: Colors.green, size: 24),
              ],
            ),
          ),
          const SizedBox(height: 16),


          BlocBuilder<StockBloc, StockState>(
        builder: (context, state) {
          if (state is StockLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is StockError) {
            return Center(child: Text(state.message));
          }
          if (state is StockDetailsLoaded) {
            return StockChart(stockData: state.stockDetails);
          }
          return const Center(child: Text('No data available'));
        },
      ),




          // StockChart(stockSymbol: stackItem.symbol),
        ],
      ),
    ),
  );
}
}
