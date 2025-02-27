import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final Box settingsBox = Hive.box('settings');

  ThemeCubit() : super(ThemeMode.light) {
    bool isDark = settingsBox.get('isDark', defaultValue: false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    bool isDark = state == ThemeMode.light;
    settingsBox.put('isDark', isDark); 
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
