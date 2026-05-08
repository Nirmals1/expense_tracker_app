import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/theme_controller.dart';
import 'navigation/main_shell.dart';

class ExpenseApp extends ConsumerWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(appThemeModeProvider);
    final seed = ref.watch(appThemeSeedProvider);

    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      themeMode: mode,
      theme: AppTheme.light(seed),
      darkTheme: AppTheme.dark(seed),
      home: const MainShell(),
    );
  }
}
