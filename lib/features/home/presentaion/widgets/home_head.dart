import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:y_s_flutter_task_mostafa_ameen/core/theme/theme_cubit.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_bloc.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_event.dart';

class HomeHeader extends StatelessWidget {
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
                'Stock Market',
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(LucideIcons.bell, color: theme.iconTheme.color),
                    onPressed: () {
                      BlocProvider.of<ThemeCubit>(context).toggleTheme();
                    },
                  ),
                  IconButton(
                    icon: Icon(LucideIcons.settings,
                        color: theme.iconTheme.color),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Market Status: 🔥 +1.24%',
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
            child: TextField(
                  onChanged: (value) {
                context.read<StockBloc>().add(SearchStocks(value));
              },
              decoration: InputDecoration(
                hintText: 'Search Stocks...',
                hintStyle: TextStyle(color: theme.hintColor),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: theme.iconTheme.color),
              ),
              style: TextStyle(color: theme.textTheme.bodyLarge?.color),
            ),
          ),
        ],
      ),
    );
  }
}


// class HomeHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Stock Market',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(LucideIcons.bell, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Icon(LucideIcons.settings, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Market Status: 🔥 +1.24%',
//                 style: TextStyle(color: Colors.greenAccent, fontSize: 16),
//               ),
//               Text(
//                 'S&P 500: 4321.56 ↑',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey[900],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Stocks...',
//                 hintStyle: TextStyle(color: Colors.white54),
//                 border: InputBorder.none,
//                 icon: Icon(Icons.search, color: Colors.white54),
//               ),
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
