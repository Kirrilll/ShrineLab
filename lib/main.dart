import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/authorization_page.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/main_page.dart';
import 'package:shrine/models/user.dart';


void main() {
  runApp(const MyApp());
}
ThemeData _buildThemeData(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      )
    ),
  );
}

final ThemeData _themeData = _buildThemeData();

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6!.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,

  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User _user = User('default', 'default');

  void setUser(User user){
    setState(() {
      _user = user;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      theme: _themeData,
      home:  Authorization(setUser: setUser),

      routes:  {
        'auth': (_) =>  Authorization(setUser: setUser),
        'home': (_) =>  MainPage(user: _user,)
      },
    );
  }
}

