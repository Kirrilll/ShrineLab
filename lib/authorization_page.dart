import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/main_page.dart';
import 'package:shrine/models/user.dart';


class Authorization extends StatefulWidget {

  final void Function(User) setUser;
  const Authorization({Key? key, required this.setUser}) : super(key: key);

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
                        widget.setUser(User(_loginController.text, _passwordController.text));
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