import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StockItem extends StatelessWidget {
  final String name;
  final String symbol;
  final String exchange;
  final String exchangeAcronym;
  final String exchangeWebsite;
  final String companyDomain;
  final double percentageChange;

  const StockItem({
    required this.name,
    required this.symbol,
    required this.exchange,
    required this.exchangeAcronym,
    required this.exchangeWebsite,
    required this.companyDomain,
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
                    imageUrl: "https://logo.clearbit.com/$companyDomain",
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
                      name,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      symbol,
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
                    Text(exchange, style: theme.textTheme.bodyMedium),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Acronym:',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Text(exchangeAcronym, style: theme.textTheme.bodyMedium),
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
