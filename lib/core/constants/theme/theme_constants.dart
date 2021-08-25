import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeConstants? _instance;
  static ThemeConstants get instance {
    _instance ??= ThemeConstants._init();
    return _instance!;
  }

  ThemeConstants._init();

  ThemeData get themeData => ThemeData(
        colorScheme: buildColorScheme,
        appBarTheme: buildAppBarTheme,
        scaffoldBackgroundColor: buildColorScheme.secondary,
        bottomNavigationBarTheme: buildbottomNavigationBarTheme,
        textButtonTheme: buildtextButtonTheme,
      );

  TextButtonThemeData get buildtextButtonTheme {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(buildColorScheme.background),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 8)),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  BottomNavigationBarThemeData get buildbottomNavigationBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: buildColorScheme.secondary,
      selectedItemColor: buildColorScheme.background,
      unselectedItemColor: buildColorScheme.background,
      elevation: 0,
    );
  }

  AppBarTheme get buildAppBarTheme => AppBarTheme(
        backgroundColor: buildColorScheme.secondary,
        centerTitle: false,
        titleSpacing: NavigationToolbar.kMiddleSpacing * 0.1,
        elevation: 0,
      );

  ColorScheme get buildColorScheme => ColorScheme(
        primary: Color(0xfffb0006),
        primaryVariant: Colors.white,
        secondary: Color(0xff191919),
        secondaryVariant: Color(0xff191919),
        surface: Colors.transparent,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Color(0xff191919),
        onSecondary: Color(0xff191919),
        onSurface: Colors.grey.shade700,
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.dark,
      );
}
