import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/theme/theme_cubit.dart';

import 'package:flutter/material.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/widgets/home_head.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/widgets/stock_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          Container(
            margin: EdgeInsets.only(right: 16, top: 16, left: 8),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                Text("Trending Stocks",
                    style: Theme.of(context).textTheme.titleLarge),
                Icon(Icons.trending_up, color: Colors.green, size: 24),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}



