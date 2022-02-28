import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
                children: const [
                  SizedBox(height: 60),
                  Icon(
                    Icons.adb_rounded,
                    size: 30,
                  ),
                  Text(
                    'SHRINE',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
              const SizedBox(height: 120),
              TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                    filled: true,
                    labelText: "Username"
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    filled: true,
                    labelText: "Username"
                ),
                obscureText: true,
              ),
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: (){
                        _loginController.clear();
                        _passwordController.clear();

                      },
                      child: const Text('CANCEL')
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, 'home');
                      },
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
