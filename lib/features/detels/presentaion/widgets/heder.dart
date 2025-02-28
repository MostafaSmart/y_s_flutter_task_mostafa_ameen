import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:lucide_icons/lucide_icons.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/detels/data/models/StockDetelsModel.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/models/stock_model.dart';

class HeadrDetails extends StatelessWidget {
  final Stock stackItem;

  HeadrDetails({required this.stackItem});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(right: 16, left: 16, top: 30, bottom: 12),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stackItem.name,
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  
                     ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://logo.clearbit.com/${stackItem.stockExchange.website}",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            Icon(Icons.business, size: 50, color: Colors.grey),
                      ),
                    
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stackItem.symbol,
                style: TextStyle(color: Colors.greenAccent, fontSize: 16),
              ),
              Text(
                'S&P 500: 4321.56 ↑',
                style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[900] : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Exchange:',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(stackItem.stockExchange.name,
                    style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
