import 'package:flutter/material.dart';

class Themes {
  static const Color kApitepDarkBgColor = Color(0xFF2C4365);
  static const Color kApitepLightBgColor = Color(0xFFA4A6B3);

  static const colorPrimary = Color(0xFF2C4365);
  static const colorAccent = Color.fromARGB(255, 66, 103, 160);

  // keyboard
  static const Color primaryBackground = Color(0xFF121213);
  static const Color buttonBackground = Color(0xFF818384);
  static const Color buttonDisableBackground = Color.fromARGB(255, 54, 54, 54);
  static const Color textColor = Colors.white;
  static const Color correctGuess = Color(0xFF6aaa64);
  static const Color locationGuess = Color(0xFFc9b458);
  static const Color wrongGuess = Color.fromARGB(255, 54, 54, 54);

  static TextTheme textTheme = const TextTheme(
    headline1: TextStyle(fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: TextStyle(fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
    headline4: TextStyle(fontSize: 22, fontWeight: FontWeight.w200, fontStyle: FontStyle.normal, letterSpacing: 2),
    headline5: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
    headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.w200, fontStyle: FontStyle.normal, letterSpacing: 0.15),
    subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: 1.2), //textfield standard input text
    subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 1),
    bodyText1: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, letterSpacing: 1),
    bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.w200, letterSpacing: 0.9),
    button: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.8),
    overline: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  static TextStyle topMenuTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 1.1);
  static TextStyle popupTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: 1.25);
  static TextStyle elevatedButtonTextStyle = const TextStyle(fontFamily: 'roboto', fontSize: 30, fontWeight: FontWeight.w300, letterSpacing: 1.25);

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kApitepDarkBgColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'roboto',
      textTheme: textTheme,
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: kApitepDarkBgColor,
        iconTheme: IconThemeData(color: Colors.white), // back icon
        actionsIconTheme: IconThemeData(color: Colors.white), // action icon buttons that locates on the right side
        centerTitle: true,
        elevation: 15,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: colorBlueMedincell,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(const Size(280, 70)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))),
          backgroundColor: MaterialStateProperty.all<Color>(colorAccent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26),
          textStyle: MaterialStateProperty.all<TextStyle>(elevatedButtonTextStyle),
          elevation: MaterialStateProperty.all<double>(8.0),
        ),
      ),
      cardTheme: CardTheme(
        color: kApitepDarkBgColor.withOpacity(.5),
        margin: const EdgeInsets.all(20.0),
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0), side: const BorderSide(color: Colors.white70, width: 2)),
      ));

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: kApitepLightBgColor,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    fontFamily: 'roboto',
    textTheme: textTheme,
  );

  static const Color appbarColor = Color(0xFF4d9cd5);
  static const Color railColor = Color(0xff282C34); // 0xff2C4365  0xff2D3035 0xff282C34
  static const Color colorBlueMedincell = Color(0xFF4d9cd5);
  static const Color light = Color(0xFFF7F8FC);
  static const Color dark = Color(0xFF363740);
  static const Color lightGrey = Color(0xFFA4A6B3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color bgColor = Color(0xFF2C4365);
  static const Color frontColor = Color(0xFF79CBC7);
  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);
  static const Color frenchGray = Color(0xFFB8BAC1);
  static const Color lavenderGray = Color(0xFFB8BAC1);

  static const MaterialColor kToLight = MaterialColor(
    0xFF4d9cd5, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff5fa6d9), //10%
      100: Color(0xff71b0dd), //20%
      200: Color(0xff82bae2), //30%
      300: Color(0xff94c4e6), //40%
      400: Color(0xffa6ceea), //50%
      500: Color(0xffb8d7ee), //60%
      600: Color(0xffcae1f2), //70%
      700: Color(0xffdbebf7), //80%
      800: Color(0xffedf5fb), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[bgColor, frontColor],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
