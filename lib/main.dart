import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/theme/app_theme.dart';
import 'package:y_s_flutter_task_mostafa_ameen/core/theme/theme_cubit.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_bloc.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/bloc/stock_event.dart';
import 'package:y_s_flutter_task_mostafa_ameen/features/home/presentaion/screen/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('stocksBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => StockBloc()..add(FetchStocks())), 
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Stock Market Tracker',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}