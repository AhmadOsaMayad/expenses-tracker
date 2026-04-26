import 'package:expenses_tracker/core/constants/app_consts.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'views/expenses/expenses_view.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
  runApp(const MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _darkTheme(),
      theme: _lightTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: kLocalizationDelgs,
      supportedLocales: S.delegate.supportedLocales,
      home: const ExpensesView(),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: const CardThemeData().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData().copyWith(
      // scaffoldBackgroundColor: kDarkColorScheme.onInverseSurface,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardThemeData().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
    );
  }
}
