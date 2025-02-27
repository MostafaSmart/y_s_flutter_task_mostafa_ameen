import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/data/models/stock_model.dart';

class StockItem extends StatelessWidget {
  final Stock stackItem;
  final double percentageChange;

  const StockItem({
    required this.stackItem,
    required this.percentageChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://logo.clearbit.com/${stackItem.stockExchange.website}",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Icon(Icons.business, size: 50, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stackItem.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      stackItem.symbol,
                      style: theme.textTheme.bodyLarge?.copyWith(),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Exchange:',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Text(stackItem.stockExchange.name,
                        style: theme.textTheme.bodyMedium),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Acronym:',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Text(stackItem.stockExchange.acronym,
                        style: theme.textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  percentageChange >= 0
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  color: percentageChange >= 0 ? Colors.green : Colors.red,
                  size: 16,
                ),
                Text(
                  "${percentageChange.toStringAsFixed(2)}%",
                  style: TextStyle(
                    color: percentageChange >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) {}
}
