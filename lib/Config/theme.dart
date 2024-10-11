import 'package:flutter/material.dart';

class MobikulTheme {
  // static const Color clientPrimaryColor =
  //     Color(0xFFFF9600); // replace with client primary color
  static const Color clientPrimaryColorA = Color(0xFF416BFF);
  static const Color clientPrimaryColor =
      Color(0xFF416BFF); // replace with client primary color
  static const Color clientAccentColor =
      Color(0xFF2EAE7D); // replace with client accent color

  static const Color lightGrey = Color(0xffe8e5e5);
  static const Color whiteGrey = Color(0xffF4F4F4);
  static const Color lightGreyTest = Color(0xfff7f7f7);
  static const Color lightGreyTestA = Color(0xffE4E4E4);
  static const Color appbarTextColor = Color(0xFF000000);
}

class AppTheme {
  AppTheme._();

  static const Color cashbackPointColor = Color(0xFF16A085);
  static final Color _iconColor = Colors.blueAccent.shade200;

  static const Color _lightPrimaryColor = MobikulTheme.clientPrimaryColor;
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
      fontFamily: 'SF-Pro-Display',
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: MobikulTheme.appbarTextColor,
        ),
        titleTextStyle: TextStyle(
          color: MobikulTheme.appbarTextColor,
          fontSize: 20,
          fontFamily: 'SF-Pro-Display',
          fontWeight: FontWeight.bold,
        ),
        color: _darkSecondaryColor,
        iconTheme: IconThemeData(
          color: MobikulTheme.appbarTextColor,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.black12, cursorColor: Colors.green),
      colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        secondaryContainer: _lightPrimaryVariantColor,
        // primaryVariant: _lightPrimaryVariantColor,
        secondary: _lightSecondaryColor,
        onPrimary: MobikulTheme.clientAccentColor,
      ),
      iconTheme: const IconThemeData(
        color: _lightOnPrimaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _lightOnPrimaryColor),
      textTheme: _lightTextTheme,
      dividerTheme: const DividerThemeData(color: Colors.black12),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: MobikulTheme.clientPrimaryColor,
      ),
      scaffoldBackgroundColor: _darkSecondaryColor);

  static final ThemeData darkTheme = ThemeData(
      fontFamily: 'SF-Pro-Display',
      scaffoldBackgroundColor: _darkPrimaryVariantColor,
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
            // color: MobikulTheme.appbarTextColor,

            ),
        titleTextStyle: TextStyle(
          // color: MobikulTheme.appbarTextColor,
          fontSize: 20,
          fontFamily: 'SF-Pro-Display',
          fontWeight: FontWeight.bold,
        ),
        // color: MobikulTheme.clientPrimaryColor,

        // iconTheme: IconThemeData(color: MobikulTheme.appbarTextColor,),
      ),
      colorScheme: const ColorScheme.dark(
        primary: _lightPrimaryColor,
        secondaryContainer: _darkPrimaryVariantColor,
        // primaryVariant: _darkPrimaryVariantColor,
        secondary: _darkSecondaryColor,
        onPrimary: _darkOnPrimaryColor,
        background: Colors.white12,
      ),
      iconTheme: const IconThemeData(
        color: _darkOnPrimaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _darkOnPrimaryColor),
      textTheme: _darkTextTheme,
      dividerTheme: const DividerThemeData(color: Colors.black),
      bottomAppBarTheme: const BottomAppBarTheme(color: _darkOnPrimaryColor));

  static final TextTheme _lightTextTheme = TextTheme(
      bodySmall: _bodySmallTextStyle,
      bodyMedium: _bodyMediumTextStyle,
      bodyLarge: _bodyLargeTextStyle,
      titleSmall: _titleSmallTextStyle,
      titleMedium: _titleMediumTextStyle,
      titleLarge: _titleLargeTextStyle,
      labelSmall: _labelSmallTextStyle,
      labelLarge: _labelLargeTextStyle,
      labelMedium: _labelMediumTextStyle);

  static final TextTheme _darkTextTheme = TextTheme(
      bodySmall: _darkBodySmallTextStyle,
      bodyMedium: _darkBodyMediumTextStyle,
      bodyLarge: _darkBodyLargeTextStyle,
      titleSmall: _darkTitleSmallTextStyle,
      titleMedium: _darkTitleMediumTextStyle,
      titleLarge: _darkTitleLargeTextStyle,
      labelSmall: _darkLabelSmallTextStyle,
      labelLarge: _darkLabelLargeTextStyle,
      labelMedium: _darkLabelMediumTextStyle);

  static final TextStyle _bodySmallTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: _lightOnPrimaryColor,
      fontFamily: 'SF-Pro-Display');

  static final TextStyle _bodyMediumTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: _lightOnPrimaryColor,
      fontFamily: 'SF-Pro-Display');

  static final TextStyle _bodyLargeTextStyle = const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: _lightOnPrimaryColor,
      fontFamily: 'SF-Pro-Display');

  static final TextStyle _labelSmallTextStyle = const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: _lightOnPrimaryColor,
      fontFamily:'SF-Pro-Display');

  static final TextStyle _labelMediumTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: _lightOnPrimaryColor,
      fontFamily: 'SF-Pro-Display');

  static final TextStyle _labelLargeTextStyle = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: _lightOnPrimaryColor,
      fontFamily: 'SF-Pro-Display');

  static final TextStyle _titleSmallTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: _lightOnPrimaryColor,
      fontFamily:'SF-Pro-Display');

  static final TextStyle _titleMediumTextStyle = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: _lightOnPrimaryColor,
      fontFamily: 'SF-Pro-Display');

  static final TextStyle _titleLargeTextStyle = const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w100,
      color: _lightOnPrimaryColor,
      fontFamily: 'SF-Pro-Display');

  static final TextStyle _darkBodySmallTextStyle =
      _bodySmallTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkBodyMediumTextStyle =
      _bodyMediumTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkBodyLargeTextStyle =
      _bodyLargeTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkLabelSmallTextStyle =
      _labelSmallTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkLabelMediumTextStyle =
      _labelMediumTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkLabelLargeTextStyle =
      _labelLargeTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkTitleSmallTextStyle =
      _titleSmallTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkTitleMediumTextStyle =
      _titleMediumTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkTitleLargeTextStyle = _titleLargeTextStyle;
}
