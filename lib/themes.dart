import 'package:flutter/material.dart';

enum ThemeType {
  Theme_Light,
}

/// AppTheme is the primary means of styling colors in your application.
/// Use provider to lookup and bind to the current theme:
//      AppTheme theme = context.watch();
//      return Container(color: theme.accentColor);
class AppTheme {
  static ThemeType defaultTheme = ThemeType.Theme_Light;

  ThemeType type;
  final bool isDark;
  final Color bg1;
  final Color bgDisabled;
  final Color surface1;
  final Color accent1;
  //final Color greyWeak;
  //final Color grey;
  //final Color greyMedium;
  //final Color greyStrong;
  final Color focus;
  final MaterialColor mainMaterialColor;

  /// Darkness adjusted text color. Will be Black in light mode, and White in dark
  final Color mainTextColor;
  final Color inverseTextColor;

  static const int _mainColorValue = 0xFF0070AD;
  static const Color mainColor = Color(_mainColorValue);
  static const MaterialColor mainMaterialColor2 = MaterialColor(
    _mainColorValue,
    <int, Color>{
      50: Color.fromRGBO(0, 112, 173, .1),
      100: Color.fromRGBO(0, 112, 173, .2),
      200: Color.fromRGBO(0, 112, 173, .3),
      300: Color.fromRGBO(0, 112, 173, .4),
      400: Color.fromRGBO(0, 112, 173, .5),
      500: Color.fromRGBO(0, 112, 173, .6),
      600: Color.fromRGBO(0, 112, 173, .7),
      700: Color.fromRGBO(0, 112, 173, .8),
      800: Color.fromRGBO(0, 112, 173, .9),
      900: Color.fromRGBO(0, 112, 173, 1)
    },
  );

  /// Default constructor
  AppTheme({
      this.type,
      this.bg1,
      this.bgDisabled,
      this.surface1,
      this.accent1,
      //this.greyWeak,
      //this.grey,
      //this.greyMedium,
      //this.greyStrong,
      this.focus,
      this.mainMaterialColor,
      this.mainTextColor,
      this.inverseTextColor,
      this.isDark
    }) {
    //mainTextColor = isDark ? Colors.white : Colors.black;
    //inverseTextColor =
    //    inverseTextColor ?? (isDark ? Colors.black : Colors.white);
  }

  /// Creates an AppTheme from a provided Type.
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.Theme_Light:
        return AppTheme(
          type: t,
          bg1: Colors.white,
          bgDisabled: Colors.grey,
          surface1: Colors.black,
          accent1: mainColor,
          //greyWeak: const Color(0xcccccccc),
          //grey: const Color(0xff999999),
          //greyMedium: const Color(0xff747474),
          //greyStrong: const Color(0xff333333),
          focus: const Color(0xffd81e1e),
          mainMaterialColor: mainMaterialColor2,
          mainTextColor: Colors.black,
          inverseTextColor: Colors.blueGrey,
          isDark: false,
        );
    }
    return AppTheme.fromType(defaultTheme);
  }

  // Converts AppTheme into a Material Theme Data, using whatever mappings we like
  ThemeData get themeData {
    var t = ThemeData.from(
      // Use the .dark() and .light() constructors to handle the text themes
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      // Use ColorScheme to generate the bulk of the color theme
      colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: accent1,
          primaryVariant: shift(accent1, .1),
          secondary: accent1,
          secondaryVariant: shift(accent1, .1),
          background: bg1,
          surface: surface1,
          onBackground: mainTextColor,
          onSurface: mainTextColor,
          onError: mainTextColor,
          onPrimary: inverseTextColor,
          onSecondary: inverseTextColor,
          error: focus),
    );
    // Apply additional styling that is missed by ColorScheme
    t.copyWith(
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: surface1,
          selectionHandleColor: Colors.transparent,
          selectionColor: surface1,
        ),
        buttonColor: accent1,
        highlightColor: shift(accent1, .1),
        toggleableActiveColor: accent1);
    // All done, return the ThemeData
    return t;
  }

  /// This will add luminance in dark mode, and remove it in light.
  // Allows the view to just make something "stronger" or "weaker" without worrying what the current theme brightness is
  //      color = theme.shift(someColor, .1); //-10% lum in dark mode, +10% in light mode
  Color shift(Color c, double amt) {
    amt *= (isDark ? -1 : 1);
    var hslc = HSLColor.fromColor(c); // Convert to HSL
    double lightness =
        (hslc.lightness + amt).clamp(0, 1.0) as double; // Add/Remove lightness
    return hslc.withLightness(lightness).toColor(); // Convert back to Color
  }
}
