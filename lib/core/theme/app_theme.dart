import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Central theme tokens for the portfolio app. Dark mode is the primary
/// experience per the tech spec, with a light mode toggle available.
class AppTheme {
  AppTheme._();

  static TextTheme _textTheme(Color primary, Color secondary) {
    final base = GoogleFonts.robotoTextTheme();
    final display = GoogleFonts.playfairDisplayTextTheme();
    return base
        .copyWith(
          displayLarge: display.displayLarge?.copyWith(color: primary),
          displayMedium: display.displayMedium?.copyWith(color: primary),
          displaySmall: display.displaySmall?.copyWith(color: primary),
          headlineLarge: display.headlineLarge?.copyWith(color: primary),
          headlineMedium: display.headlineMedium?.copyWith(color: primary),
          headlineSmall: display.headlineSmall?.copyWith(color: primary),
          titleLarge: base.titleLarge?.copyWith(color: primary, fontWeight: FontWeight.w600),
          titleMedium: base.titleMedium?.copyWith(color: primary, fontWeight: FontWeight.w600),
          titleSmall: base.titleSmall?.copyWith(color: primary, fontWeight: FontWeight.w500),
          bodyLarge: base.bodyLarge?.copyWith(color: primary),
          bodyMedium: base.bodyMedium?.copyWith(color: secondary),
          bodySmall: base.bodySmall?.copyWith(color: secondary),
          labelLarge: base.labelLarge?.copyWith(color: primary),
        )
        .apply(bodyColor: primary, displayColor: primary);
  }

  static ThemeData get dark {
    final colorScheme = const ColorScheme.dark(
      primary: AppColors.gold,
      onPrimary: AppColors.navyDeep,
      secondary: AppColors.goldBright,
      surface: AppColors.navySurface,
      onSurface: AppColors.textPrimaryDark,
      error: AppColors.error,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.navyDeep,
      textTheme: _textTheme(AppColors.textPrimaryDark, AppColors.textSecondaryDark),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.navyDeep,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: AppColors.navySurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.navySurfaceAlt,
        labelStyle: const TextStyle(color: AppColors.textPrimaryDark, fontSize: 13),
        side: BorderSide(color: AppColors.gold.withValues(alpha: 0.35)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.navyDeep,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.navySurface,
        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.textSecondaryDark,
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme: DividerThemeData(color: AppColors.gold.withValues(alpha: 0.15)),
    );
  }

  static ThemeData get light {
    final colorScheme = const ColorScheme.light(
      primary: AppColors.gold,
      onPrimary: AppColors.navyDeep,
      secondary: AppColors.navyDeep,
      surface: AppColors.lightSurface,
      onSurface: AppColors.textPrimaryLight,
      error: AppColors.error,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.lightBg,
      textTheme: _textTheme(AppColors.textPrimaryLight, AppColors.textSecondaryLight),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBg,
        foregroundColor: AppColors.textPrimaryLight,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightBg,
        labelStyle: const TextStyle(color: AppColors.textPrimaryLight, fontSize: 13),
        side: BorderSide(color: AppColors.gold.withValues(alpha: 0.5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.navyDeep,
          foregroundColor: AppColors.gold,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        selectedItemColor: AppColors.navyDeep,
        unselectedItemColor: AppColors.textSecondaryLight,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
