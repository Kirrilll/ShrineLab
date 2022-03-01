import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/main_page.dart';


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


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: _themeData,
      home: const Authorization(),

      routes:  {
        'auth': (_) => const Authorization(),
        'home': (_) => const MainPage()
      },
    );
  }
}

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {

  final TextEditingController _loginController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _loginFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                children:  [
                  const SizedBox(height: 60),
                  const Icon(
                    Icons.adb_rounded,
                    size: 30,
                  ),
                  Text(
                    'SHRINE',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const SizedBox(height: 120),
              TextField(
                controller: _loginController,
                decoration:  InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      color: _loginFocusNode.hasFocus
                          ? Theme.of(context).colorScheme.secondary
                          : _unfocusedColor
                    )
                ),
                focusNode: _loginFocusNode,

              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: _passwordFocusNode.hasFocus
                          ? Theme.of(context).colorScheme.secondary
                          : _unfocusedColor
                    )
                ),
                obscureText: true,
                focusNode: _passwordFocusNode,
              ),
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: (){
                        _loginController.clear();
                        _passwordController.clear();
                      },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary,
                        ),
                        shape: MaterialStateProperty.all(
                          const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          ),
                        )
                    ),
                      child:  Text(
                          'CANCEL',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary
                        ),
                      ),

                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, 'home');
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(8.0),
                        shape: MaterialStateProperty.all(
                          const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          ),
                        )
                      ),
                      child: const Text('NEXT')
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
